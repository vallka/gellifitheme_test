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
<!-- slider -->
{if $homeslider.slides}
{if Context::getContext()->getDevice()==4}
  <!-- slider device 4 -->
  <style>
  #custom-text-mobile {
  background: transparent;
  color: #fff;
  margin-top: 1rem;
  margin-bottom: 1rem;
  padding: 0;
  text-align: center;
  }
  .custom-text-mobile h3 {
    color: #d96a9a;
  }
  .carousel .carousel-item .caption {
    padding: 2px;
    position: unset;
    max-width: unset;
    text-align: center;
    margin: -5% 0 5% 5%;
    width: 95%;
    overflow: hidden;
    border: 1px solid #aaa;
    font-size: 12px;
    aspect-ratio: 398/170;
    display: flex;
    align-items: center;
  }
  .caption-content {
    width:100%;
  }
  .carousel .carousel-item img {
    width: 95%;
  }
  </style>
  <div id="custom-text-mobile" class="custom-text-mobile">
  <div class="full-width clearfix ">
  <div class="cc-top">


  {if (strpos($urls.base_url,'.eu')!==false) || (strpos($urls.base_url,'eu.')!==false)}
    <h3>ENTREGA GRATIS</h3>
    En pedidos superiores a 75€
    <h3>AHORRA 15€</h3>
    En pedidos superiores a 150€
    <h3>AHORRA 30%</h3>
    Cuando gasta más de 500€
  {else}
    <h3>FREE DELIVERY</h3>
    On orders over £50
    <h3>SAVE 20%</h3>
    On orders over £250
    <h3>SAVE 30%</h3>
    When you spend over £500
    <h3>BUY NOW PAY LATER</h3>
    with Klarna or Laybuy
  {/if}


  </div>
  </div>
  </div>

  <style>
  .carousel .carousel-item {
      margin-bottom: 10px;
  }
  </style>
  <div id="carousel" class="carousel slide" >
    <ul class="carousel-inner" role="listbox">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        <li class="carousel-item active" role="option" aria-hidden="false">
          <a href="{$slide.url}">
            <figure>
              <img srcset="{imagekit tr='w-510,h-218' url=$slide.image_url} 510w,
                           {imagekit tr='w-690,h-295' url=$slide.image_url} 690w,
                           {imagekit tr='w-930,h-397' url=$slide.image_url} 930w,
                           {imagekit tr='w-1170,h-500' url=$slide.image_url} 1170w"
                           sizes="100vw"
                   src="{imagekit tr='w-1170,h-500' url=$slide.image_url}" alt="{$slide.legend|escape}" 
                   width="398" height="170" style="aspect-ratio: 398/170;"
                   {if $smarty.foreach.homeslider.index>2}loading="lazy"{/if}                                 
              >
              <!-- {$smarty.foreach.homeslider.index} -->
              
              {if $slide.title || $slide.description}
                <figcaption class="caption">
                  <div class="caption-content">
                    <h2 class="display-1 text-uppercase">{$slide.title}</h2>
                    <div class="caption-description">{$slide.description nofilter}</div>
                  </div>
                </figcaption>
              {/if}
            </figure>
          </a>
        </li>
      {/foreach}
    </ul>
  </div>
{else}
  <div id="carousel" data-ride="carousel" class="carousel slide" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}">
    <ul class="carousel-inner" role="listbox">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        <li class="carousel-item {if $smarty.foreach.homeslider.first}active{/if}" role="option" aria-hidden="{if $smarty.foreach.homeslider.first}false{else}true{/if}">
          <a href="{$slide.url}">
            <figure>
              <img srcset="{imagekit tr='w-510,h-218' url=$slide.image_url} 510w,
                           {imagekit tr='w-690,h-295' url=$slide.image_url} 690w,
                           {imagekit tr='w-930,h-397' url=$slide.image_url} 930w,
                           {imagekit tr='w-1170,h-500' url=$slide.image_url} 1170w"
                           sizes="100vw"
                   src="{imagekit tr='w-1170,h-500' url=$slide.image_url}" alt="{$slide.legend|escape}" 
                   width="1170" height="500" style="aspect-ratio: 1170/500;"
                   {if !$smarty.foreach.homeslider.first}loading="lazy"{/if}                                 
              >
              <!-- 1={$smarty.foreach.homeslider.index} -->
              
              {if $slide.title || $slide.description}
                <figcaption class="caption">
                  <h2 class="display-1 text-uppercase">{$slide.title}</h2>
                  <div class="caption-description">{$slide.description nofilter}</div>
                </figcaption>
              {/if}
            </figure>
          </a>
        </li>
      {/foreach}
    </ul>
    <div class="direction" aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
      <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
        <span class="icon-prev hidden-xs" aria-hidden="true">
          <i class="material-icons">&#xE5CB;</i>
        </span>
        <span class="sr-only">{l s='Previous' d='Shop.Theme.Global'}</span>
      </a>
      <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
        <span class="icon-next" aria-hidden="true">
          <i class="material-icons">&#xE5CC;</i>
        </span>
        <span class="sr-only">{l s='Next' d='Shop.Theme.Global'}</span>
      </a>
    </div>
  </div>
{/if}
{/if}
<!-- /slider -->
