app.controller("UsersCtrl", ['$scope', 'Member', function($scope, Member){

  $scope.init = function(group_id){
    $scope.group_id = group_id;
    $scope.users = Member.query({ group_id: group_id });
    $("input#user_email").autocomplete({
      source: "/members.json",
      minLength: 1,
      select: function(event, ui) {
        event.preventDefault();
        $('input#user_email').val(ui.item.name);
      }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li></li>" )
        .append( "<a>" + item.email + "</a>" )
        .appendTo( ul );
    };
    $("input#user_email").attr('autocomplete', 'on');
  }

  $scope.addUser = function(e){
    e.preventDefault();
    if ($scope.user_form.$valid){
      Member.save({ email: $scope.user_email, group_id: $scope.group_id }, function(data){
        $scope.users.push(data);
        $scope.user_email = "";
        $scope.user_form.$setPristine(true);
      })
    }
  }

}])
