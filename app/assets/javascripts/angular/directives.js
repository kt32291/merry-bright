app.directive('futureDate', ['$resource', 'Exchange', function($resource, Exchange){
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      return scope.$watch(function(){
        return ngModel.$modelValue;
      }, function(date) {
        var now = new Date();
        ngModel.$setValidity('future', date > now);
      });
    }
  }
}]);
