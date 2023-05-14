import time

from flask import Flask
from flask_restful import Api, Resource
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///crfdb.db'
app.config['DEBUG'] = True

api = Api(app)
db = SQLAlchemy(app)

class UserProfile(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String)
    last_name = db.Column(db.String)
    is_active = db.Column(db.Boolean)
    loyalty_points = db.Column(db.Integer)
    fitness_goal = db.Column(db.Integer)

class UserProfileListResource(Resource):
    def get(self):
        time.sleep(2)
        return [
            {
                'first_name': profile.first_name,
                'last_name': profile.last_name,
                'is_active': profile.is_active,
                'loyalty_points': profile.loyalty_points,
                'fitness_goal': profile.fitness_goal
            } for profile in UserProfile.query.all()
        ]


api.add_resource(UserProfileListResource, '/profile')

if __name__ == '__main__':
    app.run()