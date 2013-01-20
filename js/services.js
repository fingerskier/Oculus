// client: get, set
// server: create, read, update, delete
function API() {
	var args = Array.prototype.slice.call(arguments);

	return 'http://mesavalleyvision.org/api.cfm/' + args.join('/') + '?callback=JSON_CALLBACK';
}

Vision.factory('User', function($http, $log, $rootScope) {
	return {
		login: function(username, password) {
			$log.info('User.login');
			$http
			.jsonp(API('user', 'login', username, CryptoJS.MD5(password).toString()))
			.success(function(data, status, headers, config) {
				$rootScope.alert("login successful", 'success');

				$rootScope.loggedIn = true;
				$rootScope.user.fullName = data.fullName;
				$rootScope.user.username = data.username;
				$rootScope.user.role = data.role;

				$log.info($rootScope.user);
			})
			.error(function(data, status, headers, config) {
				$rootScope.alert('login error', 'error');

				$rootScope.loggedIn = false;
			});
		},
		logout: function() {
			// unsure if we'll want this, reloading/closing the page will wipe the session
			// if we decide to use cookies (probable) then we'll implement this
		}
	}
});

Vision.factory('Student', function($http, $log, $rootScope) {
	return {
		load: function(semester) {
			$log.info('Student.read');

			$http.jsonp(API('student', 'read'))
			.success(function(data, status, headers, config) {
				$log.info('Student.load SUCCESS');
				$rootScope.students = data;
			})
			.error(function(data, status, headers, config) {
				$log.info('Student.load ERROR');
				// body...
			});
		}
	}
});


Vision.factory('Semester', function($http, $log, $rootScope) {
	return {
		create: function() {},
		del: function(ID) {
			$http.jsonp(API('semester', 'delete', ID))
			.success(function(data, status, headers, config) {
				$log.info('Semester: delete');
				// delete local item on XHR success
				$rootScope.alert('semester deleted', 'info');
			})
			.error(function(data, status, headers, config) {
				$log.info('Semester: delete ERROR!');
				$rootScope.alert('semester delete failed');
			});
		},
		load: function() {
			$log.info('Semester: read');
			$http.jsonp(API('semester', 'read'))
			.success(function(data, status, headers, config) {
				$rootScope.semesters = data;
				$rootScope.alert('semesters loaded', 'success');
			})
			.error(function(data, status, headers, config) {
				$log.info('Semester: read ERROR!');
				$rootScope.alert('Semester.read ERROR!', 'error');
			});
		},
		update: function(sem) {}
	};
});