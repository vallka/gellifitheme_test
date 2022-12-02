{if isset($instagram_pics) && $instagram_pics|count > 0}
<div id="blockinstagram" class="full-width">
  <div class="row normal-width">
  <h1 class="h1 text-uppercase products-section-title">Follow us on Instagram</h1>

<!--
<div class="col-xs-6 col-sm-6 col-md-3 grid" style="position:relative">
      <a href="https://www.instagram.com/gellifique_gel_colour/"  target="_blank" rel="nofollow">
        <figure class="effect-ming">
          <img style="max-width:80%" src="https://www.instagram.com/p/BDGPCnmn8Yt/media?" alt="Follow us on Instagram" title="Follow us on Instagram">
  				<figcaption><p>
              Follow us on Instagram
  				</p></figcaption>
        </figure>
      </a>
</div>
-->

  		{foreach $instagram_pics as $pic}
  			<div class="col-xs-6 col-sm-6 col-md-3 grid">
  				<a href="{$pic.link}" target="_blank" rel="noopener">
            <figure class="effect-ming"
							style="background-image: url({$pic.image}); background-size: cover; background-position: center;"
						>
  					  <!-- img src="{$pic.image}" class="img-responsive" / -->
  				    <figcaption><p>
      					{$pic.caption}
      					{$pic.likes} {l s='likes' mod='blockinstagram'}
      				</p></figcaption>
            </figure>
  				</a>
  			</div>
  		{/foreach}
  </div>
</div>
{/if}