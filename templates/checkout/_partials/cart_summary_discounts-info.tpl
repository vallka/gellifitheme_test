<!-- cart_summary_discounts-info.tpl -->
<script>
var order_country='';
var order_total=0;
var order_qualified_total=0;
var order_currency='';
var order_currency_sign='-';
</script>
{if $customer.is_logged and ($customer.id_default_group>4) }
{else}

        <!--
            {$total_qualified = 0}
            {$total = 0}
            {foreach from=$cart['products'] item=p}
                {$p['id']}
                {$p['name']}
                -{$p['quantity']}-
                {$p['id_manufacturer']}
                {$p['price_without_reduction']}
                {$p['price_with_reduction']}
                {$total = $total + $p['price_with_reduction']*{$p['quantity']}}
                {if $p['price_without_reduction']==$p['price_with_reduction'] && $p['id_manufacturer']==2}
                    {$total_qualified = $total_qualified + $p['price_with_reduction']*{$p['quantity']}}
                {/if}
            {{/foreach}}
            =={$total_qualified|string_format:"%.2f"}==
        -->

        <script>
        order_country='{$customer.addresses[$cart.id_address_delivery]['country_iso']}';
        order_total={$total};
        order_currency='{$currency['iso_code']}';
        order_currency_sign='{$currency['sign']}';
        order_qualified_total={$total_qualified}
        </script>

    <style>
    .cart-summary-line .label div {
        text-align: left;
    } 
    </style>

    <hr class="separator">
    <div class="card-block" id="discounts-info">
    <div class="cart-summary-line">
        <small class="label">
        {if (strpos($urls.base_url,'.eu')!==false) || (strpos($urls.base_url,'eu.')!==false)}
        <div id="discounts-info-es">
            <span class="discount-name">{l s='Free delivery' d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} <span class="discount-from">75</span>€ 
            {l s='(excluding remote locations and islands)*' d='Shop.Theme.Checkout'}
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'15€'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} <span class="discount-from">150</span>€
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'30%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} <span class="discount-from">500</span>€
        </div>
        {else}
        <div id="discounts-info-uk">
            <b>{l s='Discounts for UK Customers' d='Shop.Theme.Checkout'}</b>
            <br>
            <span class="discount-name">{l s='Free delivery' d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">50</span> 
            {l s='(excluding remote locations and islands)*' d='Shop.Theme.Checkout'}
            {*
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'£10'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">100</span> 
            *}
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'20%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'}s £<span class="discount-from">250</span>
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'30%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">500</span>
            <br>
        </div>
        {*
        <div id="discounts-info-eu">
            <b>{l s='Discounts for European Customers' d='Shop.Theme.Checkout'}</b>
            <br>
            <span class="discount-name">{l s='Free delivery' d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">100</span> 
            {l s='(excluding remote locations and islands)*' d='Shop.Theme.Checkout'}
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'£15'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">150</span> 
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'20%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'}s £<span class="discount-from">250</span>
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'30%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">500</span>
            <br>
        </div>
        *}
        <div id="discounts-info-us">
            <b>{l s='Discounts for US Customers' d='Shop.Theme.Checkout'}</b>
            <br>
            <span class="discount-name">{l s='Free delivery' d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">90</span> 
            {l s='(excluding remote locations and islands)*' d='Shop.Theme.Checkout'}
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'20%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'}s £<span class="discount-from">250</span>
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'30%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">500</span>
            <br>
        </div>
        <div id="discounts-info-other">
            <b>{l s='Discounts for other international customers' d='Shop.Theme.Checkout'}</b>
            <br>
            <span class="discount-name">{l s='Free delivery' d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">500</span>
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'20%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'}s over £<span class="discount-from">250</span>
            <br>
            <span class="discount-name">{l s='%sum% off' sprintf=['%sum%'=>'30%'] d='Shop.Theme.Checkout'}</span> {l s='on orders over' d='Shop.Theme.Checkout'} £<span class="discount-from">500</span>
            <br>
        </div>
        {/if}
        </small>

        {if $total_qualified}
            <div class="cart-summary-line">
            <br>
            <small class="label free_notice">
            {if (strpos($urls.base_url,'.eu')===false) && (strpos($urls.base_url,'eu.')===false)}
                {if $currency['iso_code']!='GBP'}
                    1 GBP = <span id="discount-currency-rate"></span> {$currency['iso_code']}
                {/if}
            {/if}
            <br>
            {l s='You have qualified products for [1][2] in your cart.' sprintf=['[1]'=>$currency['sign'],'[2]'=>$total_qualified|string_format:"%.2f"] d='Shop.Theme.Checkout'}
            <br>
            <span id="discount-spend-more" style="display:none">Spend XXX more to enjoy ZZZ</span>
            </small>
            </div>
        {/if}

    </div>
    </div>
    <hr class="separator">
    <div class="card-block">
        <div class="cart-summary-line"><small class="label free_notice">
        {l s='* Please note that free delivery will be applied upon selection of shipping address and shipping method!' d='Shop.Theme.Checkout'}</small>
        </div>
    </div>
{/if}
