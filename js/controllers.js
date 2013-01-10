function AccountCtrl($scope, $rootScope, $routeParams, $log, Account) {
	$scope.name = "AccountCtrl";

	$scope.login = function() {
		CFCuser(function(result) {
			$rootScope.user.roles = result.roles;
			$rootScope.user.fullName = result.fullname;

			$scope.$apply();
			$rootScope.$apply();

			$log.info($rootScope.user);
		})
		.login($scope.username, $scope.password);
	};

	$scope.logout = function() {		
		$rootScope.user = {};
	};

	$scope.userLoggedIn = function() {
		if ($scope.user) return true;

		return false;
	};
}

function MainCtrl($scope, $route, $routeParams, $location) {
	$scope.name = "MainCtrl";
	$scope.context = '';
}

function StudentCtrl($log, $rootScope, $scope) {
	$scope.name = "StudentCtrl";
	$scope.students = [
		{ID:1, name:'Pete'}, 
		{ID:2, name:'Chris'},
		{ID:3, name:'Hannah'},
		{ID:4, name:'Joe'}
	];
	$scope.semesters = [
		{ID:1, name:'Fall 2011'},
		{ID:2, name:'Spring 2012'},
		{ID:3, name:'Fall 2012'},
		{ID:4, name:'Spring 2013'}
	];

	$scope.selectSemester = function() {
		$log.info('selected semester');
		$rootScope.semester = $scope.currentSemester;
	};

	$scope.selectStudent = function() {
		$log.info('selected student');
		//	XHR -> $scope.semesters
		$rootScope.student = $scope.currentStudent;
	};
}