<html>
<head> 
<link href="justshow.css" rel=stylesheet type="text/css"> 
<title>
Ranking
</title> 
</head>
<?php include("dbconnect.php");
$ccode=$_POST['ccode'];
$scode= $_POST['scode'];
$query1="select Name, Surname, NameT
		from cyclist c, team t
		where c.CodT= t.CodT and CodC='$ccode';";
$query2="select Edition,  Ranking
			FROM  individual_classification 
			WHERE CodC='$ccode' AND CodS='$scode'
		GROUP BY  Edition 
		order by Edition asc;";
		
$res1=mysqli_query($con, $query1);
$res2= mysqli_query($con, $query2);
if(!$res1 || !$res2)
	die('Query error: ' .mysqli_error($con));
$cyclist=mysqli_fetch_assoc($res1);
?>

<h2 align=center> Ranking of  <?php echo $cyclist['Name']." ".$cyclist['Surname'].
					" <br>Team: ".$cyclist['NameT'].
					" <br> Stage number: ".$scode; ?> </h2>

<div class="myinput">
<div class="myselect" >
<?php  if(mysqli_num_rows($res2)>0){  ?>
<center>
<br> <br>
<table    bgcolor="black" border="1" style=" width: 70%; " >
<tr  ><u>
		
		<th>Edition</td>
		<th>Ranking</td>
		</tr>
		
<?php while($row=mysqli_fetch_assoc($res2)){ ?>
	<tr style=" height: 25px" > 
		<td><?php print $row["Edition"]; ?></td>
		<td><?php echo $row["Ranking"]; ?></td>
		</tr>
<?php
}  ?> 
	
</table > 
<?php }else{?> <h3 align=center> No Rankings found </h3> <?php } 
mysqli_close($con); ?>
<br>
<table  style=" width:150px; length: 35px; margin: auto; text-align: center; border: solid;  ">
<td>
<a href="cyclistselect.php", style="text-decoration: none;">Search again</a></td>
 </table>
 <br>
  </center>
  </div>
 </div>
<br>
 <table bgcolor="white" border=1 align =center style="width: 200px; length: 35px; margin: auto; text-align: center;">
<td>
<a href="index.php" , style="text-decoration: none;">Back to index </a></td>
 </table>
 <br>
</html>