$(document).ready(function() {
  if ($.browser.desktop) {
    $window = $(window)
    $window.scroll(function(e) {
      console.log(e)
      return false;
    })
  }
})
