$(document).on('ready' 'page:load', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/items?search=' + searchValue);

  });
});




//
// JS GET version
// $.get('/items?search=' + searchValue)
//   .done(function(data) {
//     console.log(data);
//     $('#products').html(data);
//   });



// AJAX version
// $.ajax({
//   url: '/items?search=' + searchValue,
//   type: 'GET',
//   dataType: 'html'
// }).done(function(data) {
//   $('#items').html(data);
// });
