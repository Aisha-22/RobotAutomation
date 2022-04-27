#
# TestRail API binding for Python 2.x (API v2, available since 
# TestRail 3.0)
#
# Learn more:
#
# http://docs.gurock.com/testrail-api2/start
# http://docs.gurock.com/testrail-api2/accessing
#
# Copyright Gurock Software GmbH. See license.md for details.
#

#import urllib2, json, base64
import urllib.request, urllib.error, json, base64

class APIClient:
	def __init__(self, base_url):
		self.user = ''
		self.password = ''
		if not base_url.endswith('/'):
			base_url += '/'
		self.__url = base_url + 'index.php?/api/v2/'

	#
	# Send Get
	#
	# Issues a GET On Session (read) against the API and returns the result
	# (as Python dict).
	#
	# Arguments:
	#
	# uri                 The API method to call including parameters
	#                     (e.g. get_case/1)
	#
	def send_get(self, uri):
		return self.__send_request('GET', uri, None)

	#
	# Send POST
	#
	# Issues a POST On Session (write) against the API and returns the result
	# (as Python dict).
	#
	# Arguments:
	#
	# uri                 The API method to call including parameters
	#                     (e.g. add_case/1)
	# data                The data to submit as part of the request (as
	#                     Python dict, strings must be UTF-8 encoded)
	#
	def send_post(self, uri, data):
		return self.__send_request('POST', uri, data)

	def __send_request(self, method, uri, data):
		url = self.__url + uri
		request = None
		if (method == 'POST'):
			postData = urllib.parse.urlencode(data).encode('ascii')
			request = urllib.request.Request(url, postData.decode('ascii'))
			print(postData.decode('ascii'))

		else:
			request = urllib.request.Request(url)

		auth = base64.b64encode((bytes('%s:%s', "utf-8") % (bytes(self.user, "utf-8"), bytes(self.password, "utf-8")))).decode("utf-8")
		request.add_header('Authorization', 'Basic %s' % auth)
		request.add_header('Content-Type', 'application/json')

		try:
			response = urllib.request.urlopen(request).read()
		except urllib.error.HTTPError as e:
			print(e.code)
			print(e.reason)
			print(e.msg)
			response = e.read().decode('utf-8')

		if response:
			# result = json.loads(response)
			result = response
		else:
			result = {}
		print(response)
		# if e != None:
		# 	if result and 'error' in result:
		# 		error = '"' + result['error'] + '"'
		# 		traceback.print_exc()
		# 	else:
		# 		error = 'No additional error message received'
		# 	raise APIError('TestRail API returned HTTP %s (%s)' %
		# 		(e.code, error))

		return result

class APIError(Exception):
	pass