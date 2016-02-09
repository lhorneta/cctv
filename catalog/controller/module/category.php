<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');
	
		$data['heading_title'] = $this->language->get('heading_title');

		
		$this->load->model('setting/setting');
		$data['name_category'] = $this->config->get('name_category');

		$data['url'] = "http://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
		
		if (isset($data['name_category'])) {
		
			$parts = explode('_', (string)$data['name_category']);
		} else {
			$parts = array();
		}

	//	$this->log->write(print_r($category,true));
		
		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
	
		$data['categories'] = array();

		$category = $this->model_catalog_category->getCategory($data['name_category']);

		$children_data = array();

		if ($category['category_id'] == $data['category_id']) {
			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach($children as $child) {
				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'],
					'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
				);
			}
		}

		$filter_data = array(
			'filter_category_id'  => $category['category_id'],
			'filter_sub_category' => true
		);

		$data['categories'][] = array(
			'category_id' => $category['category_id'],
			'name'        => $category['name'],
			'children'    => $children_data,
			'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
		);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}