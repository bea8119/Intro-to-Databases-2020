<html>
<?php
$con =mysqli_connect('localhost', 'root', '')
							or die('ERROR...');
?>	

<font face='Arial' size=0.5>
<?php						
	if (!$con)
	echo"CON FAILED!";						

$db=mysqli_select_db($con, "Cycling");
?>


</font>
</html>