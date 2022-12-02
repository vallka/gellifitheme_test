<!-- ps_mainmenu -->

{function name="nested_menu" nodes=[] parent_url='' parent_label=''}
  {if $parent_url}
    <a href="{$parent_url}" class="dropdown-item parent_link">{$parent_label|unescape}</a>
  {/if}
  {foreach from=$nodes item=node1}
    {if not $node1.children|count}
      <a href="{$node1.url}" class="dropdown-item">{$node1.label}</a>
    {else}  
      <div class="nested dropdown">
        <div class="dropdown-trigger">
          <a class="navbar-item dropdown-trigger" href="{$node1.url}">{$node1.label} &raquo;</a>
        </div>
        <div class="dropdown-menu" role="menu">
          <div class="dropdown-content is-black">
            {nested_menu nodes=$node1.children parent_url={$node1.url} parent_label={$node1.label}}
          </div>
        </div>
      </div>
    {/if}
  {/foreach}
{/function}

<div class="menu js-top-menu position-static" id="x_desktop_top_menu">
  <nav class="navbar is-black" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">

      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
        <i class="material-icons d-inline"></i>
      </a>

    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">

        {foreach from=$menu.children item=node}
          {if not $node.children|count}
            <a class="navbar-item" href="{$node.url}" {if $node.open_in_new_window} target="_blank" {/if}>{$node.label}</a>
          {else}
            <div class="navbar-item has-dropdown is-hoverable">
              <a href="{$node.url}" class="navbar-link">{$node.label}</a>

              <div class="navbar-dropdown is-black">

                {nested_menu nodes=$node.children parent_url={$node.url} parent_label={$node.label}}

              </div>
            </div>
          {/if}  
        {/foreach}

      </div>
      <div class="navbar-end">
        <div class="navbar-item">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
        </div>
      </div>
    </div>
  </nav>
  <div class="clearfix"></div>
</div>
<!-- /ps_mainmenu -->
