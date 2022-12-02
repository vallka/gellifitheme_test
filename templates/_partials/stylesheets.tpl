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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">


{foreach $stylesheets.external as $stylesheet}
<link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}" >
{/foreach}

<link rel="stylesheet" href="/themes/gellifitheme/assets/css/custom-1.css?{Configuration::get('MYADMINEXTRA_CSS_TS')}" type="text/css" media="all" >

{if $page.page_name=='index'}
<link rel="stylesheet" href="/themes/gellifitheme/assets/css/custom-home.css?{Configuration::get('MYADMINEXTRA_CSS_TS')}" type="text/css" media="all" >
{/if}

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,600i,700,700i" rel="stylesheet">

{foreach $stylesheets.inline as $stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}

<style>
#header {
  height: unset !important;
}
#notifications {
  margin-top: 0 !important;
  min-height: unset !important; 
}
.alert {
  margin-bottom: 0 !important;
}
#header .menu {
  margin-top: 0 !important;
}
{if Context::getContext()->getDevice()>=4}
  #products .products, .featured-products .products, .product-accessories .products, .product-miniature .products {
    justify-content: center;
  }
  #search_widget{
    display: none;
  }
  .trustpilot-widget{
    height: 0px;
    overflow: visible;
    float: right;
  }
  .is-black .navbar-menu, .navbar.is-black {
    background-color: transparent;
  }

  #mobile-search-div {
    margin: 15px 2px 15px 0;
  }
  #header .header-nav .user-info .logged {
    color: unset !important;
  }
  #header .header-nav .user-info a {
    margin-left: .625rem;
  }
  .mobile-contact {
    margin: 15px 5px;
  }
  .cart-products-count {
    margin-left: -13px;
    background-color: #f89bbfcc;
    top: -9px;
    padding: 0 3px;
    position: relative;
    font-size: 12px;
  }
{/if}

</style>

