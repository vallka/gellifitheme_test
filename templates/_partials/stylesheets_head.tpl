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


<!-- link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css" -->
<link rel="stylesheet" href="/themes/gellifitheme/assets/css/bulma-navbar.min.css?" type="text/css" media="all">

{foreach $stylesheets.external as $stylesheet}
<link rel="stylesheet" href="{$stylesheet.uri}?{Configuration::get('MYADMINEXTRA_CSS_TS')}" media="{$stylesheet.media}">
{/foreach}

<!-- link rel="stylesheet" href="/themes/gellifitheme/assets/css/custom-1.css?{Configuration::get('MYADMINEXTRA_CSS_TS')}" type="text/css" media="all" -->

{if $page.page_name=='index'}
<link rel="stylesheet" href="/themes/gellifitheme/assets/css/custom-home.css?{Configuration::get('MYADMINEXTRA_CSS_TS')}" type="text/css" media="all">
{/if}

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,600i,700,700i" rel="preload" as="style" onload="this.onload=null;this.rel='stylesheet'">

{foreach $stylesheets.inline as $stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}

{if Context::getContext()->getDevice()>=4}
<style>
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

  .cart-products-count {
    margin-left: -13px;
    background-color: #f89bbfcc;
    top: -9px;
    padding: 0 3px;
    position: relative;
    font-size: 12px;
  }
  .carousel .carousel-item .caption {
    width: unset;
    padding: 2px;
    position: unset;
    max-width: unset;
    text-align: center;
    margin: -35px auto 10px;
    width: 95%;
    max-height: 170px;
    overflow: hidden;
    border: 1px solid #aaa;
    font-size: 12px;
  }
</style>
{/if}


