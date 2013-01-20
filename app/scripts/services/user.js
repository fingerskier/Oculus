(function() {

  Vision.factory("User", function($http, $log, $rootScope) {
    return {
      login: function(username, password) {
        $log.info("User.login");
        return $http.jsonp(API("user", "login", username, CryptoJS.MD5(password).toString())).success(function(data, status, headers, config) {
          $rootScope.alert("login successful", "success");
          $rootScope.loggedIn = true;
          $rootScope.user.fullName = data.fullName;
          $rootScope.user.username = data.username;
          $rootScope.user.role = data.role;
          return $log.info($rootScope.user);
        }).error(function(data, status, headers, config) {
          $rootScope.alert("login error", "error");
          return $rootScope.loggedIn = false;
        });
      },
      logout: function() {}
    };
  });

}).call(this);
