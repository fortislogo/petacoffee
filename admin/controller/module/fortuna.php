<?php

class ControllerModulefortuna extends Controller {
    
    private $error = array(); 
    
    public function index() {   
        //Load the language file for this module
        $language = $this->load->language('module/fortuna');
        $this->data = array_merge($this->data, $language);

        //Set the title from the language file $_['heading_title'] string
        $this->document->setTitle($this->language->get('heading_title'));
        
        //Load the settings model. You can also add any other models you want to load here.
        $this->load->model('setting/setting');
        
        $this->load->model('tool/image');    
        
        //Save the settings if the user has submitted the admin form (ie if someone has pressed save).
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('fortuna', $this->request->post);    
               
                    
            $this->session->data['success'] = $this->language->get('text_success');
        
                        
            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
        
            $this->data['text_image_manager'] = 'Image manager';
                    $this->data['token'] = $this->session->data['token'];       

            $this->data['fortuna_footer_info_text'] = $this->language->get('fortuna_footer_info_text');
        
        $text_strings = array(
                'heading_title',
                'text_enabled',
                'text_disabled',
                'text_content_top',
                'text_content_bottom',
                'text_column_left',
                'text_column_right',
                'entry_status',
                'entry_sort_order',
                'button_save',
                'button_cancel',
        );
        
        foreach ($text_strings as $text) {
            $this->data[$text] = $this->language->get($text);
        }
        

        // store config data

        
        $config_data = array(

        'fortuna_status',

        'fortuna_skins',

        'fortuna_custom_colors',

        'fortuna_body_background_color',
        'fortuna_header_background_color',
        'fortuna_header_text_color',
        
        'fortuna_topbar_background',
        'fortuna_topbar_text_color',
        'fortuna_topbar_links',

        'fortuna_menu_color',
        'fortuna_menu_separator',

        'fortuna_title_color',
        'fortuna_bodytext_color',
        'fortuna_lighttext_color',
        
        'fortuna_footer_text_color',
        'fortuna_footer_links_color',
        'fortuna_content_links_color',

        'fortuna_button_top_color',
        'fortuna_button_bottom_color',
        'fortuna_button_border_color',
        'fortuna_button_text_color',

        'fortuna_2button_top_color',
        'fortuna_2button_bottom_color',
        'fortuna_2button_border_color',
        'fortuna_2button_text_color',

        'fortuna_display_cart_button',

        'fortuna_product_name_color',
        'fortuna_normal_price_color',
        'fortuna_old_price_color',
        'fortuna_new_price_color',
        'fortuna_onsale_background_color',
        'fortuna_onsale_text_color',

        'fortuna_hide_wishlist',
        'fortuna_hide_compare',

        'fortuna_categories_menu_color',

        'fortuna_pattern_overlay',
        'fortuna_custom_image',
        'fortuna_custom_pattern',
        'fortuna_image_preview',
        'fortuna_pattern_preview',
        
        'fortuna_title_font',
        'fortuna_body_font',
        'fortuna_small_font',

        'fortuna_featured_carousel',
        'fortuna_bestseller_carousel',
        'fortuna_latest_carousel',
        'fortuna_special_carousel',

        'fortuna_facebook_id',
        'fortuna_twitter_username',
        'fortuna_gplus_id',
        'fortuna_youtube_username',
        'fortuna_tumblr_username',
        'fortuna_skype_username',
        'fortuna_pinterest_id',

        'fortuna_header_info_text',

        'fortuna_payment_logos',
        'fortuna_footer_info_text',
        'fortuna_copyright',

        'fortuna_cloud_zoom',
        'fortuna_subcat_thumbs',
        'fortuna_logo_center',
        'fortuna_search_navbar',

        'fortuna_custom_stylesheet',
        'fortuna_custom_css',

        );
        
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        }
    
        //This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        
        //Set up breadcrumb trail.
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/fortuna', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $this->data['action'] = $this->url->link('module/fortuna', 'token=' . $this->session->data['token'], 'SSL');
        
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
                
        $this->load->model('design/layout');
        
        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        
        
        if (isset($this->request->post['fortuna_module'])) {
            $this->data['fortuna_module'] = $this->request->post['fortuna_module'];
        } else {
            $this->data['fortuna_module'] = $this->config->get('fortuna_module');
        }

        //Choose which template file will be used to display this request.
        $this->template = 'module/fortuna.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );

        if (isset($this->data['fortuna_custom_pattern']) && $this->data['fortuna_custom_pattern'] != "" && file_exists(DIR_IMAGE . $this->data['fortuna_custom_pattern'])) {
            $this->data['fortuna_pattern_preview'] = $this->model_tool_image->resize($this->data['fortuna_custom_pattern'], 70, 70);
        } else {
            $this->data['fortuna_pattern_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
        }
        
        
        if (isset($this->data['fortuna_custom_image']) && $this->data['fortuna_custom_image'] != "" && file_exists(DIR_IMAGE . $this->data['fortuna_custom_image'])) {
            $this->data['fortuna_image_preview'] = $this->model_tool_image->resize($this->data['fortuna_custom_image'], 70, 70);
        } else {
            $this->data['fortuna_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
        }

        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

        //Send the output.
        $this->response->setOutput($this->render());
    }
    
    /*
     * 
     * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
     * You can add checks in here of your own.
     * 
     */
    
    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/fortuna')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }   
    }


}
?>