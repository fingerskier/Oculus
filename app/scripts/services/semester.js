Vision.factory("Semester", function($http, $log, $rootScope) {
    return {
        create: function() {},
        del: function(ID) {
            $http.jsonp(API("semester", "delete", ID))
            .success(function(data, status, headers, config) {
                $log.info("Semester.del");
                $rootScope.alert("semester deleted", "info");
            }).error(function(data, status, headers, config) {
                $log.info("Semester.del ERROR!");
                $rootScope.alert("semester delete failed");
            });
        },
        load: function() {
            $log.info("Semester: load");
            $http.jsonp(API("semester", "read"))
            .success(function(data, status, headers, config) {
                $rootScope.semesters = data;
$log.info($rootScope.semesters);
            }).error(function(data, status, headers, config) {
                $log.info("Semester: load ERROR!");
                $rootScope.alert("Semester.load ERROR!", "error");
            });
        },
        select: function(ID) {
            $http.jsonp(API("semester", "select", ID))
            .success(function(data, status, headers, config) {
                var S;
                S = void 0;
                for (S in $rootScope.semesters) {
                    if ($rootScope.semesters[S].ID === ID) {
                        $rootScope.semester = $rootScope.semesters[S];
                    }
                }
                $log.info("Semester.select SUCCESS");
                $rootScope.alert("New semester selected", "info");
            }).error(function(data, status, headers, config) {
                $log.info("Semester.select ERROR");
                $rootScope.alert("Error selecting semester", "error");
            });
        },
        update: function(sem) {}
    };
});