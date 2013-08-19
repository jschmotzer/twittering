$(document).ready(function() {
  $('img').hide();
  $('#our-button').on('submit', function(event) {
    $('img').show();
    event.preventDefault();

    var username = $('input[name="user"]').val();
    var url = '/' + username;
    var that = this;
    $.get(url, username, function(tweetHTML){
      $('form').next().hide()
      $('form').after(tweetHTML);
      $('img').hide();
    });
  });
});
