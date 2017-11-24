<?php
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	$uri .= $_SERVER['HTTP_HOST'].'/';
	$dir    = 'C:/xampp/htdocs/';
	$files1 = scandir($dir,0);
	echo "<h1>XAMPP Localhost</h1>";
	foreach ($files1 as $key => $value) {
		if($key<2){
			continue;
		}
		echo "<h3 style='margin:0;'><a href=".$uri.$value.">".$value."</a><br>";
	}
	echo "<a href=".$uri."phpmyadmin".">PHP_MY_ADMIN</a><br>";
?>

