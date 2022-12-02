$(function(){
    if ($('#product-modal').length>0) {
      setup_instagram_images();
    }
  
    if ($('section.product-features dl.data-sheet').length>0) {
      fix_color_group();
    }
});

function setup_instagram_images() {
    const id = $('#product_page_product_id').val();
    console.log(id);
  
    $.getJSON('/vk/insta/gellifique_instaproducts.php?id='+id, function( data ) {
      console.log(data);
      setup_instagram_images__(data);
    });
}

function setup_instagram_images__(instacodes) {
    for(let i=0;i<instacodes.length;++i) {
        let new_li = $('.js-qv-product-images li:first').clone(true);
        $(new_li).find('img').removeClass('selected');
        $(new_li).find('img').attr('src',instacodes[i][1]  + "?tr=w-200");
        $(new_li).find('img').attr('data-image-medium-src',instacodes[i][1]);
        $(new_li).find('img').attr('data-image-large-src',instacodes[i][1]);
        $(new_li).find('img').attr('data-image-media-type',instacodes[i][2]);
        $(new_li).find('img').attr('data-insta-src','https://www.instagram.com/p/' + instacodes[i][0]);
        new_li.appendTo('.js-qv-product-images');

        let new_mo_li = $('.js-modal-product-images li:first').clone(true);
        $(new_mo_li).find('img').removeClass('selected');
        $(new_mo_li).find('img').attr('src',instacodes[i][1]);
        //$(new_mo_li).find('img').attr('data-image-medium-src',instacodes[i][1]);
        $(new_mo_li).find('img').attr('data-image-large-src',instacodes[i][1]);
        $(new_mo_li).find('img').attr('data-image-media-type',instacodes[i][2]);
        $(new_mo_li).find('img').attr('data-insta-src','https://www.instagram.com/p/' + instacodes[i][0]);
        new_mo_li.appendTo('.js-modal-product-images');

    }

    //$('.scroll-box-arrows').show();
    imageScrollBox(); 

    $('#product-modal').on('shown.bs.modal',onShowProductModal)
    $('#product-modal .js-modal-product-images').click(function(){setTimeout(onShowProductModal,100)})
    $('#content .product-cover img').css('height',$('#content .product-cover').width()+'px')
    $('#content .product-cover img').css('object-fit','cover')
    //$('#product-modal figure i:hover').css('background-color','##00000030');

    $('#product-modal figure i').click(onInstaClickM);
    $('#insta-show-nonmodal i').click(onInstaClick);


    $('.js-thumb').click(function(e){
        console.log($(e.target).attr('data-insta-src'))
        //if (e.target.src.match(/instagram\.com/)) {
        if ($(e.target).attr('data-insta-src') && $(e.target).attr('data-insta-src').match(/instagram\.com/)) {
        $('#insta-show-nonmodal i.instagram').show();
        if ($(e.target).attr('data-image-media-type') && $(e.target).attr('data-image-media-type')==1) {
            $('#insta-show-nonmodal i.videocam').show();
        }
        else {
            $('#insta-show-nonmodal i.videocam').hide();
        }
        }
        else {
        $('#insta-show-nonmodal i').hide();

        }

    });

}

function imageScrollBox()
{
    if ($('#main .js-qv-product-images li').length > 2) {
        $('#main .js-qv-mask').addClass('scroll');
        $('.scroll-box-arrows').addClass('scroll');
        $('#main .js-qv-mask').scrollbox({
            direction: 'h',
            distance: 113,
            autoPlay: false
        });
        $('.scroll-box-arrows .left').click(function () {
            $('#main .js-qv-mask').trigger('backward');
        });
        $('.scroll-box-arrows .right').click(function () {
            $('#main .js-qv-mask').trigger('forward');
        });
    } else {
        $('#main .js-qv-mask').removeClass('scroll');
        $('.scroll-box-arrows').removeClass('scroll');
    }
} 

function onInstaClick() {
    let url = $('.js-qv-product-images li img.selected').attr('data-insta-src')
    if (url.match(/instagram\.com/)) {
      url=url.replace(/media.*$/,'')
      //alert(url);
      setTimeout(() => window.open(url,'_blank').focus(), 500);
    }
}
  
function onInstaClickM() {
    let thumb = $('img.thumb.js-modal-thumb.selected')
  
    if (!thumb.length) {
      thumb = $('.js-qv-product-images li img.selected')
    }
  
    if (thumb && thumb.attr('data-insta-src') && thumb.attr('data-insta-src').match(/instagram\.com/)) {
      url = thumb.attr('data-insta-src');
      url=url.replace(/media.*$/,'')
      //alert(url);
      setTimeout(() => window.open(url,'_blank').focus(), 500);
    }
}
  
function onShowProductModal() {
    let thumb = $('img.thumb.js-modal-thumb.selected')
  
    if (!thumb.length) {
      thumb = $('.js-qv-product-images li img.selected')
    }
  
    console.log(thumb);
    console.log(thumb.attr('data-insta-src'));
  
    if (thumb && thumb.attr('data-insta-src') && thumb.attr('data-insta-src').match(/instagram\.com/)) {
      console.log('insta!!!')
      //$('#product-modal figure img').css('padding','100px');
      //$('#product-modal figure img').css('object-fit','cover')
      //$('#product-modal figure img').height($('#product-modal figure img').width())
      $('#product-modal figure i').show();
  
      if (thumb.attr('data-image-media-type') && thumb.attr('data-image-media-type')==1) {
        $('#product-modal figure i.videocam').show();
      }
      else {
        $('#product-modal figure i.videocam').hide();
      }
    }
    else {
      console.log('no--insta!!!')
      //$('#product-modal figure img').css('padding','0');
      $('#product-modal figure i').hide();
  
    }
  
}
  
function fix_color_group()  {
    $('section.product-features dl.data-sheet dd').each(function(i){
      if (m=this.innerHTML.match(/^([^#]+)\s(#\w{6})\s*/)) {
        //console.log(m)
        //$(this).css('backgroundColor',m[2]);
        this.innerHTML = m[1] + ' <button type="button" class="btn btn-circle" style="margin:-6px 6px;border: 1px solid black;background-color:'+m[2]+';"></button>';
      }
    })
  
}
    