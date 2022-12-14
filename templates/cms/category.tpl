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
{extends file='page.tpl'}


{block name='page_title'}
  {$cms_category.name}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content">

{block name='page_content_top'}
  {if $cms_category.description}
    <div class="card card-block">
    {$cms_category.description|replace:'[':'<'|replace:']':'>' nofilter}
    </div>
  {/if}
{/block}

{block name='page_content'}
  <div class="card card-block">
  {block name='cms_sub_categories'}
    {if $sub_categories}
      <ul>
        {foreach from=$sub_categories item=sub_category}
          <li><a href="{$sub_category.link}">{$sub_category.name}</a></li>
        {/foreach}
      </ul>
    {/if}
  {/block}

  {block name='cms_sub_pages'}
    {if $cms_pages}
      <ul>
        {foreach from=$cms_pages item=cms_page}
          <li><a href="{$cms_page.link}">{$cms_page.meta_title}</a></li>
        {/foreach}
      </ul>
    {/if}
  {/block}
  </div>
{/block}

{/block}
