function AccountCtrl($scope, $rootScope, $routeParams, $log, User) {
	$scope.name = "AccountCtrl";

	$scope.login = function() {
		User
		.login({
			username: $scope.username,
			password: $scope.password
		})
		.success(function(result) {
			$rootScope.user.roles = result.roles;
			$rootScope.user.fullName = result.fullname;

			// $scope.$apply();
			// $rootScope.$apply();

			$log.info($rootScope.user);
		})
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
	$scope.name = "MainCtrl";
	$scope.data = [
		{time:'07:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'07:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'08:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'08:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'09:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'09:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'10:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'10:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'11:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'11:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'12:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'12:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'13:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'13:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'14:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'14:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'15:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'15:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'16:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'16:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'17:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'17:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'18:00', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]},
		{time:'18:30', classes:[{elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}, {elemID:0, state:'blank', class:''}]}
	];
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