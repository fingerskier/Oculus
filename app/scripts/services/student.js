Vision.factory("Student", function($http, $log, $rootScope) {
    return {
        load: function(semester) {
            $log.info("Student.read");
            $http.jsonp(API("student", "read"))
            .success(function(data, status, headers, config) {
                $log.info("Student.load SUCCESS");
                $rootScope.students = data;
            }).error(function(data, status, headers, config) {
                $log.info("Student.load ERROR");
                $rootScope.alert("Error loading students");
            });
        },
        select: function(ID) {
            $log.info("Student.select");
            $http.jsonp(API("student", "select", ID))
            .success(function(data, status, headers, config) {
                $rootScope.student = data;
                $log.info("Student.select SUCCESS");
                $rootScope.alert("Student loaded successfully", "success");
            }).error(function(data, status, headers, config) {
                $log.info("Student.select ERROR");
                $rootScope.alert("Error loading student", "error");
            });
        }
    };
});