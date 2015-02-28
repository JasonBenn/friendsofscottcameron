$(document).ready(function() {
  // when page loads, cache some calculations
  // if ($.browser.desktop) {
  //   $window = $(window)
  //   $window.scroll(function(e) {
  //     // console.log(e)
  //     // use translate3d to shift.
  //     return false;
  //   })
  // }

  var handler = StripeCheckout.configure({
    // Your Account -> Account Settings -> API Keys -> Live Publishable Key
    key: 'pk_test_E1SMWXgfw5xBodu6wQBOXfLi',
    name: 'Friends of Scott Cameron',
    panelLabel: 'Donate',
    token: function(token) {
      debugger;
      // invoke when the Checkout process is complete
      // token.id can be used to create a charge or customer. 
      // token.email contains the email address entered by the user

      // this is where we send the token to the backend!
    }
  });

  // close on page navigation
  $(window).on('popstate', function() {
    handler.close();
  });

  $('.button.amount').click(function(e) {
    var $button = $(e.target);
    stripePayment($button.val(), $button.text())
  });

  // $('.other .submit').click(function(e) {
  //   debugger
  //   // $(this).siblings('input')
  // })

  function stripePayment(value, description) {
    var token = function(res) {
      var $input = $('<input type=hidden name=stripeToken />').val(res.id);
      $('form').append($input).submit();
    };

    handler.open({
      description: description,
      amount: value
    });

    return false;
  }

})
