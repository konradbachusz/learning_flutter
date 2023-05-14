from flask import Flask
from flask_restful import Api, Resource
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
api = Api(app)
db = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///crfdb.db'
app.config['DEBUG'] = True


class Exercise(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    program_id = db.Column(db.Integer)
    title = db.Column(db.String)
    reps = db.Column(db.Integer)


class Program(Resource):
    def get(self):
        return [
            {
                'id': ex.id,
                'program_id': ex.program_id,
                'title': ex.title,
                'reps': ex.reps
            } for ex in Exercise.query.all()
        ]

class ProgramQuery(Resource):
    def get(self, program_id):
        program = Exercise.query.filter_by(program_id=program_id)
        return [
            {
                'id': ex.id,
                'title': ex.title,
                'reps': ex.reps
            } for ex in program
        ]

class FiveOhOh(Resource):
    def get(self):
        raise NotImplementedError()


api.add_resource(FiveOhOh, '/fiveohoh')
api.add_resource(ProgramQuery, '/program/<int:program_id>')
api.add_resource(Program, '/program')

if __name__ == '__main__':
    app.run()