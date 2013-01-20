// client: load, set
// server: create, read, select, update, delete
function API() {
	var args = Array.prototype.slice.call(arguments);

	return 'http://mesavalleyvision.org/api.cfm/' + args.join('/') + '?callback=JSON_CALLBACK';
}

Vision
.factory('ILP', function($http, $log, $rootScope) {
	var thisService = {
		load: function(semesterID, studentID) {
			$http.jsonp(API('ILP', 'read', semesterID, studentID))
			.success(function(data, status, headers, config) {
				$log.info('ILP.load');
				thisService.data = data;
				$rootScope.alert('ILP successfully loaded', 'success');
			})
			.error(function(data, status, headers, config) {
				$log.info('ILP.load');
				$rootScope.alert('Error loading ILP', 'error');
			});

			return thisService;
		}
	}

	return thisService;
})
.factory('Semester', function($http, $log, $rootScope) {
	return {
		create: function() {},
		del: function(ID) {
			$http.jsonp(API('semester', 'delete', ID))
			.success(function(data, status, headers, config) {
				$log.info('Semester.del');
				// delete local item on XHR success
				$rootScope.alert('semester deleted', 'info');
			})
			.error(function(data, status, headers, config) {
				$log.info('Semester.del ERROR!');
				$rootScope.alert('semester delete failed');
			});
		},
		load: function() {
			$log.info('Semester: read');
			$http.jsonp(API('semester', 'read'))
			.success(function(data, status, headers, config) {
				$rootScope.semesters = data;
			})
			.error(function(data, status, headers, config) {
				$log.info('Semester: read ERROR!');
				$rootScope.alert('Semester.load ERROR!', 'error');
			});
		},
		select: function(ID) {
			$http.jsonp(API('semester', 'select', ID))
			.success(function(data, status, headers, config) {
				var S;
				for (S in $rootScope.semesters)
					if ($rootScope.semesters[S].ID == ID)
						$rootScope.semester = $rootScope.semesters[S];

				$log.info('Semester.select SUCCESS');
				$rootScope.alert('New semester selected', 'info');
			})
			.error(function(data, status, headers, config) {
				$log.info('Semester.select ERROR');
				$rootScope.alert('Error selecting semester', 'error');
			});
		},
		update: function(sem) {}
	};
})
.factory('Student', function($http, $log, $rootScope) {
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
				$rootScope.alert('Error loading students');
			});
		},
		select: function(ID) {
			$log.info('Student.select');
			$http.jsonp(API('student', 'select', ID))
			.success(function() {
				var S;
				for (S in $rootScope.students)
					if ($rootScope.students[S].ID == ID)
						$rootScope.student = $rootScope.students[S];

				$log.info('Student.select SUCCESS');
				$rootScope.alert('Student loaded successfully', 'success');
			})
			.error(function() {
				$log.info('Student.select ERROR');
				$rootScope.alert('Error loading student', 'error');
			});
		}
	};
})
.factory('User', function($http, $log, $rootScope) {
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