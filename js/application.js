var Vision = angular.module('Vision', ['ngCookies', 'ui'], function($routeProvider, $locationProvider) { });

Vision.config(function($locationProvider, $routeProvider) {
	$locationProvider.html5Mode(true);
})
.run(function($log, $rootScope) {
	$rootScope.alerts = [];
	$rootScope.semesters = [];
	$rootScope.semester = {};
	$rootScope.students = [];
	$rootScope.student = {};
	$rootScope.user = {
		fullName: '',
		role: '',
		username: ''
	};

	$rootScope.alert = function(msg, type) {
		var type = type || 'warning';

		$rootScope.alerts.push({message:msg, type:type});
	}
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
	$rootScope.loggedIn = false;
	$rootScope.semesterSelected = function() {
		return $rootScope.semester.ID > 0;
	}
	$rootScope.studentSelected = function() {
		return $rootScope.student.ID;
	}

	$log.info("Oculus started");
});