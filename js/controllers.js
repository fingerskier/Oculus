function AccountCtrl($scope, $rootScope, $routeParams, $log, $http, User) {
	$scope.login = function() {
		$log.info('Account.login');

		User.login($scope.username, $scope.password);
	};

	$scope.logout = function() {
		$rootScope.user = {};
	};

	$scope.userLoggedIn = function() {
		if ($scope.user) return true;

		return false;
	};
}

function FinderCtrl($log, $scope) {
	$scope.students = [];
	$scope.semesters = [];

	$scope.selectSemester = function() {
		$log.info('selected semester');
		$rootScope.semester = $scope.currentSemester;
	};

	$scope.selectStudent = function() {
		$log.info('selected student');
		//	XHR -> $scope.semesters
		$rootScope.student = $scope.currentStudent;
	};

	$scope.$watch('loggedIn', function() {
		
	})
}

function LoggerCtrl($scope, $log) {
	// valid states: blank, scheduled, logged, meal
	// ElemID is only valid for scheduled || logged
}

function MainCtrl($scope, $route, $routeParams, $location) {
	$scope.name = "MainCtrl";
	$scope.context = '';

	$scope.alertClass = function(type) {
		switch (type) {
			case '': return 'alert-warning';
			case 'error': return 'alert-error';
			case 'info': return 'alert-info';
			case 'success': return 'alert-success';
		}
	};
}