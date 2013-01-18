function API() {
	var args = Array.prototype.slice.call(arguments);

	return 'http://mesavalleyvision.org/api.cfm/' + args.join('/') + '?callback=jsonp_callback';
}

Vision.service('User', function($http, $log, $rootScope) {
	var thisUser = $rootScope.user;

	this.login = function(username, password) {
		$log.info('User.login');
		return $http
		.jsonp(API('user', 'login', username, CryptoJS.MD5(password).toString()));
	};

	this.logout = function() {
	};
});