function FinderCtrl($log, $scope, Semester, Student) {
    $scope.selectSemester = function() {
    $log.info("Finder.selectSemester");
    Semester.select($scope.semester.ID);
    $log.info($scope.semester);
    return Student.load();
    };
    $scope.selectStudent = function() {
    $log.info("Finder.selectStudent");
    Student.select($scope.student.ID);
    return $log.info($scope.student);
    };
    $scope.$watch("loggedIn", function(newVal, oldVal) {
    if (newVal) {
    Semester.load();
    return $log.info($scope.semesters);
    }
    });

    $log.info("Finder loaded");
};