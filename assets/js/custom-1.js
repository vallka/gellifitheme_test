$(function(){
  setup_fixed_menu();
  setup_menu();
  //setup_trustpilot();
  setup_list_add_to_cart();
  prestashop.on('updateProductList', setup_list_add_to_cart  );

  prestashop.on('updateCart', (data) => {
    console.log('updateCart***');
    console.log(data.resp.id_product);

    if (typeof window.gtag_items!='undefined' && window.gtag_items.length>0) {
        for(let i=0;i<window.gtag_items.length;i++) {
            if (window.gtag_items[i].id==data.resp.id_product) {
                gtag("event", "add_to_cart", {
                    currency: gtag_items[i].currency,
                    value: gtag_items[i].price_wt,
                    items: [
                        gtag_items[i].item
                    ]
                });
                console.log("*gtag event add_to_cart* " + gtag_items[i].item.item_id);
            }
        }
    }
  });

});



function add_tp_count() {
  let curr_count = parseInt($('#tp_count').text());
  if (curr_count<trustpilot.reviewCount) {
    if (curr_count<100) {
      curr_count += 10;
    }
    else if (curr_count<200) {
      curr_count += 5;
    }
    else {
      curr_count += 1;
    }
    $('#tp_count').text(curr_count);
    setTimeout(add_tp_count,10);
  }
}

function add_tp_value() {
  let curr_count = parseFloat($('#tp_value').text());
  if (curr_count<trustpilot.ratingValue) {
    $('#tp_value').text(Math.round((curr_count+0.1)*10)/10);
    setTimeout(add_tp_value,50);
  }
}

function setup_trustpilot() {
  if (trustpilot) {
    if ($('body').attr('id')=='index') {
      if ($('#tp_count').length>0) {
        add_tp_count();
      }
      if ($('#tp_value').length>0) {
        add_tp_value();
      }
      if ($('#tp_count').length>0) {
        $('#tp_count').parents('.tp_rating').show();
      }
    }
    else if ($('body').attr('id')!='cart' && $('body').attr('id')!='checkout') {
      $('#tp_count').text(trustpilot.reviewCount);
      $('#tp_value').text(trustpilot.ratingValue);
      $('#tp_count').parents('.tp_rating').show();
    }
  }
}

function setup_fixed_menu() {
  var headerH=93;

  $(document).scroll(function(){
    //bot_opener_reset();
    var sc=$(document).scrollTop();

    if (sc>=headerH) fireFixHead(1);
    else fireFixHead(0);
  });
}

function setup_menu() {
  $(".navbar-burger").click(function() {
    // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");

  });

  $('#top-menu').show();

  $('.navbar a.navbar-link').click(function(e){
    e.preventDefault();
    //faceted_spinner(1);
  })
  $('.navbar a.navbar-link').contextmenu(function(e){
    e.preventDefault();
    if ($(this).attr('href')) {
      location.href = $(this).attr('href');
    }
  })
  $('.navbar a.navbar-link').dblclick(function(e){
    e.preventDefault();
    if ($(this).attr('href')) {
      location.href = $(this).attr('href');
    }
  })
  $('.navbar a.dropdown-trigger').click(function(e){
    e.preventDefault();
    //faceted_spinner(1);
  })
  $('.navbar a.dropdown-trigger').contextmenu(function(e){
    e.preventDefault();
    if ($(this).attr('href')) {
      faceted_spinner(1);
      location.href = $(this).attr('href');
    }
  })
  $('.navbar a.dropdown-trigger').dblclick(function(e){
    e.preventDefault();
    if ($(this).attr('href')) {
      faceted_spinner(1);
      location.href = $(this).attr('href');
    }
  })
  $('.navbar a').click(function(e){
    if ($(this).hasClass('navbar-link') || $(this).hasClass('dropdown-trigger') || $(this).hasClass('navbar-burger')) {
    }
    else {
      faceted_spinner(1);
    }
  })

  $("a.product-thumbnail").click(function(e){
      faceted_spinner(1);
  })
  $("#subcategories a").click(function(e){
    faceted_spinner(1);
  })

  $('#cart .cart-items .remove-from-cart').click(function(e){
    faceted_spinner(1);
    setTimeout(function(){location.reload()},100);
  })
  $('#cart .cart-items .btn-touchspin').click(function(e){
    faceted_spinner(1);
    setTimeout(function(){location.reload()},100);
  })
  $('#cart .cart-items .js-cart-line-product-quantity').change(function(e){
    faceted_spinner(1);
    setTimeout(function(){location.reload()},100);
  })
  
  $('.top-menu li .collapse-icons').hide();
}

function fireFixHead(fix) {
  if (fix && !$('#header .header-top').hasClass('header-top-fixed')) {
    $('#header .header-top').addClass('header-top-fixed')
    $('#header .header-top').css('transition','none');
    $('#header .header-top').hide();
    $('#header .header-top').css('top',-90);
    $('#header .header-top').css('opacity',0.1);
    $('#header .header-top').show();

    setTimeout(function(){
      $('#header .header-top').css('transition','all 0.7s ease-out');
      $('#header .header-top').css('opacity',1);
      $('#header .header-top').css('top', 0);
      //$('#header .header-top').css('top', $(window).width()>750? 0:-46);
    },100)

    //$('#header .header-top').animate({top:0,opacity:1},700);
  }
  else if (!fix && $('#header .header-top').hasClass('header-top-fixed')) {
    $('#header .header-top').removeClass('header-top-fixed')
    $('#header .header-top').css('transition','none');
  }
}



function faceted_spinner(show) {
  if (show) {
    if ($('.faceted-overlay-copy').length==0) {
      var div='<div class="faceted-overlay-copy">\n<div class="overlay__inner">\n<div class="overlay__content"><span class="spinner"></span></div>\n</div>\n</div>';
      $('body').append(div);
      //bot_opener_off();
    }
  }
  else {
    if ($('.faceted-overlay-copy').length>0) {
      $('.faceted-overlay-copy').remove();
      //bot_opener_ready();
    }
  }
}

var last_cart_data;

function setup_list_add_to_cart() {
  $('.list-add-to-cart .quantity_wanted').TouchSpin({
    verticalbuttons: true,
    verticalupclass: 'material-icons touchspin-up',
    verticaldownclass: 'material-icons touchspin-down',
    buttondown_class: 'btn btn-touchspin js-touchspin',
    buttonup_class: 'btn btn-touchspin js-touchspin',
    min: 1,
    max: 1000000
  }); 

  $('button.add-to-cart').click(function(e) {
    faceted_spinner(true);
  });


  prestashop.on('updateCart', (data) => {
    last_cart_data = data
    setTimeout(function(){faceted_spinner(false)},1000);
    setTimeout(function(){$('#blockcart-modal').modal('hide')},5000);
  });
}

/*

$( function() {
  var dialog_open = false;  
  $( "#dialog" ).dialog({
    height: 530,  
    width: 300,
    position: { my: "right bottom", at: "right bottom", of: window },
    autoOpen: false,
    title: "Ask me a question",
    close: function( event, ui ) {
      dialog_open = false;
      $( "#opener" ).css('right','0');
    },
    open: function( event, ui ) {
      dialog_open = true;
      $( "#opener" ).css('right','300px');
      if ($('#dialog iframe').attr('src')=='') {
        $('#dialog iframe').attr('src','/chatbot.php')
      }
      $('#dialog iframe').contents().find('input').get(0).focus();
    }

  });

  $( "#opener" ).on( "click", function() {
    if (!dialog_open) {
          $( "#dialog" ).dialog( "open" );
    }
    else {
      $( "#dialog" ).dialog( "close" );
    }
  });
  $( "#opener2" ).on( "click", function() {
    if (!dialog_open) {
          $( "#dialog" ).dialog( "open" );
    }
    else {
      $( "#dialog" ).dialog( "close" );
    }
    return false;
  });
  $( "#closer" ).on( "click", function() {
    $( "#dialog" ).dialog( "close" );
  });

  bot_opener_ready();
});

var bot_opener_visible = false;

function bot_opener_ready() {
  if (!bot_opener_visible)
    setTimeout( function() {$( "#opener" ).fadeIn(function() {bot_opener_visible = true});},5000);
}

function bot_opener_off() {
  if (bot_opener_visible)
    $( "#opener" ).fadeOut(function() {bot_opener_visible = false});
}

function bot_opener_reset() {
  if (bot_opener_visible)
    $( "#opener" ).fadeOut(function() {bot_opener_visible = false;bot_opener_ready()});
}
*/