$(document).ready(function() {
  // Manually add CSRF token to jQuery requests
  var token = $('meta[name=csrf-token]').attr('content');
  $("textarea").focus();
  $("#email_reminder").click(function() {
    $.ajax({
      url: "/toggleEmail?&authenticity_token=" + token,
      method: "PUT"
    });
  });
});
