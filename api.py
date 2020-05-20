from flask import Blueprint, request, redirect, url_for
from flask_login import login_user, logout_user, current_user

from src.database import db_fetch_all, db_execute
from src.User import User


app = Blueprint("app", __name__)


@app.route("/api/signup", methods=["POST"])
def api_register():
	from psycopg2 import IntegrityError, errorcodes

	form = request.form
	try:
		db_execute(
			'INSERT INTO public."user" (login, password, name, email, role_id) VALUES (%s, %s, %s, %s, %s)',
			(form.get("login"), form.get("password"), form.get("name"), form.get("email"), 2)
		)
		return redirect(url_for("index"))
	except IntegrityError as ex:
		if ex.pgcode == errorcodes.UNIQUE_VIOLATION:
			# flash("")
			return "", 409
		raise


@app.route("/api/login", methods=["POST"])
def api_login():
	form = request.form
	login, password = form.get("login"), form.get("password")
	try:
		user_id, password = db_fetch_all('SELECT user_id, password FROM public."user" WHERE login=%s', (login,))[0]
		user = User(user_id, login, password)
		if user.password == password:
			login_user(user)
			return "", 200
	except:
		return "", 401
	return "", 401


@app.route("/api/logout")  # TODO: POST
def api_logout():
	logout_user()
	return "", 200


@app.route("/api/pay_cart", methods=["POST"])
def pay_cart():
	if not current_user.is_authenticated:
		return "", 401

	cart_id = db_fetch_all("SELECT get_basket_id_or_create(%s)", (current_user.id,))[0][0]
	db_execute('UPDATE public."basket" SET basket_status_id=2 WHERE basket_id=%s', (cart_id,))
	return "", 200


@app.route("/api/change_product_quantity/<int:product_id>/<int(signed=True):delta>", methods=["PATCH, POST"])  # TODO: PATCH only
def add_product(product_id, delta):
	if not current_user.is_authenticated:
		return "", 401

	cart_id = db_fetch_all("SELECT get_basket_id_or_create(%s)", (current_user.id,))[0][0]
	db_execute('SELECT patch_order(%s::BIGINT, %s::BIGINT, %s::SMALLINT);', (cart_id, product_id, delta))
	return "", 200
