from run import db, UserProfile

db.create_all()

db.session.add(UserProfile(
    first_name='John',
    last_name='Johnson',
    is_active=True,
    loyalty_points=100,
    fitness_goal=1
))

db.session.add(UserProfile(
    first_name='Bob',
    last_name='Roberts',
    is_active=False,
    loyalty_points=200,
    fitness_goal=2
))

db.session.add(UserProfile(
    first_name='Alan',
    last_name='Allen',
    is_active=True,
    loyalty_points=300,
    fitness_goal=3
))

db.session.add(UserProfile(
    first_name='Tom',
    last_name='Thompson',
    is_active=False,
    loyalty_points=400,
    fitness_goal=4
))

db.session.commit()