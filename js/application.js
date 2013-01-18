function jsonp_callback(data) {
	return data;
}

var Vision = angular.module('Vision', ['ui'], function($routeProvider, $locationProvider) { });

Vision.config(function($locationProvider, $routeProvider) {
	$locationProvider.html5Mode(true);
})
.run(function($log, $rootScope) {
	$rootScope.alerts = [];
	$rootScope.student = {};
	$rootScope.semester = {};
	$rootScope.user = {
		fullName: '',
		role: '',
		username: ''
	};

	$rootScope.loggedIn = function() {
		return $rootScope.user.username.length && $rootScope.user.role.length;
	};
	$rootScope.isDev = function() {
		return $rootScope.user.role == 'dev';
	};
	$rootScope.isAdmin = function() {
		return $rootScope.user.role == 'admin';
	};
	$rootScope.isRC = function() {
		return $rootScope.user.role == 'RC';
	};
	$rootScope.isParent = function() {
		return $rootScope.user.role == 'parent';
	};
	$rootScope.isStudent = function() {
		return $rootScope.user.role == 'student';
	};

	$log.info("Oculus started");
});