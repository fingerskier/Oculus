function AccountCtrl($scope, $rootScope, $routeParams, $log, $http, User) {
    $scope.login = function() {
        $log.info("Account.login");
        User.login($scope.username, $scope.password);
    };

    $scope.logout = function() {
        $rootScope.user = {};
    };

    $scope.userLoggedIn = function() {
        if ($scope.user) {
            return true;
        }
        
        return false;
    };
};