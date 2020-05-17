from flask_login import UserMixin


class User(UserMixin):
	def __init__(self, user_id, login, password):
		self.id = user_id
		self.login = login
		self.password = password
