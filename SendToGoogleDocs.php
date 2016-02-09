<?php

/**
* @author Силенко Александр
* @description Мини-библиотека для отправки данных через формы в Google Документы
* @version 1.1
* @date 2015-11
*/

class GoogleDocsSender {
	private $formID;
	private $fields = array();
	private $numOfSendAttempts = 3;
	private $sendAttemptsDelaySec = 1;
	public $responseText = '';
	public $resultText = '';
	public $success;
	public $checkStrings = array('200 OK', '<title>', '<div class="ss-resp-content"><div class="ss-resp-message">');

	public function setFormID($data) {
		$this->formID = $data;
	}

	public function setNumberOfAttempts($number) {
		$this->numOfSendAttempts = $number;
	}

	public function setAttemptsDelay($seconds) {
		$this->sendAttemptsDelaySec = $seconds;
	}

	public function addField($name, $content) {
		$this->fields[] = array($name, $content);
	}

	public function send() {
		$fieldsPostString = $this->buildQuery($this->fields);

		$ch = curl_init('https://docs.google.com/forms/d/' . $this->formID . '/formResponse');
		curl_setopt ($ch, CURLOPT_HEADER, 1);
		curl_setopt ($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3');
		curl_setopt ($ch, CURLOPT_REFERER, 'https://docs.google.com/forms/d/' . $this->formID . '/viewform'); // нужно для валидации Гуглом, что POST формы осуществляется после "просмотра" формы
		curl_setopt ($ch, CURLOPT_POST, 1);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, $fieldsPostString); // передаем поля формы
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt ($ch, CURLOPT_HTTPHEADER, array('Expect:')); // это необходимо, чтобы cURL не высылал заголовок на ожидание
		$this->responseText = curl_exec($ch);
		// 

		for ($n = 0; $n < $this->numOfSendAttempts; $n++) {
			if (!stripos($this->responseText, '200 OK')) {
				sleep($this->sendAttemptsDelaySec);
				$this->responseText = curl_exec($ch);
			}
		}
		curl_close($ch);

		$checkStringsResult = '';
		if (preg_match('#<div class="errorheader">(.*?)</div>#', $this->responseText, $errorCheck)) {
			$checkStringsResult = strip_tags($errorCheck[1]);
		} else {
			foreach ($this->checkStrings as $value) {
				if (!stripos($this->responseText, $value)) {
					$checkStringsResult .= htmlentities($value) . "\n";
				}
			}
			if ($checkStringsResult != '') {
				$this->resultText = "В ответе Google Forms отсутствуют одна или несколько проверочных строк:\n" . $checkStringsResult;
			}
		}

		if ($checkStringsResult != '') {
			$this->success = false;
			$this->resultText = $checkStringsResult;
		} else {
			$this->success = true;
		}

		return $this->success;
	}

	public function buildQuery($input,$numeric_prefix = '', $arg_separator = '&', $enc_type = 2, $keyvalue_separator = '=', $prefix = '') {
		if (is_array($input)) {
			$arr = array();
			foreach ($input as $value) {
				$name = $prefix;
				if (strlen($prefix)) {
					$name .= '[';
					if (!is_numeric($value[0])) {
						$name .= $value[0];
					}
					$name .= ']';
				} else {
					if (is_numeric($value[0])) {
						$name .= $numeric_prefix;
					}
					$name .= $value[0];
				}
				if ((is_array($value[1]) || is_object($value[1])) && count($value[1])) {
					$arr[] = $this->buildQuery($value[1], $numeric_prefix, $arg_separator, $enc_type, $keyvalue_separator, $name);
				} else {
					if ($enc_type === 2) {
						$arr[] = rawurlencode($name) . $keyvalue_separator . rawurlencode($value[1] ? : '');
					} else {
						$arr[] = urlencode($name) . $keyvalue_separator . urlencode($value[1] ? : '');
					}
				}
			}
			return implode($arg_separator, $arr);
		} else {
			if ($enc_type === 2) {
				return rawurlencode($input);
			} else {
				return urlencode($input);
			}
		}
	}
}