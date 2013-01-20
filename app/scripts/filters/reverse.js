(function() {

  Vision.filter("reverse", function() {
    return function(input, uppercase) {
      var i, out;
      out = "";
      i = 0;
      while (i < input.length) {
        out = input.charAt(i) + out;
        i++;
      }
      if (uppercase) {
        out = out.toUpperCase();
      }
      return out;
    };
  });

}).call(this);
