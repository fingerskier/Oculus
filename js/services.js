var CFCuser = function(callback) {
	var proxy = new UserServiceProxy;

	if (callback) proxy.setCallbackHandler(callback);
	
	return proxy;
}

var CFCjobs = function(callback) {
	var proxy = new JobsServiceProxy;

	proxy.setCallbackHandler(callback);

	return proxy;
}

Vision.factory('Account', function($http) {
	return function() {
		return {
			login: $http.get('service/user.cfc?method=login'),
			logout: $http.get('service/user.cfc?method=logout')
		}
	}
});