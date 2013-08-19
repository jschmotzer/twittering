$(document).ready(function() {
  $('img').hide();
  $('#our-button').on('click', function(event) {
    $('img').show();
    event.preventDefault();

    var username = $('input[name="user"]').val();
    var url = '/' + username;
    var that = this;
    $.get(url, username, function(tweetHTML){
      console.log(that);
      $('body').append(tweetHTML);
      $('img').hide();
    });
  });
});
