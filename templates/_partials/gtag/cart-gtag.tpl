<!-- Global site tag (gtag.js) - Google Analytics -->
<script>
gtag("event", "view_cart", {
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
console.log("*gtag event view_cart*");
</script>
