app.factory("Exchange", ['$resource', function($resource){
  return $resource('/exchanges/:id.json', { id: '@id' });
}]);

app.factory("Gifting", ['$resource', function($resource){
  return $resource('/giftings/:id.json', { id: '@id' });
}])

app.factory("Member", ['$resource', function($resource){
  return $resource('/members/:id.json', { id: '@id' });
}])

app.factory("Group", ['$resource', function($resource){
  return $resource('/groups/:id.json', { id: '@id' });
}])
