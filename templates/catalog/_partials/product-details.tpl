<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/barcodes/JsBarcode.ean-upc.min.js"></script>
<script>
{literal}
function saveSvg(svgEl, name) {
    svgEl = $('#'+svgEl).get(0);
    svgEl.setAttribute("xmlns", "http://www.w3.org/2000/svg");
    var svgData = svgEl.outerHTML;
    var preface = '<?xml version="1.0" standalone="no"?>\r\n';
    var svgBlob = new Blob([preface, svgData], {type:"image/svg+xml;charset=utf-8"});
    var svgUrl = URL.createObjectURL(svgBlob);
    var downloadLink = document.createElement("a");
    downloadLink.href = svgUrl;
    downloadLink.download = name;
    document.body.appendChild(downloadLink);
    downloadLink.click();
    document.body.removeChild(downloadLink);
}
{/literal}
</script>


<div class="tab-pane fade{if !$product.description} in active{/if}"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
     role="tabpanel"
  >
  {block name='product_reference'}
    <!-- product_manufacturer->id: {$product_manufacturer->id} -->
    {if 0 and isset($product_manufacturer->id)}
      <div class="product-manufacturer">
        {if isset($manufacturer_image_url)}
          <a href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
          </a>
        {else}
          <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
          <span>
            <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
          </span>
        {/if}
      </div>
    {/if}
    {if isset($product.reference_to_display)}
      <div class="product-reference">
        <label class="label">{l s='Reference' d='Shop.Theme.Catalog'} </label>
        <span itemprop="sku">{$product.reference_to_display}</span>
      </div>
    {/if}
  {/block}


  {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span>{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
  {/block}

  {block name='product_out_of_stock'}
    <div class="product-out-of-stock">
      {hook h='actionProductOutOfStock' product=$product}
    </div>
  {/block}

  {block name='product_features'}
    {if $product.features}
      <section class="product-features">
        <h3 class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</h3>
        <dl class="data-sheet">
          {foreach from=$product.features item=feature}
            
            {if substr($feature.name,0,1)!='_'}
            <dt class="name">{$feature.name}</dt>
            <dd class="value">
              {if $feature.name=='EAN13'}
                <span itemprop="gtin">{$feature.value}</span>
              {else}
                {$feature.value}
              {/if}
            </dd>
            {/if}
          
          {/foreach}
        </dl>
      </section>
    {/if}
  {/block}

  

  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if empty($product.specific_references)}
      {if !empty($product.ean13)}
        <section class="product-features">
          <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
            <dl class="data-sheet">
              {if isset($product.ean13)}
              <dt class="name">EAN13: <span itemprop="gtin">{$product.ean13}</span></dt>
              <dd class="value">

                <a href="#" onclick="return saveSvg('barcode','{$product.ean13}.svg')"><svg id="barcode"></svg></a>
<script>
JsBarcode("#barcode", "{$product.ean13}", {
  height: 30,
  width: 2,
  fontSize: 15,
  font: "Open Sans"
});
</script>

                
              </dd>
              {/if}
            </dl>
        </section>
      {/if}
    {else}
      <section class="product-features">
        <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
          <dl class="data-sheet">
            {foreach from=$product.specific_references item=reference key=key}
              <dt class="name">{$key}</dt>
              <dd class="value">
                {if $key=='EAN13'}
<script>
JsBarcode("#barcode", "{$reference}", {
  height: 30,
  width: 2,
  fontSize: 15,
  font: "Open Sans"
});
</script>
                  <a href="#" onclick="return saveSvg('barcode','{$reference}.svg')"><svg id="barcode"></svg></a>
                  <br>
                  <span itemprop="gtin">{$reference}*</span>
                {else}
                  {$reference}
                {/if}
              </dd>
            {/foreach}
          </dl>
      </section>
    {/if}
  {/block}

  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
        <span>{$product.condition.label}</span>
      </div>
    {/if}
  {/block}
</div>

