function MainCtrl($log, $scope) {
	$scope.context = "";

	$scope.alertClass = function(type) {
		switch (type) {
			case "error":	return "alert-error";
			case "info":	return "alert-info";
			case "success":	return "alert-success";

		}
		return "alert-warning";
	};
	
	$scope.changeContext = function(newContext) {
		$scope.context = 'views/' + newContext + '.html';
	};
};