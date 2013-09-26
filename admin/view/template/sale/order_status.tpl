<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      
    </div>
    <div class="content">
      
      <form action="" method="post" enctype="multipart/form-data" id="form">
      
      	 <table class="form">
         	
         	<tr>
            	<td>Upload XML:<br /><span class="help">Browse the XML file, and click Submit to update the order status</span></td>
                <td><input type="file" name="file"></td>
            </tr>
            
            <tr>
            	<td>&nbsp;</td>
                <td><a onclick="$('#form').submit()" class="button">Submit</a></td>
            </tr>
         </table>
      </form>
    </div>
  </div>
</div>

<?php echo $footer; ?>