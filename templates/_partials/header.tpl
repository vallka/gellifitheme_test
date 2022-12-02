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

{if (strpos($urls.base_url,'.eu')!==false) || (strpos($urls.base_url,'eu.')!==false)}
<img style="height: 51px;position: absolute;left: 0;top: 0;" src="/img/eu.png">
<script>
var www_gellifique_eu=1;
</script>
{/if}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}


{block name='header_banner'}

  {if !$notifications.error && !$notifications.warning && !$notifications.success && !$notifications.info}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
  {/if}
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="container">
        <div class="row">
          <div class="hidden-sm-down">
            <div class="col-sm-12 right-nav">
                {hook h='displayNav1'}
                {hook h='displayNav2'}
            </div>
          </div>
          <div class="hidden-md-up text-sm-center mobile">
            <div class="float-xs-right" id="z_mobile_search">
              <div id="mobile-search-div">
                <a href="#" onclick="document.getElementById('search_widget').style.display='block';document.querySelector('#search_widget input[name=s]').focus()"><i class="material-icons">search</i></a>
              </div>
            </div>
            <div class="float-xs-right" id="_mobile_cart"></div>
            <div class="float-xs-right" id="_mobile_user_info"></div>
            <div class="float-xs-right" id="z_mobile_contact">
              <div class="mobile-contact">
                <a href="{$urls.pages.contact}"><i class="material-icons">mail_outline</i></a>
              </div>
            </div>
            <div class="top-logo" id="x_mobile_logo">
              <a href="{$urls.base_url}">
                <img class="logo img-responsive" src="/img/logo-professional-263.png" alt="{$shop.name}" width="263" height="66">
              </a>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container">
       <div class="row">
        <div class="col-md-4 hidden-sm-down" id="x_desktop_logo">
          <a href="{$urls.base_url}">
            <img class="logo img-responsive" src="/img/logo-professional-263.png" alt="{$shop.name}" width="263" height="66">
          </a>
        </div>
        <div class="col-md-8 col-sm-12 position-static">
          <div class="row">
          {if $page.page_name=='index'}
            <script type="text/javascript" src="//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js" async></script>

            <div class="trustpilot-widget" data-locale="en-GB" data-template-id="5419b6a8b0d04a076446a9ad" data-businessunit-id="5d777b0993ad8b000136cde9" data-style-height="24px" data-style-width="250px" data-theme="dark">
            <a href="https://uk.trustpilot.com/review/gellifique.co.uk" target="_blank" rel="noopener">Trustpilot</a>
            </div>

            <div class="clearfix"></div>
          {/if}
          </div>
        </div>
      </div>

      <div class="row">
            {if Context::getContext()->getDevice()>=4}
            <script>
            {literal}
            document.addEventListener('scroll', function(e) {
              let el=document.getElementById('search_widget');
              if (el.getBoundingClientRect().bottom<0) {
                el.style.display='none';
              }
            });
            {/literal}
            </script>
            {/if}

            {hook h='displayTop'}
      </div>

    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}
