function AccountCtrl($scope, $rootScope, $routeParams, $log, $http, User) {
	$scope.login = function() {
		$log.info('Account.login');

		User
		.login($scope.username, $scope.password)
		.success(function(response) {
			$log.info(response);

			if (response.error) {
				$scope.alerts.push("login unsuccesful: " + response.error);
			} else {
				$scope.alerts.push("login successful");
				$rootScope.user.fullName = response.fullName;
				$rootScope.user.username = response.username;
				$rootScope.user.role = response.role;
			}
			$log.info($rootScope.user);
		})
		.error(function(response) {
			$log.info(response);
			$scope.alerts.push('login error');
		});
	};

	$scope.logout = function() {
		$rootScope.user = {};
	};

	$scope.userLoggedIn = function() {
		if ($scope.user) return true;

		return false;
	};
}

function LoggerCtrl($scope, $log) {
	// valid states: blank, scheduled, logged, meal
	// ElemID is only valid for scheduled || logged
}

function MainCtrl($scope, $route, $routeParams, $location) {
	$scope.name = "MainCtrl";
	$scope.context = '';
}

function StudentCtrl($log, $rootScope, $scope) {
	$scope.name = "StudentCtrl";
	$scope.students = [
		{ID:1, name:'Pete Christopher'}, 
		{ID:2, name:'Chris Johanssen'},
		{ID:3, name:'Hannah Yacobi'},
		{ID:4, name:'Joe Schmoe'}
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