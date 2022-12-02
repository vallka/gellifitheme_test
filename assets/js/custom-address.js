$(function(){
    if ($('form input[name=postcode]').length>0) {
        setup_address_fields();
    }
});

function setup_address_fields() {
    var f = $('form input[name=postcode]');
    if (f.length>0) {
      $(f).blur(function() {this.value=this.value.toUpperCase()})
      $(f).css("text-transform","uppercase");
    }
  
    if ($('.js-address-form').length>0) {
      $('.js-address-form form input[name=firstname]').blur(capitalizeField);
      $('.js-address-form form input[name=lastname]').blur(capitalizeField);
      $('.js-address-form form input[name=company]').blur(capitalizeField);
      $('.js-address-form form input[name=address1]').blur(capitalizeField);
      $('.js-address-form form input[name=address2]').blur(capitalizeField);
      $('.js-address-form form input[name=city]').blur(capitalizeField);
    }
    
}
  
function capitalizeField() {
    var v=this.value
  
    if (v.match(/^[^A-Z]+$/)) {
      v = toTitleCase(v)
      this.value = v;
    }
  
}
  
function toTitleCase(str) {
    return str.replace(
        /\b\w+/g,
        function(txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        }
    );
}
  
  