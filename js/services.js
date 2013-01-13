Vision.factory('User', function($http) {
	return {
		login: function(data) {
			return $http.post('service/user.cfc?method=login', data);
		}
	};
});