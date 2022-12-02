$(function(){
    /* authentication checkout */
    if ($('#customer-form input[name=email]').length && 
        $('#customer-form input[name=newsletter]').length &&
        $('#customer-form input[name=email]').val()=='') {
      $('#customer-form input[name=newsletter]').prop('checked',true);
    }
});
  