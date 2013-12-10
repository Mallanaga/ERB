jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.row0').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#order_form tr.total').before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'keyup', '.total', (event) ->
    q = parseInt($(this).closest('tr.row0').children('td').eq(1).children().val())
    b = parseFloat($(this).closest('tr.row0').children('td').eq(2).children().val())
    m = parseFloat($(this).closest('tr.row0').children('td').eq(4).children().val())
    t = if parseFloat($('#order_tax').val()) then parseFloat($('#order_tax').val())/100+1 else 1
    total = 0
    $(this).closest('tr.row0').children('td').last().children().html((q*b+m).toFixed(2))
    $('.line_total:visible').each ->
      total += parseFloat($(this).html())
    $('span#order_total').html('$' + (total*t).toFixed(2))