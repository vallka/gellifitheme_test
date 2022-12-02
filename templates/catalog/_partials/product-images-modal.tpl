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

<div class="modal fade js-product-images-modal" id="product-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        {assign var=imagesCount value=$product.images|count}
        <figure>
          <img class="js-modal-product-cover product-cover-modal" 
            width="{$product.cover.large.width}" 
            src="{imagekit tr='w-800,h-800' url=$product.cover.large.url}" 
            alt="{$product.cover.legend}" 
            title="{$product.cover.legend}" 
            itemprop="image">
          <i class="videocam material-icons md-light md-36" title="Show video on Instagram"
            style="display:none;top: 67%;left: 13%;width: 40px;position: absolute;height: 40px;transform: scale(2);background-color: #00000050;border-radius: 8px;padding: 1px 3px;cursor:pointer;">videocam</i>
          <i class="instagram icon-gray" title="Show picture on Instagram"
            style="display:none;top: 67%;left: 89%;width: 40px;position: absolute;height: 40px;background-color: #00000050;padding: initial;transform: scale(2);border-radius: 8px;cursor:pointer;"></i>

          <figcaption class="image-caption">
          {block name='product_description_short'}
            <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
          {/block}
        </figcaption>
        </figure>
        <aside id="thumbnails" class="thumbnails js-thumbnails text-sm-center">
          {block name='product_images'}
            <div class="js-modal-mask mask nomargin" style="overflow-y: auto">
              <ul class="product-images js-modal-product-images">
                {foreach from=$product.images item=image}
                  <li class="thumb-container">
                    <img data-image-large-src="{imagekit tr='w-800,h-800' url=$image.large.url}" 
                      class="thumb js-modal-thumb" 
                      src="{imagekit tr='w-148,h-148' url=$image.medium.url}" 
                      alt="{$image.legend}" 
                      title="{$image.legend}" 
                      width="{$image.medium.width}" 
                      itemprop="image">
                  </li>
                {/foreach}
              </ul>
            </div>
          {/block}
          {if $imagesCount > 100}
            <div class="arrows js-modal-arrows">
              <i class="material-icons arrow-up js-modal-arrow-up">&#xE5C7;</i>
              <i class="material-icons arrow-down js-modal-arrow-down">&#xE5C5;</i>
            </div>
          {/if}
        </aside>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
