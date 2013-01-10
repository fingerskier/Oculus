var Vision = angular.module('Vision', ['ngResource'], function($routeProvider, $locationProvider) { });

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
		return $rootScope.user.roles.indexOf('dev');
	};
	$rootScope.isAdmin = function() {
		return $rootScope.user.roles.indexOf('admin');
	};
	$rootScope.isRC = function() {
		return $rootScope.user.roles.indexOf('RC');
	};
	$rootScope.isParent = function() {
		return $rootScope.user.roles.indexOf('parent');
	};
	$rootScope.isStudent = function() {
		return $rootScope.user.roles.indexOf('student');
	};

	$rootScope.hello = function() {
		console.log('hello');
		// use via $scope.hello() anywhere...
	}

	$log.info("Oculus started");
});