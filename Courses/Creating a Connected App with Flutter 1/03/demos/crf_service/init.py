from service import db, Exercise

exercises = [
    Exercise(id=1, program_id=1, title='Jumping Jacks', reps=25),
    Exercise(id=2, program_id=1, title='Jogging', reps=30),
    Exercise(id=3, program_id=2, title='Curls', reps=10),
    Exercise(id=4, program_id=2, title='Jumping Jacks', reps=25),
    Exercise(id=5, program_id=3, title='Jogging', reps=25),
    Exercise(id=6, program_id=3, title='Presses', reps=10),
    Exercise(id=7, program_id=4, title='Curls', reps=10),
    Exercise(id=8, program_id=4, title='Jogging', reps=25)
]

for ex in exercises:
    db.session.add(ex)

db.session.commit()