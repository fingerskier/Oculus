(function() {

  Vision.directive("fadeAfter", function($timeout, $log) {
    var link;
    link = function($scope, element, attributes) {
      var duration, expression;
      expression = attributes.hideAfter;
      duration = attributes.hideAfter || "3000";
      return $timeout((function() {
        return element.fadeOut(1000);
      }), duration);
    };
    return {
      link: link,
      restrict: "A"
    };
  });

}).call(this);
