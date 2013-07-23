$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });



  $('#create_event').on('submit', function(e) {
    e.preventDefault();
    var exitingErrors = $('.errors');
    // check for existing errors from past submissions and clear
    if (exitingErrors) {
      exitingErrors.empty();
    }
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    }).done(function(msg){
      if (msg.errors) {
        for (var i = 0; i < msg.errors.length; i++) {
          $('.errors').append("<li><em>"+msg.errors[i]+"</em></li>");
        }
      }
    });
  });
});
