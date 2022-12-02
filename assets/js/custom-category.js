$(function(){
    setup_color_circles();
});

function setup_color_circles() {

    if ($('section#products').length && 
        ($('#search_filters .facet .facet-title:contains(Colour)').length ||
          $('#search_filters .facet .facet-title:contains(color)').length)
      ) 
    {
      $('section#products').before('<a name="colorselector"></a><div class="color-selector"></div>');
  
      var facet = $('#search_filters .facet .facet-title:contains(Colour)').parent('section.facet');
      if (facet.length==0) {
        facet = $('#search_filters .facet .facet-title:contains(color)').parent('section.facet');
      }
  
      facet.find('.search-link').each(function(){
        //console.log($(this).html())
        let t = $.trim($(this).html().replace(/<.*/,''));
        let c = '#' + t.replace(/^.*#/,'');
        c = c.replace(/\s+.*?$/,'')
        t = t.replace(c,'');
        $('.color-selector').append('<button type="button" class="btn btn-circle" title="'+t+'" style="background-color:'+c+'"></button>');
      })
  
    }
  
    $('.color-selector .btn-circle').click(function(){
      //console.log('color-selector:'+$(this).attr('title'));
      $(this).blur();
      $(this).addClass('working');
      $('a.search-link:contains('+$(this).attr('title')+')').click();
    });
  
  
    $('.facet-label input[type=checkbox]').click(function(){
      //console.log('color-click:'+$(this).attr('id'));
    });
  
  
    $('body').on('change', '#search_filters input[data-search-url]', function (event) {
      on_update_start();
    });
    $('body').on('click', '.js-search-filters-clear-all', function (event) {
      on_update_start();
    });
    $('body').on('click', '.js-search-link', function (event) {
      on_update_start();
    });
    $('body').on('change', '#search_filters select', function (event) {
      on_update_start();
    });
  
    prestashop.on('updateProductList', (data) => {
      on_update_finish();
    });
  
    on_update_finish()
}
  
var updating_filter = false;
  
function on_update_start() {
      //console.log('updating...');
      //alert('updating...')
      updating_filter = true;
    $('.row.products-selection p').html('Updating product list...');
}
  
function on_update_finish() {
      //console.log('on update');
      //alert('update finish...')
  
    var facet = $('#search_filters .facet .facet-title:contains(Colour)').parent('section.facet');
    if (facet.length==0) {
      facet = $('#search_filters .facet .facet-title:contains(color)').parent('section.facet');
    }
  
    facet.find('.search-link').each(function(){
      let tt = $(this).html().replace(/#\w+/,'');
      $(this).html(tt)
    })
  
    $('.active_filters .filter-block').each(function(){
      let tt = $(this).html().replace(/#\w+/,'');
      $(this).html(tt)
    })
  
  
  
  
    if (updating_filter) {
      updating_filter = false;
  
      if ($('a[name=colorselector]').length>0) {
        setTimeout(function() {
          window.location.href = '#colorselector';
          window.scrollBy(0,-100);

          $('.color-selector .btn-circle').each(function(){
            //console.log('color-selector:'+$(this).attr('title'));
            var fac = $('.facet-label:contains('+$(this).attr('title')+')');
            if (fac.find('input[type=checkbox]').prop('checked')) {
              $(this).removeClass('working');
              $(this).addClass('active');
            }
            else {
              $(this).removeClass('working');
              $(this).removeClass('active');
            }
          });
      


        },200);
      }
    }
  
    //setup_product_flags();
}

  