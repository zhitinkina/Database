from flask import Blueprint, request
from flask_login import login_user, logout_user, current_user
from werkzeug.utils import secure_filename

from src.database import db_fetch_all, db_execute
from src.User import User


app = Blueprint("app", __name__)


@app.route("/api/signup", methods=["POST"])
def signup():
	from psycopg2 import IntegrityError, errorcodes
	from hashlib import sha512

	form = request.form  # TODO: validate
	try:
		db_execute(
			'INSERT INTO public."user" (login, password, name, email, role_id) VALUES (%s, %s, %s, %s, %s)',
			(form.get("login"), sha512(str.encode(form.get("password"))).hexdigest(), form.get("name"), form.get("email"), 2)
		)
		return "", 200
	except IntegrityError as ex:
		if ex.pgcode == errorcodes.UNIQUE_VIOLATION:
			return "", 409
		raise


@app.route("/api/login", methods=["POST"])
def login():
	from hashlib import sha512

	form = request.form
	login, password = form.get("login"), form.get("password")
	try:
		user_id, user_password = db_fetch_all('SELECT user_id, password FROM public."user" WHERE login=%s', (login,))[0]
		user = User(user_id, login, user_password)
		if user.password == sha512(str.encode(password)).hexdigest():
			login_user(user)
			return "", 200
	except:
		return "", 401
	return "", 401


@app.route("/api/logout", methods=["POST"])
def logout():
	logout_user()
	return "", 200


@app.route("/api/pay_cart", methods=["POST", "PATCH"])  # TODO: PATCH only
def pay_cart():
	if not current_user.is_authenticated:
		return "", 401

	cart_id = db_fetch_all("SELECT get_basket_id_or_create(%s)", (current_user.id,))[0][0]
	db_execute('UPDATE public."basket" SET basket_status_id=2 WHERE basket_id=%s', (cart_id,))
	return "", 200


@app.route("/api/change_product_quantity/<int:product_id>/<int(signed=True):delta>", methods=["POST", "PATCH"])  # TODO: PATCH only
def change_product_quantity(product_id, delta):
	if not current_user.is_authenticated:
		return "", 401

	cart_id = db_fetch_all("SELECT get_basket_id_or_create(%s)", (current_user.id,))[0][0]
	db_execute('SELECT patch_order(%s::BIGINT, %s::BIGINT, %s::SMALLINT);', (cart_id, product_id, delta))
	return "", 200


@app.route("/api/mutate_product", methods=["POST", "PATCH"])  # TODO: PATCH only
def mutate_product():
	from time import time

	if not current_user.is_authenticated:
		return "", 401

	form = request.form  # TODO: validate
	if "img" not in request.files:
		return "", 500

	file = request.files["img"]
	file_name = f"{time()}_{secure_filename(file.filename)}"
	file.save(f"./static/images/{file_name}")
	db_execute('INSERT INTO public."product" (name, cost, description, category_id, img) VALUES (%s, %s, %s, %s, %s)',
	           (form.get("name"), form.get("cost"), form.get("description"), form.get("category"), file_name))
	return "", 200


@app.route("/api/product/<int:product_id>", methods=["GET"])
def get_product(product_id):
	from json import dumps as json_dumps

	try:
		row = db_fetch_all('SELECT product_id, name, category_id, cost, img, description FROM public."product" WHERE product_id=%s', (product_id,))[0]
		return json_dumps({
			"id": row[0],
			"name": row[1],
			"category_id": row[2],
			"cost": row[3],
			"img": row[4],
			"description": row[5],
		}), 200
	except:
		return "", 404
