$(document).ready(function() {
  let $slideBody = $(".slide-body");
  if ($slideBody.length > 0) {
    $slideBody.html(
      '<div class="sk-circle">' +
        '<div class="sk-circle1 sk-child"></div>' +
        '<div class="sk-circle2 sk-child"></div>' +
        '<div class="sk-circle3 sk-child"></div>' +
        '<div class="sk-circle4 sk-child"></div>' +
        '<div class="sk-circle5 sk-child"></div>' +
        '<div class="sk-circle6 sk-child"></div>' +
        '<div class="sk-circle7 sk-child"></div>' +
        '<div class="sk-circle8 sk-child"></div>' +
        '<div class="sk-circle9 sk-child"></div>' +
        '<div class="sk-circle10 sk-child"></div>' +
        '<div class="sk-circle11 sk-child"></div>' +
        '<div class="sk-circle12 sk-child"></div>' +
        "</div>"
    );
    const slideId = window.location.pathname.split("/")[2];
    getSlideData(slideId, function(response) {
      $slideBody.html(response.current_slide.body);
    });
  }
});

function getSlideData(slideId, cb) {
  $.get(`/slide_data/${slideId}`, response => {
    cb(response);
  });
}
