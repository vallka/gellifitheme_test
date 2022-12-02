/*
 * For home pages (index)
 */
$(function(){
    setup_carousel();
    readReviews();

  if ($(window).width()>= 992){
    setup_scroll_effects();
  }

});

$('#carousel').on('slide.bs.carousel', function () {
    //console.log('slide.bs.carousel');
    $('.carousel .carousel-item .caption').css('transition','none');
    $('.carousel .carousel-item .caption').css('opacity','0');
    $('.carousel .carousel-item .caption').css('left','-400px');
});

$('#carousel').on('slid.bs.carousel', function () {
    //console.log('slid.bs.carousel');
    $('.carousel .carousel-item .caption').css('transition','all 1.5s ease-out');
    $('.carousel .carousel-item .caption').css('opacity','0.6');
    $('.carousel .carousel-item .caption').css('left','0');
});
  
function setup_carousel() {
    $('.carousel .carousel-item .caption').css('transition','all 1.5s ease-out');
    $('.carousel .carousel-item .caption').css('opacity','0.6');
    $('.carousel .carousel-item .caption').css('left','0');
}

  
function setup_scroll_effects() {
    if ($('#new-products').length>0) {
  
      $(document).scroll(function(){
        var sc=$(document).scrollTop();
        var fp = $('#new-products');
  
        if (sc>=fp.offset().top-$(window).innerHeight()) fireSec(fp,1);
        else fireSec(fp,0);
      });
    }
    if ($('#featured-products').length>0) {
  
      $(document).scroll(function(){
        var sc=$(document).scrollTop();
        var fp = $('#featured-products');
  
        if (sc>=fp.offset().top-$(window).innerHeight()) fireSec(fp,1);
        else fireSec(fp,0);
      });
    }
    if ($('#custom-text').length>0) {
      $(document).scroll(function(){
        var sc=$(document).scrollTop();
  
        var fc = $('#custom-text');
        if (sc>=fc.offset().top-$(window).innerHeight()) fireSec(fc,1,null);
        else fireSec(fc,0,null);
      });
    }
  
    if ($('.footer-container .container').length>0) {
      $(document).scroll(function(){
        var sc=$(document).scrollTop();
  
        var fc = $('.footer-container .container');
        if (sc>=fc.offset().top-$(window).innerHeight()) fireSec(fc,1,null);
        else fireSec(fc,0,null);
      });
    }
}


function fireSec(fp,fix,func) {
    if (fix && !fp.hasClass('scroll-open')) {
      fp.addClass('scroll-open');
      fp.css('transition','none')
      fp.css('transform','scale(0.95)')
      setTimeout(function(){
        fp.css('transition','all 0.7s ease-out');
        fp.css('transform','none');
        if (func) func.call();
      },500)
    }
    else if (!fix && fp.hasClass('scroll-open')) {
      fp.css('transition','none')
      fp.removeClass('scroll-open');
      if (func) func.call();
    }
}
  
function simpleCallAjax(url, callback){
  var xmlhttp;
  // compatible with IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function(){
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
          callback(xmlhttp.responseText);
      }
  }
  xmlhttp.open("GET", url, true);
  xmlhttp.send();
}  


function readReviews() {
  const url='/module/productcomments/display?h=1&ajax=1';
  simpleCallAjax(url, function(txt){
    document.getElementById('content').insertAdjacentHTML('beforeend','<div id="home-reviews-container" class="full-width"><div id="home-reviews" class="normal-width">'+
    '<h1 class="h1 products-section-title text-uppercase"><a href="/module/productcomments/display">WHAT CUSTOMERS SAY<i class="material-icons">&#xE315;</i></a></h1>'+
    '</div></div>'); 
    const rvs = JSON.parse(txt);

    for (let i=0;i<rvs.length;++i) {
      let rvhtml="<div class='row'>"+
      "<div class='col-sm-10 col-xs-8'>"+
      rvs[i].content+"<br><br>"+
      "<a href='"+rvs[i].product_link+"'><b>"+rvs[i].name+"</b></a>"+
      " - <i>" +rvs[i].customer_name+"</i>"+
      "</div>"+
      "<div class='col-sm-2 col-xs-4'><a href='"+rvs[i].product_link+"'><img src='"+rvs[i].img_link+"'></a></div>"+
    
      "<div class='col-sm-12 col-xs-12'><hr></div></div>";
  
      document.getElementById('home-reviews').insertAdjacentHTML('beforeend',rvhtml); 

      if ($(window).width()>= 992){
        $(document).scroll(function(){
          var sc=$(document).scrollTop();
          var fp = $('#home-reviews');
    
          if (sc>=fp.offset().top-$(window).innerHeight()) fireSec(fp,1);
          else fireSec(fp,0);
        });
      }
    }
  });
}

