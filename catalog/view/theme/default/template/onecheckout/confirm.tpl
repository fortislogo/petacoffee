<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="onecheckout-product">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="price"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="price"><?php echo $product['price']; ?></td>
        <td class="total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="quantity">1</td>
        <td class="price"><?php echo $voucher['amount']; ?></td>
        <td class="total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="2" class="price"><b><?php echo $total['title']; ?>:</b></td>
        <td colspan="2" class="total"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<?php echo $cartmodule; ?>
<?php if ($text_agree) { ?>
<div class="buttons"> 
	<table> 
    	<tr>
        	<td style="vertical-align:top; width:20px;">
    			<?php if ($agree) { ?>
    			<input type="checkbox" name="agree" value="1" checked="checked" />
    			<?php } else { ?>
    			<input type="checkbox" name="agree" value="1" />
    			<?php } ?>
             </td>   
             <td style="vertical-align:top; text-align:left;"><?php echo $text_agree; ?></td>
         </tr>
      </table>                 
    
  <div style="float:right;" class="divclear">
	<a id="button-confirmorder" class="btn btn-cart btn-large button"><span><?php echo $button_confirm; ?></span></a>
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right"><a id="button-confirmorder" class="btn button"><span><?php echo $button_confirm; ?></span></a></div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('.fancybox').fancybox({
	width: 560,
	height: 560,
	autoDimensions: false
});
//--></script>