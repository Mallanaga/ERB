$(document).ready(function() {
  $(':input').keyup(function(e) {
    switch(e.keyCode) {
      case 38: // up
        if ($(this).attr('id') == 'cost_cardboard') {
          $(this).val((parseFloat($(this).val())+0.05).toFixed(2));
        } else {
          $(this).val(parseInt($(this).val())+1);
        }
        break;
      case 40: // down
        if ($(this).attr('id') == 'cost_cardboard') {
          $(this).val((parseFloat($(this).val())-0.05).toFixed(2));
        } else {
          $(this).val(parseInt($(this).val())-1);
        }
        break;
    };
  });

  $('#cost_erb').attr("disabled", true)

  function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
  } 

  function calc() {
    var dw=$('#deliveries_week').val(),
        tt=$('#turn_time').val(), 
        cc=$('#cost_cardboard').val(), 
        ce=$('#cost_erb').val(),
        //ERB box quantity
        a=Math.ceil(dw/7*tt),
        //cardboard box quantity
        b=Math.ceil(dw*52),
        //cb cost - erb cost
        c=(b*cc)-(a*ce);
    $('#cost_erb').val((cc*8).toFixed(2));
    $("span#box_quantity").text(numberWithCommas(a));
    $("span#ship_quantity").text(Math.ceil(250/tt));
    $("span#erb_cost").text(numberWithCommas(Math.ceil(a*ce)));
    $("span#cbox_quantity").text(numberWithCommas(b));
    $("span#cb_cost").text(numberWithCommas(Math.ceil(b*cc)));
    $("span#erb_savings").text(numberWithCommas(Math.floor(c / 1000) * 1000));
    $("span#erb_percent").text((100-(a*ce)/(b*cc)*100).toFixed(0));
    $("span#cst").text(numberWithCommas(Math.round(b*0.00133)));
    $("span#csw").text(numberWithCommas(Math.round(b*5.3)));
    $("span#cse").text(numberWithCommas(Math.round(b*8.687)));
  }

  $('#deliveries_week').val(100);
  $('#turn_time').val(14);
  $('#cost_erb').val(3.60.toFixed(2));
  $('#cost_cardboard').val(0.45.toFixed(2));
  calc();

  $('#turn_time').keyup(function() {
    calc();
  });
  $('#deliveries_week').keyup(function() {
    calc();
  });
  $('#cost_cardboard').keyup(function() {
    calc();
  });
  $('#cost_erb').keyup(function() {
    calc();
  });

});