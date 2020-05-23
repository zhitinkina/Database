from flask import Flask, render_template, redirect, url_for, abort
from flask_login import LoginManager, login_required, current_user

from src.database import db_fetch_all
from src.User import User
from api import app as api_app


app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
login_manager = LoginManager(app)
login_manager.login_view = "login"

app.register_blueprint(api_app)


@app.context_processor
def inject_is_admin():
	role_id = db_fetch_all('SELECT role_id FROM public."user" WHERE user_id=%s', (current_user.id,))[0][0] if current_user.is_authenticated else None
	return dict(is_admin=role_id == 1)


@login_manager.user_loader
def load_user(user_id):
	try:
		login, password = db_fetch_all('SELECT login, password FROM public."user" WHERE user_id=%s', (user_id,))[0]
		return User(user_id, login, password)
	except:
		return None


@app.errorhandler(404)
def page_not_found(e):
	return "404 Not Found", 404


@app.route("/")
@app.route("/index")
def index():
	return render_template("index.html")


@app.route("/about_us")
def about_us():
	return render_template("about_us.html")


@app.route("/contact_us")
def contact_us():
	return render_template("contact_us.html")


@app.route("/partners")
def partners():
	return render_template("partners.html")


@app.route("/login")
def login():
	return render_template("login.html")


@app.route("/signup")
def signup():
	return render_template("signup.html")


@app.route("/product/<int:id>")
def product(id):
	try:
		row = db_fetch_all('SELECT product_id, name, cost::numeric, img FROM public."product" WHERE product_id=%s', (id,))[0]
		return render_template("product.html", product={
			"id": row[0],
			"name": row[1],
			"cost": row[2],
			"img": row[3],
		})
	except Exception as ex:
		return redirect(url_for("products"))


@app.route("/products", defaults={"category": None})
@app.route("/products/<string:category>")
def products(category):
	categories = {
		"face": 1,
		"hair": 2,
		"nails": 3,
		"body": 4,
	}

	sql_where, args = ("WHERE category_id=%s", (categories[category],)) if category in categories.keys() else ("", None)
	return render_template("products.html", cards=[{
		"id": row[0],
		"name": row[1],
		"cost": row[2],
		"img": row[3],
		"description": row[4],
	} for row in db_fetch_all(f"SELECT product_id, name, cost::numeric, img, description FROM product {sql_where}", args)])


@app.route("/cart")
@login_required
def cart():
	cart_id = db_fetch_all("SELECT get_basket_id_or_create(%s)", (current_user.id,))[0][0]
	return render_template("cart.html", products=[{
		"id": row[0],
		"name": row[1],
		"quantity": row[2],
		"img": row[3],
		"cost": row[4],
	} for row in db_fetch_all("""SELECT public."product".product_id, public."product".name, public."order".quantity, public."product".img, public."product".cost::numeric
									FROM public."order"
									LEFT JOIN product ON public."product".product_id = public."order".product_id
									WHERE public."order".basket_id = %s""", (cart_id,))])


@app.route("/admin")
@login_required
def admin():
	role_id = db_fetch_all('SELECT role_id FROM public."user" WHERE user_id=%s', (current_user.id,))[0][0]
	if role_id != 1:
		abort(404)

	return render_template("admin.html", categories=[{
		"id": row[0],
		"name": row[1],
	} for row in db_fetch_all('SELECT category_id, name FROM public."category"')])


if __name__ == "__main__":
	app.run()
