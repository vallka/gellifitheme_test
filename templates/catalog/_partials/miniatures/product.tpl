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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature product-section" 
      data-id-product="{$product.id_product}" 
      data-id-manufacturer="{$product.id_manufacturer}" 
      data-id-product-attribute="{$product.id_product_attribute}" 
      itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      {block name='product_thumbnail'}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img
            src="{imagekit tr='w-500,h-500' url=$product.cover.bySize.large_default.url}"
            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:60:'...'}{/if}"
            title="{$product.meta_description}"
            data-full-size-image-url="{$product.cover.large.url}"
            width="250" height="250" style="height:auto; aspect-ratio:1/1;"
            loading="lazy"
          >
        </a>
      {/block}

      <div class="product-description">
        {block name='product_name'}
          <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:60:'...'}</a></h1>
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage">{$product.discount_percentage}</span>
                {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

            {hook h='displayProductPriceBlock' product=$product type='weight'}
          </div>

          <div class="list-add-to-cart">
          
                <form action="{$urls.pages.cart}" method="post">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}">
                  <input type="hidden" name="id_customization" value="{*$product.id_customization*}">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-list-add-to-cart.tpl'}
                  {/block}


                  {block name='product_refresh'}
                    <!-- input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}" -->
                  {/block}
                </form>
          </div>
        {/if}
      {/block}

      {block name='product_reviews'}
        {hook h='displayProductListReviews' product=$product}
      {/block}
    </div>

    {block name='product_flags'}
      {$in_spain = false}
      {$back_in_stock = false}
      {$last_chance = false}
      {$spec_price = false}
      {foreach from=$product.features item=feature}
        {if $feature.id_feature==16 && ($feature.value=='Yes' || $feature.value=='Si')}
          {$in_spain = true}
        {/if}
        {if $feature.id_feature==17 && ($feature.value=='Yes' || $feature.value=='Si')}
          {$back_in_stock = true}
        {/if}
        {if $feature.id_feature==24 && ($feature.value=='Yes' || $feature.value=='Si')}
          {$last_chance = true}
        {/if}
        {if $feature.id_feature==25 && ($feature.value=='Yes' || $feature.value=='Si')}
          {$spec_price = true}
        {/if}
      {/foreach}


      <ul class="product-flags">
        {if $product.id_manufacturer==5 || $product.id_manufacturer==6 || $product.id_manufacturer==7}
          <li class="product-flag partner-brand">PARTNER BRAND</li>
        {/if}
        {if $in_spain}
          <!-- li class="product-flag in-spain">¡En España!</!-->
          <li class="product-flag in-spain">Enhanced Formula</li>
        {/if}
        {if $last_chance}
          <li class="product-flag last-chance">LAST CHANCE</li>
        {/if}
        {if $spec_price}
          <li class="product-flag spec-price">SPECIAL PRICE</li>
        {/if}

        {foreach from=$product.flags item=flag}
	        {if $flag.type=='new'}
            {if !$product.add_to_cart_url}
              <li class="product-flag {$flag.type}-coming">{l s='Coming Soon!' d='Shop.Theme.Catalog'}</li>
            {else if $back_in_stock}
              <li class="product-flag {$flag.type}-coming">{l s='Back in stock' d='Shop.Theme.Catalog'}</li>
            {else}
              <li class="product-flag {$flag.type}">{$flag.label}</li>
            {/if}
          {else}
              <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/if}

        {/foreach}
        <!--   in_spain:{$in_spain} -->
      </ul>
    {/block}

    <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
      {block name='quick_view'}
        <!--
        <a class="quick-view" href="#" data-link-action="quickview">
          <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
        </a>
        -->
      {/block}

      {block name='product_variants'}
        {if $product.main_variants}
          {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
        {/if}
      {/block}
    </div>

  </article>
{/block}
