var Vision = angular.module('Vision', ['ngCookies', 'ui'], function($routeProvider, $locationProvider) { });

Vision.config(function($locationProvider, $routeProvider) {
	$locationProvider.html5Mode(true);
})
.run(function($log, $rootScope) {
	$rootScope.alerts = [];
	$rootScope.semesters = [];
	$rootScope.semester = 0;
	$rootScope.students = [];
	$rootScope.student = 0;
	$rootScope.user = {
		fullName: '',
		role: '',
		username: ''
	};

	$rootScope.alert = function(msg, type) {
		var type = type || '';

		$rootScope.alerts.push({message:msg, type:type});
	}
	$rootScope.loggedIn = false;
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