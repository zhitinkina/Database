from flask import Flask, render_template, redirect, url_for
from flask_login import LoginManager, login_required

from src.database import fetch_all_from_db
from src.User import User
from api import app as api_app


app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
login_manager = LoginManager(app)
login_manager.login_view = "login"

app.register_blueprint(api_app)


@login_manager.user_loader
def load_user(user_id):
	try:
		login, password = fetch_all_from_db('SELECT login, password FROM public."user" WHERE user_id=%s', (user_id,))[0]
		return User(user_id, login, password)
	except:
		return None


@app.route("/")
@app.route("/index")
def index():
	return render_template("index.html")


@app.route("/login")
def login():
	return render_template("login.html")


@app.route("/signup")
def signup():
	return render_template("signup.html")


@app.route("/later")
def later():
	return render_template("later.html")


@app.route("/product/<id>")
def product(id):
	try:
		row = fetch_all_from_db('SELECT product_id, name, cost, img FROM public."product" WHERE product_id=%s', (id,))[0]
		return render_template("product.html", product={
			"id": row[0],
			"name": row[1],
			"cost": row[2],
			"img": row[3],
		})
	except Exception as ex:
		return redirect(url_for("products"))


@app.route("/products")
def products():
	return render_template("products.html", cards=[{
		"id": row[0],
		"name": row[1],
		"cost": row[2],
		"img": row[3],
		"description": row[4],
	} for row in fetch_all_from_db("SELECT product_id, name, cost, img, description FROM product")])


@app.route("/cart")
def cart():
	return render_template("cart.html")


@app.route("/admin")
@login_required
def admin():
	return render_template("admin.html", categories=[{
		"id": row[0],
		"name": row[1],
	} for row in fetch_all_from_db("SELECT product_id, name FROM product")])


if __name__ == "__main__":
	app.run()
