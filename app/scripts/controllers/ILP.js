function ILPctrl($log, $scope, ILP) {
	ILP.load($scope.semester.ID, $scope.student.ID);

	$log.info($scope.ILP);
};