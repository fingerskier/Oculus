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

function FinderCtrl($log, $scope, Semester, Student) {
	$scope.selectSemester = function() {
		$log.info('Finder.selectSemester');
		Semester.select($scope.semester.ID);
		$log.info($scope.semester);
		Student.load();
	};

	$scope.selectStudent = function() {
		$log.info('Finder.selectStudent');
		Student.select($scope.student.ID);
		$log.info($scope.student);
	};

	$scope.$watch('loggedIn', function(newVal, oldVal) {
		if (newVal) {
			Semester.load();
			$log.info($scope.semesters);
		}
	});

	$log.info('Finder loaded');
}

function ILPctrl($log, $scope, ILP) {
	$scope.ILP = ILP.load($scope.semester.ID, $scope.student.ID).data;
$log.info($scope.ILP);
}

function LoggerCtrl($scope, $log) {
	// valid states: blank, scheduled, logged, meal
	// ElemID is only valid for scheduled || logged
}

function MainCtrl($log, $scope) {
	$scope.context = '';

	$scope.alertClass = function(type) {
		switch (type) {
			case 'error': return 'alert-error';
			case 'info': return 'alert-info';
			case 'success': return 'alert-success';
		}
		return 'alert-warning';
	};

	$scope.changeContext = function(newContext) {
		$scope.context = newContext;
	};
}
