from flask import Flask
from flask_restful import Api, Resource
from flask_httpauth import HTTPBasicAuth
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
api = Api(app)
db = SQLAlchemy(app)
auth = HTTPBasicAuth()

app.config['DEBUG'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///crfdb.db'

class UserProfile(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String)
    password = db.Column(db.String)

class Exercise(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    client = db.Column(db.String)
    title = db.Column(db.String)
    reps = db.Column(db.Integer)

@auth.verify_password
def verify_password(username, password):
    if len(UserProfile.query.filter_by(username=username).filter_by(password=password).all()) > 0:
        return username

class ProgramResource(Resource):
    @auth.login_required
    def get(self):
        return [
            {
                'title': exercise.title,
                'reps': exercise.reps
            } for exercise in Exercise.query.filter_by(client=auth.current_user())
        ]

api.add_resource(ProgramResource, '/program')

if __name__ == '__main__':
    app.run()

class ProfileResource(Resource):
    def get(self):
        return {}, 200

api.add_resource(ProfileResource, '/profile')


