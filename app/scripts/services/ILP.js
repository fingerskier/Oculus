Vision.factory("ILP", function($http, $log, $rootScope) {
    return {
        load: function(semesterID, studentID) {
            $http.jsonp(API("ILP", "read", semesterID, studentID))
            .success(function(data, status, headers, config) {
                $log.info("ILP.load");
                $rootScope.ILP = data;
                $rootScope.alert("ILP successfully loaded", "success");
            }).error(function(data, status, headers, config) {
                $log.info("ILP.load");
                $rootScope.alert("Error loading ILP", "error");
            });
        }
    };
});