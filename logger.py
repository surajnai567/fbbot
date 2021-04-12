import logging


class Logger:
    def __init__(self, filename):
        logging.basicConfig(filename=filename,
                            format='%(asctime)s %(message)s',
                            filemode='w+')
        self.logger = logging.getLogger()

    def log(self, url, message):
        self.logger.info(message)