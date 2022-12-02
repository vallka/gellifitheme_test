{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="images-container">
  {block name='product_cover'}
    <div class="product-cover" style="position:relative">
      <img class="js-qv-product-cover" src="{imagekit tr='w-900,h-900' url=$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" style="width:100%;" itemprop="image">
      <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
        <i class="material-icons zoom-in" id="zoomm">&#xE8FF;</i>
      </div>
      <div class="layer1-non-hidden" id="insta-show-nonmodal" >
            <i class="videocam material-icons md-light md-36" title="Show video on Instagram"
            style="display:none;top: 77%;left: 14%;width: 40px;position: absolute;height: 40px;transform: scale(2);background-color: #00000050;border-radius: 8px;padding: 1px 3px;cursor:pointer;">videocam</i>
            <i class="instagram icon-gray" title="Show picture on Instagram"
            style="display:none;top: 77%;left: 77%;width: 40px;position: absolute;height: 40px;background-color: #00000050;padding: initial;transform: scale(2);border-radius: 8px;cursor:pointer;"></i>
      </div>
    </div>
  {/block}

  {block name='product_images'}
    <div class="js-qv-mask mask">
      <ul class="product-images js-qv-product-images">
        {foreach from=$product.images item=image}
          <li class="thumb-container">
            <img
              class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
              data-image-medium-src="{imagekit tr='w-900,h-900' url=$image.bySize.large_default.url}"
              data-image-large-src="{imagekit tr='w-900,h-900' url=$image.bySize.large_default.url}"
              src="{imagekit tr='w-200,h-200' url=$image.bySize.large_default.url}"
              alt="{$image.legend}"
              title="{$image.legend}"
              width="100"
              itemprop="image"
            >
          </li>
        {/foreach}

      </ul>
    </div>
  {/block}
</div>
{hook h='displayAfterProductThumbs'}

<!--
<div id="_new_img">

<li class="thumb-container" style="width:100px;height:100px;overflow:hidden">
            <img class="thumb js-thumb" 
              data-image-medium-src="https://www.instagram.com/p/BuGl80wBLjC/media?size=m" 
              data-image-large-src="https://www.instagram.com/p/BuGl80wBLjC/media?size=l" 
              src="https://www.instagram.com/p/BuGl80wBLjC/media?size=t" 
              alt="" title="" itemprop="image" width="100">
          </li>
<li class="thumb-container" style="width:100px;height:100px;overflow:hidden">
            <img class="thumb js-thumb" 
              data-image-medium-src="https://www.instagram.com/p/BB9V81hH8X1/media?size=m" 
              data-image-large-src="https://www.instagram.com/p/BB9V81hH8X1/media?size=l" 
              src="https://www.instagram.com/p/BB9V81hH8X1/media?size=t" 
            alt="" title="" itemprop="image" width="100">
          </li>

</div>
-->

<script>
/*
$(document).ready(function(){
  alert(1)

$('#zoomm').click(function (e) {
    // custom handling here
    e.preventDefault();
    alert(2)
});
});
*/

</script>