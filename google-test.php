<?php
/*
*@name:cart
*
*@date: 29.10.2015
*@author: lhornet
*@description: saves orders into google docs document
*
*/
class Google
{
    private $sFormID = '1Ti0_36x0WnNdzp1zyz4-Ggwj-hb1fIsIGvkScWeDr6g';  // key (id) of google form

    public function googleDocsTableAccount(){

        $asTableFields = array(                                     // input names in google form
            'form'              =>  'entry.1945748767',
            'name'              =>  'entry.876491583',
            'phone'             =>  'entry.1340834885',
            'referer'           =>  'entry.2120743361',
            'gclid'             =>  'entry.2018996484',
            'additional'        =>  'entry.88003556'
        );

        $sAdditionalData = '';
        foreach ($_POST as $key => $value) {
            if (!array_key_exists($key, $asTableFields)) {
                if ($value != "") {
                    $value = $this->convert_string_if_needed($value);
                    if ($key == $value) {
                        $sAdditionalData .= $key . ', ';
                    } else {
                        $sAdditionalData .= $key . ' = ' . $value . ', ';
                    }
                }
            }
        }

        $asPostRequestToGoogleForms = array(
            $asTableFields['form']              =>  $this->convert_string_if_needed($_POST['form']),
            $asTableFields['name']              =>  $this->convert_string_if_needed($_POST['name']),
            $asTableFields['phone']             =>  $this->convert_string_if_needed($_POST['phone']),
            $asTableFields['referer']           =>  getenv('HTTP_REFERER'),
            $asTableFields['gclid']             =>  $_POST['gclid'],
            $asTableFields['additional']        =>  $_POST['additional']
        );

        $fSpamDetected = False;

        foreach ($asPostRequestToGoogleForms as $key => $value) {
            if (stripos($this->convert_string_if_needed($value), 'http') || stripos($this->convert_string_if_needed($value), 'href')) {$fSpamDetected = True;}
        }

        if ($fSpamDetected == True) {
            $this->_spamDetected();
        } else {
            $this->_curlSendDataToGoogleDocs($asPostRequestToGoogleForms);
        }

    }

    public function _curlSendDataToGoogleDocs($data){
		//var_dump($data);
        $sPostRequestToGoogleForms = http_build_query($data);

        $ch = curl_init('https://docs.google.com/forms/d/' . $this->sFormID . '/formResponse');

        curl_setopt ($ch, CURLOPT_HEADER, 1); 
        curl_setopt ($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3');
        curl_setopt ($ch, CURLOPT_REFERER, 'https://docs.google.com/forms/d/' . $this->sFormID . '/viewform');
        curl_setopt ($ch, CURLOPT_POST, 1);
        // передаем поля формы
        curl_setopt ($ch, CURLOPT_POSTFIELDS, $sPostRequestToGoogleForms);

        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
        // это необходимо, чтобы cURL не высылал заголовок на ожидание
        curl_setopt ($ch, CURLOPT_HTTPHEADER, array('Expect:'));

        $result = curl_exec($ch);

        for ($n=0; $n < 4; $n++) { 
            if (!stripos($result, '200 OK')) {
                sleep(1);
                $result = curl_exec($ch);
            }
        }
        curl_close ($ch);
    }

    public function _spamDetected(){

        $sReport = '"http" or "href" string was detected' . "\n" . 
                        "\nПоступившие данные:\n" .
                        'referer: ' . getenv('HTTP_REFERER') . "\n";

        foreach ($_POST as $key => $value) {
            $sReport .= $key . ': ' . $this->convert_string_if_needed_reverse($value) . "\n";
        }

        $sReport .= 'Additional data: ' . $sAdditionalData;//report with span detected to send
    }

    public function get_encoding($str){
        $cp_list = array('utf-8', 'windows-1251');
        foreach ($cp_list as $k=>$codepage){
            if (md5($str) === md5(iconv($codepage, $codepage, $str))){
                return $codepage;
            }
        }
        return null;
    }


    public function convert_string_if_needed($sString) {
        $sEncoding = $this->get_encoding($sString);
        if ($sEncoding == 'windows-1251') {
            return iconv('windows-1251', 'utf-8', $sString);
        }
        return $sString;
    }


    public function convert_string_if_needed_reverse($sString) {
        $sEncoding = $this->get_encoding($sString);
        if ($sEncoding == 'utf-8') {
            return iconv('utf-8', 'windows-1251', $sString);
        }
        return $sString;
    }

}
$obj = new Google();
$obj->googleDocsTableAccount();