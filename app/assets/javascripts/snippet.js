/*(function() {
  // minimum version of jQuery
  var v = '1.3.2';
  if (window.jQuery === undefined || window.jQuery.fn.jquery < v) {
    var done = false;
    var script = document.createElement('script');
    script.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js';
    script.onload = script.onreadystatechange = function() {
      if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
        done = true;
        snippet();
      }
    };
    document.getElementsByTagName('head')[0].appendChild(script);
  }
  else {
    snippet();
  };

  function snippet() {
    $.ajax({
      dataType: 'json',
      type: 'GET',
      url: 'http://ecorebox.com/snippet.json?id=2',
      success: function(response) {
        $('body').append("<div id='ecorebox'><p>trees: " + response.trees +
                         "</p><p>water: " + response.water +
                         " gallons</p><p>electricity: " + response.electricity +
                         " kWh</p></div>");
      },
      failure: function(response) {
        $('body').append("<div id='ecorebox'><p>trees: Dozens</p><p>water: Thousands of gallons</p><p>electricity: Watts and watts</p></div>");
      }
    });
  }
})();
*/