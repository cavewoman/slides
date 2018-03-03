$(document).ready(function() {
  let $slideBody = $(".slide-body");
  if ($slideBody.length > 0) {
    $slideBody.html("Loading");
    const slideId = window.location.pathname.split("/")[2];
    getSlideBody(slideId, function(body) {
      $slideBody.html(body);
    });
  }
});

function getSlideBody(slideId, cb) {
  $.get(`/slide/${slideId}`, response => {
    cb(response.body);
  });
}
