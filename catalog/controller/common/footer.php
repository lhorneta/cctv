<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');
		$data['text_pages'] = $this->language->get('text_pages');

		$data['text_guarantees'] = $this->language->get('text_guarantees');
		$data['text_payment_delivery'] = $this->language->get('text_payment_delivery');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_reviews'] = $this->language->get('text_reviews');
		$data['text_about_us'] = $this->language->get('text_about_us');
		$data['text_corporative'] = $this->language->get('text_corporative');
		
		$data['text_cctv'] = $this->language->get('text_cctv');

		$data['text_office'] = $this->language->get('text_office');
		$data['text_for_home'] = $this->language->get('text_for_home');
		$data['text_outdoor'] = $this->language->get('text_outdoor');
		$data['text_ip_cameras'] = $this->language->get('text_ip_cameras');
		$data['text_dvr'] = $this->language->get('text_dvr');
		$data['text_online'] = $this->language->get('text_online');

		$data['text_map1'] = $this->language->get('text_map1');
		$data['text_map2'] = $this->language->get('text_map2');
		$data['text_shops'] = $this->language->get('text_shops');

		$data['text_addrkiev'] = $this->language->get('text_addrkiev');
		$data['text_addkharkov'] = $this->language->get('text_addkharkov');





		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['guarantees'] 			= $this->url->link('#1', '', 'SSL');
		$data['payment_delivery'] = $this->url->link('#2', '', 'SSL');
		$data['reviews'] 					= $this->url->link('#3', '', 'SSL');
		$data['about_us']					= $this->url->link('#4', '', 'SSL');
		$data['corporative'] 			= $this->url->link('#5', '', 'SSL');
		$data['office']						= $this->url->link('#6', '', 'SSL');
		$data['for_home'] 				= $this->url->link('#7', '', 'SSL');
		$data['outdoor'] 					= $this->url->link('#8', '', 'SSL');
		$data['ip_cameras'] 			= $this->url->link('#9', '', 'SSL');
		$data['dvr'] 							= $this->url->link('#10', '', 'SSL');
		$data['online'] 					= $this->url->link('#11', '', 'SSL');

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', 'SSL');
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/common/footer.tpl', $data);
		}
	}
}