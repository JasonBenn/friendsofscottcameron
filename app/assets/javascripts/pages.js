$(document).ready(function() {
  var selectedAmount;

  var handler = StripeCheckout.configure({
    // TODO: replace with actual key. Your Account -> Account Settings -> API Keys -> Live Publishable Key
    key: 'pk_test_E1SMWXgfw5xBodu6wQBOXfLi',
    name: 'Friends of Scott Cameron',
    panelLabel: 'Donate',

    token: function(token) {
      token.amount = selectedAmount;
      $.post('/charges', token).done(function(response) {
        if (response.success) {
          // TODO: display success message. sweetAlert?
          debugger
        } else {
          // TODO: display error message. 
          debugger
        }
      });
    }
  });

  $('button.amount').click(function(e) {
    var $button = $(e.target);
    selectedAmount = $button.val();
    stripePayment($button.text())
  });

  function stripePayment(description) {
    handler.open({
      // TODO: description not really needed, could build from any amount.
      description: description,
      amount: selectedAmount
    });

    return false;
  }

  // close on page navigation
  $(window).on('popstate', function() {
    handler.close();
  });


});
