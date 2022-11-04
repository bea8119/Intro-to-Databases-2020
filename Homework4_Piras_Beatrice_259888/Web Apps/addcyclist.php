<html>
<head> 
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
Add A cyclist
</title> 
</head>
<?php include("dbconnect.php");

$query="select CodT, NameT from team";
$res= mysqli_query($con, $query);
if(!$res)
	die('Query error: ' .mysqli_error($con));
?>
<h2 align=center > Insert the data for a new cyclist </h2> 

<div class="myinput"  >
<div class="myselect" >
<center>


<form  name="newcyclist", action="addtoDBcyclist.php" method="POST">
<p> Code: </p>
<input type="text" name="CodC" size="5" value="" />

<p> Name: </p>
<input type="text" name="Name" size="35" value="" />

<p> Surname: </p>
<input type="text" name="Surname" size="35" value="" />


<p> Nationality: </p>
<input type="text" name="Nationality" size="5" value="" />

<p> CodTeam: </p>
<select name="tcode"  style="background-color:#ccd9ff; width: 100px; height: 30px;">
<?php while ($par= mysqli_fetch_row($res)){ ?>	
	<option value= "<?php echo $par[0]; ?> " >
		 <?php echo $par[0]." - ".$par[1]; ?> </option> 
<?php } ?> </select>

<p> BirthYear: </p>
<input type="number" name="BirthYear" size="4" value="" />





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
