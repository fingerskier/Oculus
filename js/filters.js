Vision
.filter('reverse', function() {
	return function(input, uppercase) {
		var out = "";
	
		for (var i = 0; i < input.length; i++) {
			out = input.charAt(i) + out;
		}

		if (uppercase) {
			out = out.toUpperCase();
		}

		return out;
	};
})
.filter('capitalize', function() {
	return function(input, scope) {
		return input.substring(0,1).toUpperCase()+input.substring(1);
	}
});