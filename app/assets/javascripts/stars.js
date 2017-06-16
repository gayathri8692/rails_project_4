console.log('loaded');

$(document).ready(function() {
  $('input[type=radio]').on('click', function() {
    console.log(this)
    $('#stars').submit();
  });
})
