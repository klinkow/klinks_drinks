$(document).ready(function(){


  $('.collapsible').collapsible({
      accordion: false, // A setting that changes the collapsible behavior to expandable instead of the default accordion style
      onOpen: function(el) { alert('Open'); }, // Callback for Collapsible open
      onClose: function(el) { alert('Closed'); } // Callback for Collapsible close
    }
  );
  //  $('.collapsible').collapsible();

  // $('#new_drink_ingredient').click(function(event) {
  //   event.preventDefault();
  //   $('#add_another_ingredient').append("<p>hello</p>");

  });

 });
