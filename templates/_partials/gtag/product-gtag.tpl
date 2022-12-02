<!-- Global site tag (gtag.js) - product-gtag.tpl -->
<script>
var gtag_items = [
  {
    'id': {$product.id_product},
    'item': {
      item_id: "{$product.reference}",
      item_name: "{$product.name}",
      currency: "{$currency.iso_code}",
      item_brand: "{$product_manufacturer->name|escape:'html':'UTF-8'}",
      item_category: "{$product.category_name}",
      price: {$product.price_amount},
    }
  }
];

gtag("event", "view_item", {
  currency: "{$currency.iso_code}",
  value: {$product.price_amount},
  items: [
    gtag_items[0].item
  ]
});
console.log("*gtag event view_item* " + gtag_items[0].item.item_id);

</script>
