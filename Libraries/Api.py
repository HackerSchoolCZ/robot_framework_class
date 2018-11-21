import requests
import json

from robot.api import logger

class Api(object):

    ROBOT_LIBRARY_VERSION = 1.0
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'
    
    def get_request(self, url, params=None):
        if params:
            params = json.loads(params)
            
        self.r = requests.get(url, params=params)
        logger.info(self.r.status_code, also_console=True)
        
    def get_status_code(self):
        return self.r.status_code
    
    def get_response_json(self):
        return self.r.json()
    
    def get_names(self):
        users_json = self.r.json()
        
        names = list()
        for user in users_json:
            names.append(user['name'])
            
        return names
    