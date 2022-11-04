<html>
<head>
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
cyclist 
</title> 
</head>
<?php include("dbconnect.php");

$query="select CodC, Name, Surname from cyclist";

$query2="select distinct CodS from stage";

$res= mysqli_query($con, $query);
$res2= mysqli_query($con, $query2);
?>

<h2 align=center > Select cyclist code </h2>
<div class="myselect">
<div  class="myinput" >


<p> Cyclist code: </p>

<form  name="cyclistcode", action="rankingshow.php" method="POST">
<select name="ccode">
<?php while ($par= mysqli_fetch_row($res)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]." - ".$par[1]." ".$par[2] ; ?> </option> 
<?php } ?> </select>

<br> <br> 
<p> Stage code: </p>

<select name="scode">
<?php while ($par= mysqli_fetch_row($res2)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]; ?> </option> 
<?php } 


mysqli_close($con);
?>
</select>

<br>
<br> 
<input type="submit" value="See rankings"> 
<br>

</div></div>
</form>
<br>
 
 <table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="index.php" , style="text-decoration: none;">Back to index </a></td>
 </table>
 <br>
</html>