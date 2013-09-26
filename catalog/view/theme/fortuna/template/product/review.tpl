<?php if ($reviews) { ?>

	<?php foreach ($reviews as $review) { ?>

	<article class="content row-fluid">

			<b><?php echo $review['author']; ?></b><br />
			<img src="catalog/view/theme/fortuna/images/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
			<div class="review-date"><?php echo $review['date_added']; ?></div>

			<div class="review-text"><?php echo $review['text']; ?></div>

	</article>

	<?php } ?>

	<div class="paginate"><?php echo $pagination; ?></div>

<?php } else { ?>

	<div class="empty white">
		<div class="note-light"><?php echo $text_no_reviews; ?></div>
	</div>

<?php } ?>