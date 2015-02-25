$(document).ready(function() {
  // when page loads, cache some calculations
  if ($.browser.desktop) {
    $window = $(window)
    $window.scroll(function(e) {
      // console.log(e)
      // use translate3d to shift.
      return false;
    })
  }

  $('button.amount').click(function(e) {
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

    StripeCheckout.open({
      key:         'pk_test_E1SMWXgfw5xBodu6wQBOXfLi',
      address:     true,
      amount:      value,
      currency:    'usd',
      name:        'Friends of Scott Cameron',
      description: description,
      panelLabel:  'Checkout',
      token:       token
    });

    return false;
  }

})
