app.controller("ExchangesCtrl", ['$scope', 'Exchange', 'Group', function($scope, Exchange, Group){


  $scope.init = function(user_id){
    $scope.exchanges = Exchange.query();
    $scope.groups = Group.query();
    $("input#shown_group_id").autocomplete({
      source: "/groups.json",
      minLength: 1,
      select: function(event, ui) {
        event.preventDefault();
        $('input#shown_group_id').val(ui.item.name);
        $('#group_id').val(ui.item.id);
        $scope.group_id = ui.item.id;
      }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li></li>" )
        .append( "<a>" + item.name + "</a>" )
        .appendTo( ul );
    };
    $("input#shown_group_id").attr('autocomplete', 'on');
  }

  $scope.addExchange = function(e){
    e.preventDefault();
    console.log($scope.group_id);
    if ($scope.exchange_form.$valid){
      Exchange.save({ name: $scope.name, signup_by: $scope.signup_by, exchange_on: $scope.exchange_on, price_limit: $scope.price_limit, group_id: $scope.group_id }, function(data){
        $scope.exchanges.push(data);
        $scope.name = "";
        $scope.exchange_on = "";
        $scope.price_limit = "";
        $('#shown_group_id').val("");
        $scope.exchange_form.$setPristine(true);
      })
    }
  }

}])
