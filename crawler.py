from tables import PostHistory, PostLocation\
    , JobPosting, Driver, CredentialDriver, Credential
from mysql import get_db
from facebook_main import post_to_fb_group


def main():
    session = get_db()
    posthistory = session.query(PostHistory).filter(PostHistory.status == "pending").all()
    for post in posthistory:

        ## fetching post location
        post_location = session.query(PostLocation).filter(PostLocation.id == post.post_location_id).all()[0]

        ## fetching job posting
        job_posting = session.query(JobPosting).filter(JobPosting.id == post.job_post_id).all()[0]


        ## fetching credential for post
        driver = session.query(Driver).filter(Driver.id == post_location.driver_id).all()[0]

        cred_driver = session.query(CredentialDriver).filter(CredentialDriver.driver_id == driver.id).all()[0]

        credential = session.query(Credential).filter(Credential.id == cred_driver.driver_id).all()[0]


        ## post
        if post_to_fb_group(credential.access_token, job_posting.url, job_posting.content):
            ## update db
            post.status = "success"
            session.commit()


if __name__ == "__main__":
    main()





