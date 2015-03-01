$(document).ready(function() {
  var selectedAmount;
  var selectedDescription;

  $('.other input').maskMoney({ prefix: '$' });

  $('.other input').on('keyup keypress blur', function(e) {
    var money = $('.other input').val();
    if (money && money !== '$0.00') {
      $('.other button').removeClass('disabled');
    } else {
      $('.other button').addClass('disabled');
    }
  })

  var handler = StripeCheckout.configure({
    key: STRIPE_PUBLISHABLE_KEY,
    name: 'Friends of Scott Cameron',
    panelLabel: 'Donate',

    token: function(token) {
      token.amount = selectedAmount;
      $.post('/charges', token).done(function(response) {
        if (response.success) {
          // TODO: display success message. sweetAlert?
           // {success: true, message: "Thank you for your donation of 5000"}
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
    selectedDescription = $button.text();
    selectedAmount = $button.maskMoney('unmasked')[0];
    stripePayment($button.text())
  });

  $('.other .submit:not(.disabled)').click(function(e) {
    var $button = $(e.target);
    selectedDescription = $button.siblings('input').val();
    selectedAmount = $button.maskMoney('unmasked')[0];
    stripePayment($button.text())
  });

  function stripePayment(description) {
    handler.open({
      // TODO: description not really needed, could build from any amount.
      description: selectedDescription,
      amount: selectedAmount
    });

    return false;
  }

  // close on page navigation
  $(window).on('popstate', function() {
    handler.close();
  });
});


// TODO: I'd like the email notification to go to the scott@friendsofscottcameron.com email address, assuming that will work.  I do need to figure out how to access it.
