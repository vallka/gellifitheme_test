<!-- Global site tag (gtag.js) - Google Analytics -->
<script>
function getCookieMy_(name) {
  var cookieValue = null;
  if (document.cookie && document.cookie !== '') {
    var cookies = document.cookie.split(';');
    for (var i = 0; i < cookies.length; i++) {
      var cookie = cookies[i].trim();
      if (cookie.substring(0, name.length + 1) === (name + '=')) {
          cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
          break;
      }
    }
  }
  return cookieValue;
}

if (getCookieMy_('payment_for_cart_sum')=="{$order.totals.total.amount|number_format:2}") {
  document.cookie = "payment_for_cart_sum=x; path=/";
  gtag("event", "purchase", {
    currency: "{$currency.iso_code}",
    transaction_id: "{$idOrder}",
    value: {$order.totals.total.amount},

  {foreach $order.subtotals as $subtotal}
      {if $subtotal.type=='shipping'}
          shipping: {$subtotal.amount},
      {/if}
  {/foreach}

    tax: {$totalTax},
    items: [
      {foreach from=$productList item=product}
        {
          item_id: "{$product.product_reference}",
          item_name: "{$product.product_name}",
          currency: "{$currency.iso_code}",
          item_category: "{$product.category_name}",
          price: {$product.unit_price_tax_incl},
          quantity: {$product.product_quantity}
        },
      {/foreach}
    ]
  });
  console.log("*gtag event purchase*!!!");
}
</script>

