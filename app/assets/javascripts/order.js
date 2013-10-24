$(document).ready(function() {
  var count = 0;
  $(document).on('click', '#add_line', function() {
    count += 1;
    $('#order_form tr.total')
      .before($('<tr>').attr('class', 'row'+count)
        .append($('<td>').text('add line'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>').text('$$$'))
      )
      .before($('<tr>').attr('class', 'box'+count)
        .append($('<td>').attr('colspan', '6').html('&#8594;'))
      );
  });
  $(document).on('click', '#new_box', function() {
    count += 1;
    $('#order_form tr.total')
      .before($('<tr>').attr('class', 'row'+count)
        .append($('<td>').text('new box'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>'))
        .append($('<td>').text('$$$'))
      )
      .before($('<tr>').attr('class', 'box'+count)
        .append($('<td>').attr('colspan', '6').html('&#8594;'))
      );
  });
});