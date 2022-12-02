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
<div class="col-md-6 links">
  <div class="row">
    <div class="col-md-6 wrapper">
        <div class="row">
          {literal}
          <style>
          #living-wage-logo {
            padding-left: 50px;
          }
          @media (max-width:767px) {
            .tree-nation-1 {
              padding-left: 25px;
            }

            #living-wage-logo {
              padding-left: 156px;
              max-height: 60px;
            }

          }
          </style>
          <script src="https://widgets.tree-nation.com/js/widgets.min.js?v=1.1"></script>
          <div class="tree-nation-1 col-sm-6 col-xs-6 col-md-12" id="tree-nation-tree-counter"></div>
          <script>TreeNationTreeCounter({lang: 'en', id: 114591, slug: 'gellifique-ltd'}).render('#tree-nation-tree-counter');</script>
          <div class="tree-nation-2 col-sm-6 col-xs-6 col-md-12" id="tree-nation-offset-products"></div>
          <script>TreeNationOffsetProducts({lang: 'en', slug: 'gellifique-ltd'}).render('#tree-nation-offset-products');</script>      
          {/literal}

          <div class="col-sm-12 col-xs-12 col-md-12" id="living-wage-logo">
            <!-- img src="/img/LW-Employer-logo.png" alt="Living Wage" height="70" width="89" / -->
            <img src="{imagekit tr='w-89,h-70' url='/img/LW-Employer-logo.png'}" alt="Living Wage" height="70" width="89" />
          </div>
        </div>
    </div>

  {foreach from=$linkBlocks item=linkBlock name=lb}
    <div class="col-md-6 wrapper">
      {if $smarty.foreach.lb.first}
      {/if}

      <h3 class="h3 hidden-sm-down">{$linkBlock.title}</h3>
      {assign var=_expand_id value=10|mt_rand:100000}
      <div class="title clearfix hidden-md-up" data-target="#footer_sub_menu_{$_expand_id}" data-toggle="collapse">
        <span class="h3">{$linkBlock.title}</span>
        <span class="float-xs-right">
          <span class="navbar-toggler collapse-icons">
            <i class="material-icons add">&#xE313;</i>
            <i class="material-icons remove">&#xE316;</i>
          </span>
        </span>
      </div>
      <ul id="footer_sub_menu_{$_expand_id}" class="collapse">
        {foreach $linkBlock.links as $link}
          <li>
            <a
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                title="{$link.description}">
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
  </div>
</div>
