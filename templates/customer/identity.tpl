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
{extends 'customer/page.tpl'}

{block name='page_title'}
  {l s='Your personal information' d='Shop.Theme.Customeraccount'}
{/block}


{block name='page_content'}
  {render file='customer/_partials/customer-form.tpl' ui=$customer_form}

<!-- customer info
{if $customer.is_logged}
    customer.id: {$customer.id}
    customer.id_default_group: {$customer.id_default_group}
{/if}
-->

{$can_buy=($customer.is_logged and $customer.id_default_group>=4)}


{if $can_buy }

&nbsp;

{else}

<p style="color:red"><b>You must be an approved professional to buy our products marked with "Professional Use Only".
<br />
Please upload 
  your certificate using this <a id="our_frm" href="" >form</a> or email it to 
    <a href="mailto:info@gellifique.com">info@gellifique.com</a><b>
  </p>

  <script>
  //var goo_frm = "https://docs.google.com/forms/d/e/1FAIpQLSe_VpkhvuTfsSgOSB56bo2tqzn0277QqOVSG7uTg-kfDOYf0w/viewform?usp=pp_url&entry.659710156=" + prestashop.customer.email
  //document.getElementById('goo_frm').href=goo_frm
  
  //var our_frm = "{$urls.base_url}/pyadmin734r04xdw/prestashop/upload-cert/" + prestashop.customer.email;  
  var our_frm = "http://app.gellifique.co.uk/prestashop/upload-cert/" + prestashop.customer.email;  
  document.getElementById('our_frm').href=our_frm
  </script>

{/if}  

  

{/block}
