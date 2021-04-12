from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column,BigInteger,Integer, \
    String, TIMESTAMP, Sequence, Text


Base = declarative_base()


class PostHistory(Base):
    __tablename__ = 'post_histories'
    id = Column('id', Sequence('id'), primary_key=True)
    status = Column('status', String(255))
    title = Column('title', String(255))
    created_at = Column('created_at', TIMESTAMP)
    updated_at = Column('updated_at', TIMESTAMP)
    deleted_at = Column('deleted_at', TIMESTAMP)
    job_post_id = Column('job_post_id', BigInteger)
    post_location_id = Column('post_location_id', BigInteger)
    team_id = Column('team_id', BigInteger)


class PostLocation(Base):
    __tablename__ = 'post_locations'
    id = Column('id', Sequence('id'), primary_key=True)
    url = Column('url', String(255))
    title = Column('title', String(255))
    created_at = Column('created_at', TIMESTAMP)
    updated_at = Column('updated_at', TIMESTAMP)
    deleted_at = Column('deleted_at', TIMESTAMP)
    team_id = Column('team_id', BigInteger)
    driver_id = Column('driver_id', BigInteger)


class JobPosting(Base):
    __tablename__ = 'job_postings'
    id = Column('id', Sequence('id'), primary_key=True)
    url = Column('url', String(255))
    content = Column('content', Text)
    title = Column('title', String(255))
    created_at = Column('created_at', TIMESTAMP)
    updated_at = Column('updated_at', TIMESTAMP)
    deleted_at = Column('deleted_at', TIMESTAMP)
    team_id = Column('team_id', BigInteger)


class Credential(Base):
    __tablename__ = 'credentials'
    id = Column('id', Sequence('id'), primary_key=True)
    username = Column('username', String(255))
    title = Column('title', String(255))
    password = Column('password', String(255))
    created_at = Column('created_at', TIMESTAMP)
    updated_at = Column('updated_at', TIMESTAMP)
    deleted_at = Column('deleted_at', TIMESTAMP)
    team_id = Column('team_id', BigInteger)
    access_token = Column('access_token', String(255))


class Driver(Base):
    __tablename__ = 'drivers'
    id = Column('id', Sequence('id'), primary_key=True)
    name = Column('name', String(255))
    created_at = Column('created_at', TIMESTAMP)
    updated_at = Column('updated_at', TIMESTAMP)
    deleted_at = Column('deleted_at', TIMESTAMP)


class CredentialDriver(Base):
    __tablename__ = 'credential_driver'
    id = Column('id', Sequence('id'), primary_key=True)
    credential_id = Column('credential_id', BigInteger)
    driver_id = Column('driver_id', BigInteger)



