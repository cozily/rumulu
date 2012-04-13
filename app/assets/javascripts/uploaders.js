$(function() {
  new qq.FileUploader({
    element: $("#upload-photos")[0],
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    action: $("#upload-photos").attr("data-upload-path"),
    params: {
      authenticity_token: $('meta[name=csrf-token]').attr('content')
    },
    onComplete: function(id, fileName, responseJSON) {
      $("ul.thumbnails").append(responseJSON.content)
      $("ul.qq-upload-list li.qq-upload-success").fadeOut(1000);
    }
  });
});
