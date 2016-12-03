# [START imports]
import os
import urllib
import sys
sys.path.append('./healthFact')
import measurements

from google.appengine.api import users
from google.appengine.ext import ndb

import jinja2
import webapp2

JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
    extensions=['jinja2.ext.autoescape'],
    autoescape=True)
# [END imports]

# [START main_page]
class MainPage(webapp2.RequestHandler):

    def get(self):

        weight = self.request.get('weight', '')
        bodyFat = self.request.get('bodyFat', '')
        entity = self.request.get('entity', '')
        leanBodyMass = self.request.get('leanBodyMass', '')
        BMR = self.request.get('BMR', '')
        user = users.get_current_user()
        if user:
            url = users.create_logout_url(self.request.uri)
            url_linktext = 'Logout'
        else:
            url = users.create_login_url(self.request.uri)
            url_linktext = 'Login'
        
        template_values = {
            'weight': weight,
            'bodyFat': bodyFat,
            'leanBodyMass': leanBodyMass,
            'BMR': BMR,
            'user': user,
            'url_linktext': url_linktext,
            'entity': entity,
        }

        template = JINJA_ENVIRONMENT.get_template('templates/index.html')
        self.response.write(template.render(template_values))
# [END main_page]

# [START Class Weight]
class Weight(webapp2.RequestHandler):

    def post(self):
        # The form calls the post method
        # get the weight and bodyFat from the post
	classWeight = measurements.Weight(float(self.request.get('weight', 0.0)),'lbm')
        classBodyFat = measurements.BodyFat(float(self.request.get('bodyFat', 0.0)))
        #weight = float(self.request.get('weight', 0.0))
        #bodyFat = float(self.request.get('bodyFat', 0.0))

        # Assume for now the body fat is #.## % format
        leanBodyMass = classWeight['value'] * ( 1.0 - classBodyFat['value']/100)

        # Assume for now the weight is in lbm
        BMR = leanBodyMass/2.204 * 21.6 + 370
        
        query_params = {
            'weight': str(classWeight['value']),
            'bodyFat': str(classBodyFat['value']),
            'leanBodyMass': str(leanBodyMass),
            'BMR': str(BMR),
            'entity': str(classWeight.toEntity()),
        }

        self.redirect('/?'+urllib.urlencode(query_params))
# [END weight]

# [START app]
app = webapp2.WSGIApplication([
    ('/', MainPage),
    ('/weight', Weight),
], debug=True)
# [END app]
