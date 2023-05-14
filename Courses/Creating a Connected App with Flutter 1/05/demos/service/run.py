from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api, Resource

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///crfdb.db'
app.config['DEBUG'] = True

db = SQLAlchemy(app)
api = Api(app)

class UserProfile(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    first_name = db.Column(db.String)
    last_name = db.Column(db.String)
    is_active = db.Column(db.Boolean)
    loyalty_points = db.Column(db.Integer)
    fitness_goal = db.Column(db.Integer)

class UserProfileResource(Resource):
    def get(self):
        return [
            {
                'first_name': profile.first_name,
                'last_name': profile.last_name,
                'is_active': profile.is_active,
                'loyalty_points': profile.loyalty_points,
                'fitness_goal': profile.fitness_goal
            }
            for profile in UserProfile.query.all()
        ]

    def post(self):
        print(request.json)
        if len(UserProfile.query
            .filter_by(first_name=request.json['first_name'])
            .filter_by(last_name=request.json['last_name']).all()) > 0:
            return {'error': 'user exists'}, 409
        else:
            user = UserProfile(
                first_name=request.json['first_name'],
                last_name=request.json['last_name'],
                is_active=request.json['is_active'],
                loyalty_points=request.json['loyalty_points'],
                fitness_goal=request.json['fitness_goal']
            )
            db.session.add(user)
            db.session.commit()
            return {
                'id': user.id
            }, 201

api.add_resource(UserProfileResource, '/profile')

if __name__ == '__main__':
    app.run()
