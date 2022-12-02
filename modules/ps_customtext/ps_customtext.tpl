{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{assign var="txts" value="<hr />"|explode:$cms_infos.text}
  <!-- 

device: {Context::getContext()->getDevice()}
url: {$urls.base_url}

 -->

{if Context::getContext()->getDevice()==4}

<div id="custom-text" class="custom-text-mobile">
<div class="full-width clearfix top-home-block">
<div class="cc-text">{$txts[0] nofilter}</div>
<div class="cc-text">{$txts[1] nofilter}</div>
</div>
</div>

{else}

<div id="custom-text">
<div class="cc-0">
{if (strpos($urls.base_url,'.eu')!==false) || (strpos($urls.base_url,'eu.')!==false)}
  <div class="col-md-4">
  <h3>ENTREGA GRATIS</h3>
  En pedidos superiores a 75€</div>
  <div class="col-md-4">
  <h3>AHORRA 15€</h3>
  En pedidos superiores a 150€</div>
  <div class="col-md-4">
  <h3>AHORRA 30%</h3>
  Cuando gasta más de 500€</div>
{else}
  <div class="col-md-3">
  <h3>FREE DELIVERY</h3>
  On orders over £50</div>
  <div class="col-md-3">
  <h3>SAVE 20%</h3>
  On orders over £250</div>
  <div class="col-md-3">
  <h3>SAVE 30%</h3>
  When you spend over £500</div>
  <div class="col-md-3">
  <h3>BUY NOW PAY LATER</h3>
  with Klarna or Laybuy</div>
{/if}
</div>
<div class="full-width clearfix top-home-block">
<div class="normal-width">
<div class="col-md-6 cc-1">
<div class="grid"><img src="{imagekit tr='w-570,h-412' url='/img/cms/FRONT-SIDE-1.png'}" alt="" width="570" height="412" /><br /><br /></div>
<div class="cca"><img src="{imagekit tr='w-570,h-412' url='/img/cms/21-09-04-Cap00392-home.jpg'}" alt="" width="570" height="412" /></div>
<div class="cc-text">{$txts[1] nofilter}</div>
</div>
<div class="col-md-6 cc-2">
<div class="ccb"><img src="{imagekit tr='w-570,h-412' url='/img/cms/FRONT-BANNER-right-2.png'}" alt="" width="570" height="412" /></div>
<br />
<div class="grid"><img src="{imagekit tr='w-570,h-412' url='/img/cms/FRONT-SIDE-2.png'}" alt="" width="570" height="412" /></div>
<div class="cc-text">{$txts[0] nofilter}</div>
</div>
</div>
</div>
</div>

{/if}

