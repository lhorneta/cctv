<?php
	$time_start = microtime(true);

	function convert_bytes($size)
	{
	    $unit=array('b','kb','mb','gb','tb','pb');
	    return @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i];
	}

	function GetMemoryUsage()
	{
		// return ' [' . convert_bytes(memory_get_usage(true)) . " / " . convert_bytes(memory_get_peak_usage(true)) . ']';
		return '[peak ' . convert_bytes(memory_get_peak_usage(true)) . ']';
	}

	function WriteToLog($data)
	{
		Global $time_start;
		// $data = str_ireplace("\n", "<br>\n", $data);
		$log_string = date("Y-m-d H:i:s") . "\t" . number_format((microtime(true) - $time_start), 3, '.', '') . " sec\t" . GetMemoryUsage() . "\t\t" . (isset($_GET['route']) ? $_GET['route'] : $_SERVER['REQUEST_URI']) . "\t\t" . $data;
		
		if (!stristr($data, "notrace")) {
			$log_string .= generateCallTrace() . "\n\n";
		}
		file_put_contents(getcwd() . '/log.html', $log_string, FILE_APPEND | LOCK_EX);
	}
	function ReturnVarDump($variable)
	{
		ob_start();
		var_dump($variable);
		return str_replace("\n", "|", ob_get_clean());
	}

	function generateCallTrace() {
		$e = new Exception();
		$trace = explode("\n", $e->getTraceAsString());
		// reverse array to make steps line up chronologically
		$trace = array_reverse($trace);
		array_shift($trace); // remove {main}
		array_pop($trace); // remove call to this method
		$length = count($trace);
		$result = array();

		for ($i = 0; $i < $length; $i++) {
			$result[] = '-' . str_ireplace('/home/virtwww/w_cctv-3gstar_0039eb75/', '', substr($trace[$i], strpos($trace[$i], ' '))); // replace '#someNum' with '$i)', set the right ordering
			// $result[] = ($i + 1)  . ')' . substr($trace[$i], strpos($trace[$i], ' ')); // replace '#someNum' with '$i)', set the right ordering
		}

		return "\t\t" . implode("\n\t\t", $result);
	}