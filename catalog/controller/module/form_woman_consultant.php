<?php

class ControllerModuleFormWomanConsultant extends Controller {

	public function index($setting) {
		static $module = 0;


		$this->load->model('design/layout');

		$this->load->language('module/form_woman_consultant');

		$route = null;
		if(isset($this->request->get['route']) && !empty($this->request->get['route'])){
			$route = $this->request->get['route'];
		}else{$route = '';}

		$data['route'] = $route;


		//form consultant
		$data['form_title_main']     = $this->language->get('form_title_main');
		$data['form_text']           = $this->language->get('form_text');
		$data['form_title_bottom']   = $this->language->get('form_title_bottom');
		$data['form_hidden']         = $this->language->get('form_hidden');
		$data['form_submit_button']  = $this->language->get('form_submit_button');
		$data['form_img_alt']        = $this->language->get('form_img_alt');

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/form/woman_consultant.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/form/woman_consultant.tpl', $data);
		}
	}

}