function API() {
	var args = Array.prototype.slice.call(arguments);

	return 'http://mesavalleyvision.org/api.cfm/' + args.join('/') + '?callback=JSON_CALLBACK';
}

Vision.service('User', function($http, $log, $rootScope) {
	var thisUser = $rootScope.user;

	this.login = function(username, password) {
		$log.info('User.login');
		$http
		.jsonp(API('user', 'login', username, CryptoJS.MD5(password).toString()))
		.success(function(data, status, headers, config) {
			$rootScope.alert("login successful", 'success');

			$rootScope.loggedIn = true;
			$rootScope.user.fullName = data.fullName;
			$rootScope.user.username = data.username;
			$rootScope.user.role = data.role;

			$log.info($rootScope.user);
		})
		.error(function(data, status, headers, config) {
			$rootScope.alert('login error', 'error');

			$rootScope.loggedIn = false;
		})
		;
	};

	this.logout = function() {
	};
});

Vision.service('Student', function($http, $log, $rootScope) {

});