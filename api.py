from flask import Blueprint, request, redirect, url_for
from flask_login import login_user, logout_user

from src.database import fetch_all_from_db, insert_into_db
from src.User import User


app = Blueprint("app", __name__)


@app.route("/api/signup", methods=["POST"])
def api_register():
	from psycopg2 import IntegrityError, errorcodes

	form = request.form
	try:
		insert_into_db(
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
		user_id, password = fetch_all_from_db('SELECT user_id, password FROM public."user" WHERE login=%s', (login,))[0]
		user = User(user_id, login, password)
		if user.password == password:
			login_user(user)
			return "", 200
	except:
		return "", 401
	return "", 401


@app.route("/api/logout")
def api_logout():
	logout_user()
	return "", 200
