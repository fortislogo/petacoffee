<?php echo $header; ?>

	<?php echo $content_top; ?>

	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?>
			<a href="<?php echo $breadcrumb['href']; ?>">
				<?php echo $breadcrumb['text']; ?>
			</a>
		<?php } ?>
	</div>

	<?php 
	
	if ($column_left || $column_right) { $main = "span9"; } 
	else { 	$main = "span12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<section id="maincontent" class="<?php echo $main; ?>" role="main">

			<div class="mainborder">

				<?php if ($column_left) { ?>
					<div id="toggle_sidebar"></div>
				<?php } ?>

				<header class="heading">
					<h1 class="page-header"><?php echo $heading_title; ?></h1>
				</header>

				<?php if ($orders) { ?>

					<div id="order-list">
                    	
                        <table class="table table-bordered">

						<thead>
							<tr>
								<td>
									Recurring ID #
								</td>
                                <td>
                                   	Status
                                </td>
                                <td>
                                	Order Frequency
                                </td>
                                <td>
                                	Last Order Date
                                </td>
                                <td>
                                	Next Order Date
                                </td>
                                <td>
                                	Previous Order Total
                                </td>
                                <td>
                                	Next Order Total
                                </td>
                                
                                <td>
                                	Action
                                </td>
							</tr>
						</thead>
						
						<?php foreach ($orders as $order) { ?>

							
						<tbody>
                        	<tr>
                            	<td><a href="<?php echo $order['href']; ?>"><?php echo $order['product']; ?></a></td>
                                <td><?php echo $order['status']; ?></td>
                                <td><?php echo $order['recurring']; ?> weeks</td>
                                <td><?php echo $order['date']; ?></td>
                                <td><?php echo $order['next_order_date']; ?></td>
                                <td><?php echo $order['previous_amount']; ?></td>
                                <td><?php echo $order['amount']; ?></td>
                                <td>
                                	<?php if ($order['status'] == 'active') { ?>
                                    <a href="<?php echo $order['edit']; ?>" class="btn btn-mini btn-cart" title="Edit">Modify</a>
                                	<a href="<?php echo $order['reorder']; ?>" class="btn btn-mini btn-cart" title="Cancel">Cancel</a>
                                    <?php } else if ($order['status'] == 'cancel') { ?>
                                    <a href="<?php echo $order['restart']; ?>" class="btn btn-mini btn-cart" title="Restart">Restart</a>
                                    <?php } ?>
                                </td>
                        	</tr>
                        </tbody>
				

						<?php } ?>
                        
                        </table>

					</div>

				

				<?php } else { ?>

					<div class="content"><?php echo $text_empty; ?></div>

				<?php } ?>

				<div class="form-actions">
                	
					<a href="<?php echo $continue; ?>" class="btn btn-inverse"><?php echo $button_continue; ?></a>
                    
				</div>

			</div>

		</section> <!-- #maincontent -->

		<?php echo $column_right; ?>

	</div> <!-- .row -->

	<?php echo $content_bottom; ?>
    
<script language="javascript1.1">
$(document).ready(function()
{
	$('#order-list a').bind('click', function()
	{
		if ($(this).attr('title') == 'Cancel')
			return confirm("Are you sure you want to cancel this recurring payment?");
	});										  
});
</script>

<?php echo $footer; ?>