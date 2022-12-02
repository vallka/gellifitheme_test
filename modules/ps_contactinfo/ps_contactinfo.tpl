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

<div class="block-contact col-md-3 links wrapper">
  <div class="hidden-sm-down">
    <h3 class="text-uppercase block-contact-title">{l s='Store information' d='Shop.Theme.Global'}</h3>
      {$contact_infos.address.formatted nofilter}
      {if $contact_infos.phone}
        <br>
        {* [1][/1] is for a HTML tag. *}
        {l s='Call us: [1]%phone%[/1]'
          sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
      {/if}
      {if $contact_infos.fax}
        <br>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='Fax: [1]%fax%[/1]'
          sprintf=[
            '[1]' => '<span>',
            '[/1]' => '</span>',
            '%fax%' => $contact_infos.fax
          ]
          d='Shop.Theme.Global'
        }
      {/if}
      {if $contact_infos.email}
        <br>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='Email us: [1]%email%[/1]'
          sprintf=[
            '[1]' => '<span>',
            '[/1]' => '</span>',
            '%email%' => $contact_infos.email
          ]
          d='Shop.Theme.Global'
        }
      {/if}

      <style>
        .block-contact .social-sharing li {
          /*background-color: #d73672;*/
          background-color: #d96a9a;
        }
      
      </style>

      <div class="social-sharing" style="margin-left:-0.5rem">
      <ul>
                  <li class="facebook"><a href="https://www.facebook.com/gellifiqueltd/" class="text-hide" title="Facebook" target="_blank" rel="noopener">Facebook</a></li>
                  <li class="instagram"><a href="https://www.instagram.com/gellifique_professional/" class="text-hide" title="Instagram" target="_blank" rel="noopener">Instagram</a></li>
                  <li class="youtube"><a href="https://www.youtube.com/channel/UC8EB7U4DV4n_8BY8wprBXOQ" class="text-hide" title="Youtube" target="_blank" rel="noopener">Youtube</a></li>
                  <li class="twitter"><a href="https://twitter.com/gellifique" class="text-hide" title="Tweet" target="_blank" rel="noopener">Tweet</a></li>
                  <li class="pinterest"><a href="https://uk.pinterest.com/gellifique/" class="text-hide" title="Pinterest" target="_blank" rel="noopener">Pinterest</a></li>
                  <!-- li class="tumblr"><a href="https://gellifique.tumblr.com/" class="text-hide" title="Tumblr" target="_blank" rel="noopener">Tumblr</a></li -->
          </ul>
      </div>
  </div>
  <div class="hidden-md-up">
    <div class="title">
      <a class="h3" href="{$urls.pages.stores}">{l s='Store information' d='Shop.Theme.Global'}</a>
    </div>
  </div>
</div>
