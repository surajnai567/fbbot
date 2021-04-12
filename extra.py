from mysql import get_db
from tables import PostLocation, JobPosting, CredentialDriver,Credential
session = get_db()
import random
page_id = ""

#### dummy dataaa 5
def insert_into_posthistroy(number, id):
    for i in range(1, number+1):
        query = "insert into post_histories values ({}, '{}', 'testing123',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ,{}, 1, 1);"\
            .format(id+i, str(random.choice(['pending', 'success'])),id+i)

        session.execute(query)
        session.commit()
        print("inserted")


def update_credentail(cred):
    res = session.query(Credential).filter(Credential.id == 1).all()[0]
    res.access_token = cred
    session.commit()
    print("updated")

## dummy 5
def insert_into_job_post(n, id):
    for i in range(1, n+1):
        query = "insert into job_postings values ({},'ani','{}','122002856377884',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ,1);" \
            .format(id + i, "".join([random.choice(['a','b','c','d', 'e', 'f', 'g']) for i in range(10)]))
        session.execute(query)
        session.commit()
        print("inserted")


show = "show tables;"
ins = "insert into post_histories values (2, 'success', 'testing123',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ,1, 1, 1);"
sel = "select * from job_postings;"
dp = "ALTER TABLE credential_driver add COLUMN id int primary key;"


if __name__ == "__main__":
    ## dummy 8
    #update_credentail("EAASveZAsdjyoBAO6emXTSKQDnMlLpNuJK7jPNxdviqnqPafluWERRbHcEcTUPOLPbwzSZAip253FphR3Cv3fpiCoEhwJXWtdywE5U7ZCZCvRcXlvZAEqp4LVqe1r8iFE2YU6A5qsM4MVaKq1IwhZBhJZBbLuGak5KVZBl44Gp6pXLW5c5cDHW9HekZBJpkx9e77cZD")
    #insert_into_job_post(3, 8)
    #insert_into_posthistroy(3, 8)
    res_p = session.execute("select * from post_histories;")
    res_j = session.execute("select * from job_postings;")
    for r in res_p:
        print(r)
    print("####################################################")
    for r in res_j:
        print(r)

