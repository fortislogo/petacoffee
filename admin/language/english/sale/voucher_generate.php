<?php
// Heading
$_['heading_title']      = 'Mass Voucher Generation';

// Text
$_['text_success']  = 'Success: %s vouchers have been generated and sent!';

// Button
$_['button_generate_and_send']       = 'Generate & Send';

// Entry
$_['entry_file']          = 'CSV File:<br /><span class="help">Must not contain a header row with column names. Just include one row per voucher with the following columns in the following order:<br /><b>To Name, To E-mail</b></span>';
$_['entry_sender_name']   = 'Sender Name:';
$_['entry_sender_email']  = 'Sender E-mail:';
$_['entry_message']       = 'Message:';
$_['entry_theme']         = 'Theme:';
$_['entry_amount']        = 'Amount:<span class="help">The amount that the generated voucher will be worth.</span>';
$_['entry_currency']      = 'Currency:<span class="help">The currency that the generated voucher amount is in.</span>';

// Error
$_['error_permission']    = 'Warning: You do not have permission to mass generate!';
$_['error_sender_name']   = 'Sender Name required!';
$_['error_sender_email']  = 'Valid Sender E-mail required!';
$_['error_message']       = 'Message required!';
$_['error_amount']        = 'Amount required and must be greater than 0!';
$_['error_file']          = 'CSV file required!';
$_['error_file_invalid']  = 'Invalid CSV data. Make sure you only have two columns per row, the first for Recipient Name and the second for Recipient E-mail. Be sure not to include a header row containing column names.';

?>