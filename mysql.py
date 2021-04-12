
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:@localhost/jobautomation')
Session = sessionmaker(bind=engine)
session = Session()


def get_db():
    return session

