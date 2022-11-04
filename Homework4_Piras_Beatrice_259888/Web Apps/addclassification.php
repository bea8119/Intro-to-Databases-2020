<html>
<head> 
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
Add A cyclist
</title> 
</head>
<?php include("dbconnect.php");

$query_cyclist="select CodC, Name, Surname from cyclist";
$query_stageS="select distinct CodS from stage;";
$query_stageE="select distinct Edition from stage;";
$res_cyclist= mysqli_query($con, $query_cyclist);
$res_stageS= mysqli_query($con, $query_stageS);
$res_stageE= mysqli_query($con, $query_stageE);
if(!$res_cyclist || !$res_stageS || !$res_stageE )
	die('Query error: ' .mysqli_error($con));
?>
<h2 align=center > Insert a new ranking: </h2> 

<div class="myinput"  >
<div class="myselect" >
<center>


<form  name="newranking", action="addtoDBclassification.php" method="POST">

<p> Code Cyclist: </p>
<select name="CodC"  style="background-color:#ccd9ff; width: 100px; height: 30px;">
<?php while ($par= mysqli_fetch_row($res_cyclist)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]." - ".$par[1]." ".$par[2] ; ?> </option> 
<?php } ?> </select>


<p> Code Stage: </p>
<select name="CodS"  style="background-color:#ccd9ff; width: 100px; height: 30px;">
<?php while ($par= mysqli_fetch_row($res_stageS)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]; ?> </option> 
<?php } ?> </select>

<p> Edition: </p>
<select name="Edition"  style="background-color:#ccd9ff; width: 100px; height: 30px;">
<?php while ($par= mysqli_fetch_row($res_stageE)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]; ?> </option> 
<?php } ?> </select>

<p> Ranking: </p>
<input type="number" name="Ranking" size="4" value="" />





<br>
<br> 

<input type="reset" value="Reset All">
<input type="submit" value="Insert">
</div>
<br> </center>

</div>


</form>
<br>
 
 <table align =center, style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="index.php" , style="text-decoration: none;">Back to index </a></td>
 </table>
 <br>   
</html>