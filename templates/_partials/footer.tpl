*{**
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
{if $page.page_name=='index' || Context::getContext()->getDevice()<4}

<div class="container">
  <div class="row">
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>
</div>
<div class="footer-container">
  <div class="container">
    <div class="row">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>
    <div class="row">
      {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
      {/block}
    </div>
    <div class="row">
      <div class="col-md-12">
        <p class="text-sm-center copynote">
          {block name='copyright_link'}
              {l s='%copyright% %year% - GellifiQue&reg;' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
          {/block}
        </p>
      </div>
    </div>
  </div>
</div>


{if 0 and (strpos($urls.base_url,'.eu')===false) && (strpos($urls.base_url,'eu.')===false)}
<style>
#opener {
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 1000;
  /*background-color:white;*/
  cursor: pointer;
}    
.ui-dialog .ui-dialog-content {
  overflow: hidden;
}
.ui-dialog  {
  position: fixed !important;
}
</style>

<div id="dialog" style="padding: 0;">
  <iframe src="" height="98%" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>
</div>

<div id="opener" style="display:none"><img src="/gellifina1.png" width="80" height="80" title="Ask me a question" /></div>
{/if}

{/if}
