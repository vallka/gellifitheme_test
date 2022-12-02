$(function(){
    if ($('#discounts-info').length>0) {
        setup_discounts();
    }
});

function setup_discounts() {
    //console.log('setup_discounts:'+order_country+order_qualified_total+order_currency)
    
    var rates = [];
    $('.currency-selector ul li').each(function(){
      if ($(this).attr('data-currency-iso-code') && $(this).attr('data-currency-conversion-rate')) {
        rates[$(this).attr('data-currency-iso-code')] = parseFloat($(this).attr('data-currency-conversion-rate'));
      }
    });
    //console.log(rates)
    //console.log(order_qualified_total / rates[order_currency]);
  
    if (!order_country) {
      $('#discounts-info-uk').addClass('discount-actual-region')
    }
    else if (order_country=='GB') {
      $('#discounts-info-eu').hide();
      $('#discounts-info-us').hide();
      $('#discounts-info-other').hide();
      $('#discounts-info-uk').addClass('discount-actual-region')
    }
    else if (order_country=='US') {
      $('#discounts-info-eu').hide();
      $('#discounts-info-uk').hide();
      $('#discounts-info-other').hide();
      $('#discounts-info-us').addClass('discount-actual-region')
    }
    else if (order_country=='BE' ||
            order_country=='FR' ||
            order_country=='DE' ||
            order_country=='IE'	||	
            order_country=='LU'	||	
            order_country=='NL'	||	
            order_country=='BG'	||	
            order_country=='HR'	||	
            order_country=='CZ'	||	
            order_country=='DK'	||	
            order_country=='EE'	||	
            order_country=='FI'	||	
            order_country=='GR'	||	
            order_country=='HU'	||	
            order_country=='IT'	||	
            order_country=='LV'	||	
            order_country=='LT'	||	
            order_country=='PL'	||	
            order_country=='PT'	||	
            order_country=='RO'	||	
            order_country=='SK'	||	
            order_country=='SI'	||	
            order_country=='ES'	||	
            order_country=='SE' ||
            order_country=='GG' ||
            order_country=='NO'	||	
            order_country=='CH') 
    {
      $('#discounts-info-uk').hide();
      $('#discounts-info-us').hide();
      $('#discounts-info-other').hide();
      $('#discounts-info-eu').addClass('discount-actual-region')
    }   
    else {
      $('#discounts-info-uk').hide();
      $('#discounts-info-us').hide();
      $('#discounts-info-uk').hide();
      $('#discounts-info-other').addClass('discount-actual-region')
    }
    
  
    var discount_names = [];
    var discount_froms = [];
    $('.discount-actual-region .discount-name').each(function(){
      discount_names[discount_names.length] = $(this).text();
    })
    $('.discount-actual-region .discount-from').each(function(){
      discount_froms[discount_froms.length] = parseInt($(this).text());
    })
  
    console.log(discount_names)
    console.log(discount_froms)
  
    var discount_spend_more=0;
    for (var i = 1; i < discount_froms.length; i++) {
      if (order_qualified_total/rates[order_currency]<discount_froms[i] && order_qualified_total/rates[order_currency]>discount_froms[i]*0.8) {
        discount_spend_more=$('#discount-spend-more').text();
        
        discount_spend_more = discount_spend_more.replace('XXX',order_currency_sign+Math.ceil(rates[order_currency]*(discount_froms[i]-order_qualified_total/rates[order_currency])));
        discount_spend_more = discount_spend_more.replace('ZZZ',discount_names[i]);
  
        $('#discount-spend-more').text(discount_spend_more);
        $('#discount-spend-more').show();
        break;
      }
    }
    if (!discount_spend_more) {
      if (order_total/rates[order_currency]<discount_froms[0] && order_total/rates[order_currency]>discount_froms[0]*0.8) {
        discount_spend_more=$('#discount-spend-more').text();
        
        discount_spend_more = discount_spend_more.replace('XXX',order_currency_sign+Math.ceil(rates[order_currency]*(discount_froms[0]-order_total/rates[order_currency])));
        discount_spend_more = discount_spend_more.replace('ZZZ',discount_names[0]);
  
        $('#discount-spend-more').text(discount_spend_more);
        $('#discount-spend-more').show();
      }
    }
  
  
    $('#discount-currency-rate').text(rates[order_currency]);
  }
  
