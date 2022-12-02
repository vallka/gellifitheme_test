{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
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


    <ul class="product-flags js-product-flags">
    {if $product.id_manufacturer==5 || $product.id_manufacturer==6 || $product.id_manufacturer==7}
        <li class="product-flag partner-brand">PARTNER BRAND</li>
    {/if}
    {if $in_spain}
        <li class="product-flag in-spain">¡En España!</li>
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
