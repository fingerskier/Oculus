// server: create, read, update, delete
// client: put, get, del

Vision.factory('Serv', function($log, $rootScope) {
	var host = 'http://mesavalleyvision.org/app.cfm';

	return {
		del: function(objName, objData) {
			$http.jsonp(host + '/del/' + objName, objData)
			.success(function() {
				store.remove(objName);
			})
			.error(function() {
				$log.error('Could not delete ' + objName);
			})
		},
		get: function(objName, objData) {
			var thisn = store.get(objName);

			if (thisn)
				return thisn;
			else {
				$http.jsonp(host + '/get/' + objName, objData)
				.success(function(data) {
					store.set(objName, data);
				})
				.error(function() {
					$log.error('Could not get data for ' + objName);
				});
			}
		},
		put: function(objName, objData) {
			var thisn = store.get(objName),
				X;

			$http.jsonp(host + '/put/' + objName, objData)
			.success(function() {
				if (thisn)
					for (X in objData)
						thisn[X] = objData[X];
				else
					store.set(objName, objData);
			})
			.error(function() {
				$log.error('Could not put data for ' + objName);
			});
		}
	};
});