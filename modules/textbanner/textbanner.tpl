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



{* if !$page.page_name=='cart' && !$page.page_name=='checkout' *}
    {if $textbanner_desc}
        <style>
        #textbanner {
            min-height: 51px;
            /*background-color: #47bc87;*/
            background-color: #f89bbf;
            /*background-color: #d96a9a;*/
            color: #fff;
            text-align: center;
            padding: 1rem;
        }

        #textbanner a {
            color: #fff !important;
            text-decoration: underline !important;
        }

        #textbanner a:hover {
            color: #fff !important;
            text-decoration: underline !important;
        }

        #textbanner a.textbanner-link {
            color: #fff !important;
            text-decoration: none !important;
        }
        #textbanner a.textbanner-link:hover {
            color: #fff !important;
            text-decoration: underline !important;
        }
        </style>

        {if $textbanner_link}
            <div id="textbanner"><a class="textbanner-link" href="{$textbanner_link}">{$textbanner_desc nofilter}</a></div>
        {else}
            <div id="textbanner">{$textbanner_desc nofilter}</div>
        {/if}
    {/if}
