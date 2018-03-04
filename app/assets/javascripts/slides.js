$(document).ready(function() {
  let $slideBody = $(".slide-body");
  if ($slideBody.length > 0) {
    $slideBody.html("Loading");
    const slideId = window.location.pathname.split("/")[2];
    getSlideData(slideId, function(response) {
      $slideBody.html(response.current_slide.body);
      if (response.previous_slide) {
        $(".previous-slide-btn a").attr(
          "href",
          `/slides/${response.previous_slide.id}`
        );
      } else {
        $(".previous-slide-btn").hide();
      }
      if (response.next_slide) {
        $(".next-slide-btn a").attr(
          "href",
          `/slides/${response.next_slide.id}`
        );
      } else {
        $(".next-slide-btn").hide();
      }
    });
  }
});

function getSlideData(slideId, cb) {
  $.get(`/slide_data/${slideId}`, response => {
    cb(response);
  });
}
