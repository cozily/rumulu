$(function() {
  $("#create_collaborator")
    .bind("ajax:success", function (event, data, status, xhr) {
      $("ul#collaborators").append(data.content);
      $(this).find("input[type=text]:last").val("").focus();
    });

  $("#create_message")
    .bind("ajax:success", function (event, data, status, xhr) {
      $("ul#messages").append(data.content);
      $(this).find("textarea:last").val("").focus();
    });

  $("a.application_vote")
    .bind("ajax:success", function (event, data, status, xhr) {
      $("div#votes").html(data.content);
    });
});
