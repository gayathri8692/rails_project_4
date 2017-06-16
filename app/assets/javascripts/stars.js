console.log('loaded');

$(document).ready(function() {
  $('input[type=radio]').on('change', function() {
    console.log(this)
    $('#stars').submit();
  });
})
