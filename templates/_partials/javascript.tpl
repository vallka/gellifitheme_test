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
{foreach from=$javascript.external item=$js name='javascript_external'}
  <script {if !$smarty.foreach.javascript_external.first}defer{/if} type="text/javascript" src="{$js.uri}?1786c" {$js.attribute}></script>
{/foreach}

{if $javascript.external}
  {if $page.page_name=='category'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-category.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='product'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-product.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='cart'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-discounts.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='checkout'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-discounts.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-address.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-newsletter.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='address'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-address.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='authentication' || $page.page_name=='identity' }
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-newsletter.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  {if $page.page_name=='order-detail'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-tracking.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}

  {*if $page.page_name=='index' && Context::getContext()->getDevice()<4*}
  {if $page.page_name=='index'}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/custom-home.js?{Configuration::get('MYADMINEXTRA_JS_TS')}" ></script>
  {/if}
  <script defer type="text/javascript" src="/themes/gellifitheme/assets/js/pwa.js?1" ></script>
{/if}

{foreach $javascript.inline as $js}
  <script type="text/javascript">
    {$js.content nofilter}
  </script>
{/foreach}

{if isset($vars) && $vars|@count}
  <script type="text/javascript">
    {foreach from=$vars key=var_name item=var_value}
    var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}

