var app = angular.module("MerryAndBright", ['ngResource', 'ngMessages', 'ngAnimate', 'ngSanitize', 'ui.select']);

app.config(['$httpProvider', function ($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);

app.config(function(uiSelectConfig) {
  uiSelectConfig.theme = 'select2';
});
