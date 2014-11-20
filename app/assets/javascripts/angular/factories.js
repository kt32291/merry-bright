app.factory("Exchange", ['$resource', function($resource){
  return $resource('/exchanges/:id.json', { id: '@id' });
}]);

app.factory("Gifting", ['$resource', function($resource){
  return $resource('/giftings/:id.json', { id: '@id' });
}])

app.factory("User", ['$resource', function($resource){
  return $resource('/users/:id.json', { id: '@id' });
}])

app.factory("Group", ['$resource', function($resource){
  return $resource('/groups/:id.json', { id: '@id' });
}])
