<!-- Global site tag (gtag.js) - checkout-gtag.tpl -->
<script>
function call_gtag(e) {
    gtag("event", e, {
        currency: "{$currency.iso_code}",
        value: {$cart.totals.total.amount}, 
        {if $cart.products}
        items: [
            {foreach from=$cart.products item=product}
            {
                item_id: "{$product.reference}",
                item_name: "{$product.name}",
                currency: "{$currency.iso_code}",
                item_brand: "{$product_manufacturer->name|escape:'html':'UTF-8'}",
                item_category: "{$product.category_name}",
                price: "{$product.price_wt|number_format:2}",
                quantity: {$product.quantity}
            },
            {/foreach}
        ]
        {/if}
    });
    console.log("*gtag event " + e +"*");
}

if (document.getElementsByName('confirmDeliveryOption') && document.getElementsByName('confirmDeliveryOption')[0]) {
    document.getElementsByName('confirmDeliveryOption')[0].addEventListener('click',function(){
        call_gtag("add_shipping_info");
    },true);
}

if (document.getElementById('btn-payment-submit')) {
    document.getElementById('btn-payment-submit').addEventListener('click',function(){
        if (document.querySelectorAll('input[name=payment-option]:checked').length>0 &&
            document.querySelectorAll('#conditions-to-approve input[type=checkbox]:checked').length==document.querySelectorAll('#conditions-to-approve input[type=checkbox]').length   
            ) 
        {
            document.cookie = "payment_for_cart_sum={$cart.totals.total.amount|number_format:2}; path=/";
            call_gtag("add_payment_info");
        }
    },true);
}
</script>
