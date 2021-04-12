from facebook import GraphAPI
import logging

# filename for logs
filename = 'log.txt'
format = '%(asctime)s :: %(levelname)s :: %(message)s'
logging.basicConfig(filename=filename, level=logging.INFO, format=format)

# util funcs
def is_success(dict, key):
    if key in dict:
        return True
    else:
        return False


def post_to_fb_group(credential: str, page_id: str, content: str, link=None)-> bool:
    graph = GraphAPI(access_token=credential)
    try:
        result = graph.put_object(page_id, 'feed', message=content, link=link)
        print(result)
        if is_success(result, 'id'):
            logging.info(page_id+" "+ "successfully posted")
            return True
        logging.info(page_id + " " + "failed to post")
        return False
    except Exception as e:
        logging.critical(page_id + " " + "failed::"+ str(e))
        return False
