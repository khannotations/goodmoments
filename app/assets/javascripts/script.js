$(document).ready(function() {
  var token = $('meta[name=csrf-token]').attr('content');
  $("#email_reminder").click(function() {
    console.log("click");
    $.ajax({
      url: "/toggleEmail?&authenticity_token=" + token,
      method: "PUT"
    })
  });
});