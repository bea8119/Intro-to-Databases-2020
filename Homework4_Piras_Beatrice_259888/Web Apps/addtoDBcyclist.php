<html>
<head> 
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
Add A cyclist
</title> 
</head>
<?php include("dbconnect.php");
if(strlen($_POST['CodC'])>5 || strlen($_POST['Name'])>35 ||
		strlen($_POST['Surname'])>35 || $_POST['BirthYear']>date("Y") 
		|| $_POST['BirthYear']<(date("Y")-110) ||
		!$_POST['CodC'] || !$_POST['Name'] || !$_POST['Surname']
		|| !$_POST['Nationality'] || !$_POST['tcode'] || !$_POST['BirthYear'])	{
			?>
			<table bgcolor="red"  align =center style="color:white; width:300px;  height: 80px; text-align:center; "  
			>
			<td> ERROR IN PARAMETER, TRY AGAIN  </td>
			</table>
			<br> 
			<table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  " >
			<td>
			<a href="addcyclist.php", style="text-decoration: none;"  >Try again</a></td>
			</table>
			<br>
			<?php
		die('ERROR');	}
		
$Code=$_POST['CodC'];
$Name=$_POST['Name'];
$Surname=$_POST['Surname'];
$Nationality=$_POST['Nationality'];
$CodT=$_POST['tcode'];
$BirthYear=$_POST['BirthYear'];

$query="insert into cyclist values 
			('$Code', '$Name', '$Surname', '$Nationality', '$CodT', $BirthYear);";
$res= mysqli_query($con, $query);
if(!$res){
	?>
			<table bgcolor="red"  align =center style="color:white; width:300px;  height: 80px; text-align:center; "  
			>
			<td> ERROR IN QUERY EXECUTION, TRY AGAIN  </td>
			</table>
			<br> 
			<table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
			<td>
			<a href="addcyclist.php", style="text-decoration: none;" >Try again</a></td>
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
<a href="addcyclist.php", style="text-decoration: none;" >Insert a new one</a></td>
 </table>
 <br>
 
 <table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="index.php" , style="text-decoration: none;">Back to index </a></td>
 </table>
 <br>

</html>