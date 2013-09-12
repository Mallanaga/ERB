$(document).ready(function() {
  var fade_flash = function() {
    $(".alert").delay(7000).fadeOut("slow", function() {
      $(".alert").remove();
    });
  };
  fade_flash();
})