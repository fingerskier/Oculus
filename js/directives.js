Vision.directive( [ 'focus', 'blur', 'keyup', 'keydown', 'keypress' ].reduce( function ( container, name ) {
    var directiveName = 'ng' + name[ 0 ].toUpperCase( ) + name.substr( 1 );

    container[ directiveName ] = [ '$parse', function ( $parse ) {
        return function ( scope, element, attr ) {
            var fn = $parse( attr[ directiveName ] );
            element.bind( name, function ( event ) {
                scope.$apply( function ( ) {
                    fn( scope, {
                        $event : event
                    } );
                } );
            } );
        };
    } ];

    return container;
}, {}));

Vision.directive("fadeAfter", function($timeout, $log) {
    function link($scope, element, attributes) {
        var expression = attributes.hideAfter;
        var duration = (attributes.hideAfter || "3000");

        $timeout(function() {
            element.fadeOut(1000);
        }, duration);
    }

    return ({
        link: link,
        restrict: "A"
    });
});