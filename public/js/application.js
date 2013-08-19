$(document).ready(function() {
  $('img').hide();
  $('#our-button').on('click', function(event) {
    $('img').show();
    event.preventDefault();

    var username = $('input[name="user"]').val();
    var url = '/' + username;
    var that = this;

    $.get(url, username, function(tweetHTML){
      
      $('img').next().hide()
      $('img').after(tweetHTML);
      
      if(($('img').next().data('status')) == 1){
        $('img').hide();
      }
      else {
        $.post(('/secondtry' + url), function(newTweetHTML) {
          $('img').next().hide();
          $('img').after(newTweetHTML);
          $('img').hide();

        });
      }

      
    });
  });
});
