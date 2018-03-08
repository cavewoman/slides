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

$(document).keydown(function(e) {
  if (e.keyCode == 37) {
    // left
    const path = window.location.pathname;
    if (path.match(/\/slides\/\d+/)) {
      const slideId = path.split("/")[2];
      getSlideData(slideId, function(response) {
        if (response.previous_slide) {
          document.location.href = `/slides/${response.previous_slide.id}`;
        } else {
          document.location.href = `/presentations/${
            response.current_slide.presentation_id
          }/intro_slide`;
        }
      });
    }
  } else if (e.keyCode == 39) {
    // right
    const path = window.location.pathname;
    if (path.match(/\/slides\/\d+/)) {
      const slideId = path.split("/")[2];
      getSlideData(slideId, function(response) {
        if (response.next_slide) {
          document.location.href = `/slides/${response.next_slide.id}`;
        }
      });
    } else if (path.match(/\/presentations\/\d+\/intro_slide/)) {
      const presentationId = path.split("/")[2];
      getFirstPresentationSlide(presentationId, function(response) {
        document.location.href = `/slides/${response.id}`;
      });
    }
  }
});

function getSlideData(slideId, cb) {
  $.get(`/slide_data/${slideId}`, response => {
    cb(response);
  });
}

function getFirstPresentationSlide(presentationId, cb) {
  $.get(`/presentations/${presentationId}/first_slide`, response => {
    cb(response);
  });
}
