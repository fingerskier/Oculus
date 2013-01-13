var Vision = angular.module('Vision', ['ui'], function($routeProvider, $locationProvider) { });

Vision.config(function($locationProvider, $routeProvider) {
	$locationProvider.html5Mode(true);
})
.run(function($log, $rootScope) {
	$rootScope.user = {
		fullName: "",
		roles: ""
	};
	$rootScope.student = {};
	$rootScope.semester = {};

	$rootScope.loggedIn = function() {
		return $rootScope.user.roles.length;
	};
	$rootScope.isDev = function() {
		return $rootScope.user.roles.indexOf('dev') >= 0;
	};
	$rootScope.isAdmin = function() {
		return $rootScope.user.roles.indexOf('admin') >= 0;
	};
	$rootScope.isRC = function() {
		return $rootScope.user.roles.indexOf('RC') >= 0;
	};
	$rootScope.isParent = function() {
		return $rootScope.user.roles.indexOf('parent') >= 0;
	};
	$rootScope.isStudent = function() {
		return $rootScope.user.roles.indexOf('student') >= 0;
	};

	$log.info("Oculus started");
});