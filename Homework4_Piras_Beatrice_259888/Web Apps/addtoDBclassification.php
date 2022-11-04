<html>
<head> 
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
Add A cyclist
</title> 
</head>
<?php include("dbconnect.php");
if(strlen($_POST['CodC'])>5 || $_POST['CodS']<=0 
		|| $_POST['Edition']<=0 || $_POST['Ranking']<=0
		|| !$_POST['CodC'] || !$_POST['CodS'] 
		|| !$_POST['Edition'] || !$_POST['Ranking'])	{
			?>
			<table bgcolor="red"  align =center style="color:white; width:300px;  height: 80px; text-align:center; "  
			>
			<td> ERROR IN PARAMETER, TRY AGAIN  </td>
			</table>
			<br> 
			<table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  " >
			<td>
			<a href="addclassification.php", style="text-decoration: none;"  >Try again</a></td>
			</table>
			<br>
			<?php
		die('ERROR');	}
		
$CodC=$_POST['CodC'];
$CodS=$_POST['CodS'];
$Edition=$_POST['Edition'];
$Ranking=$_POST['Ranking'];


$query="insert into individual_classification values 
			('$CodC', $CodS, $Edition, $Ranking);";
$res= mysqli_query($con, $query);
if(!$res){
	?>
			<table bgcolor="red"  align =center style="color:white; width:300px;  height: 80px; text-align:center; "  
			>
			<td> ERROR IN QUERY EXECUTION, TRY AGAIN  </td>
			</table>
			<br> 
			<table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  " >
			<td>
			<a href="addclassification.php", style="text-decoration: none;"  >Try again</a></td>
			</table>
			<br>
			<?php
	die('Query error: ' .mysqli_error($con));
}

	/*the check of the query and die are used to check the primary 
	key constraint- no duplicates in the CodC*/



?>


<table bgcolor="green"  align =center style="color:white; width:300px;  height: 80px; text-align:center; "  
			>
			<td> INSERTION WAS SUCCESSFUL!!!  </td>
			</table>
			<br>
<table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="addclassification.php", style="text-decoration: none;" >Insert a new one</a></td>
 </table>
 <br>
 
 <table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="index.php" , style="text-decoration: none;">Back to index </a></td>
 </table>
 <br>

</html>