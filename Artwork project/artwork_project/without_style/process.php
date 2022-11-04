<?php

	function get_color_by_category($category){
		switch ($category) {
			case 'architecture':
			$color = "Blue";
			break;
			case 'painting':
			$color = "Orange";
			break;
			case 'sculpture':
			$color = "Green";
			break;
			default:
			$color = "Yellow";
			break;
		}

		return $color;
	}

	function show_header($result){
		echo "<tr>";

		for ($i=0; $i < mysqli_num_fields($result); $i++) { 
			$title = mysqli_fetch_field($result);
			$name = $title->name;
			echo "<th> $name </th>";
		}

		echo "</tr>";
	}

	function show_rows($result){
		while ($row = mysqli_fetch_row($result)) {
			$color = get_color_by_category($row[2]);

			echo "<tr bgcolor=$color>";

			foreach ($row as $cell) {
				echo "<td>$cell</td>";
			}

			echo "</tr>";
		}
	}


	function show_query_results($result){
		echo "<table border=1 cellpadding=10>";
		
		show_header($result);

		show_rows($result);

		echo "</table>";
	}

	

?>

<html>
<head>
	<title>Artworks results</title>
</head>
<body>
	<?php

	// VALIDATE FORM PARAMETERS
	if( !isset($_REQUEST["year1"]) or 
		!isset($_REQUEST["year2"]) or 
		!isset($_REQUEST["city"]))
	{
		die("Error: insert all requested data");
	}

	if( !is_numeric($_REQUEST["year1"]) or 
		!is_numeric($_REQUEST["year2"]) or 
		($_REQUEST["year1"] > $_REQUEST["year2"]))
	{
		die("Error: year values not correct");
	}

	// GET FORM PARAMETERS
	$a1 = $_REQUEST["year1"];
	$a2 = $_REQUEST["year2"];
	$c = $_REQUEST["city"];

	// DATABASE CONNECTION
	$con = mysqli_connect('localhost','root','','Artwork'); //set your username and password
	if (mysqli_connect_errno())
	{
		die ('Failed to connect to MySQL: ' . mysqli_connect_error());
	}

	//EXECUTE QUERY
	$sql  = " SELECT surname AS author, Artwork.name AS artwork, category
	FROM Author, Artwork
	WHERE Author.authorCode = Artwork.author
	AND birthYear >= $a1  
	AND birthYear <= $a2    
	AND Artwork.city =  '$c'
	ORDER BY surname, artwork";

	$result = mysqli_query($con,$sql);

	if( !$result )
		die('Query error: ' . mysqli_error($con));
	
	//SHOW RESULTS
	echo "<h1>Artworks in $c of authors born between $a1 and $a2</h1>";

	if(mysqli_num_rows($result) > 0){
		show_query_results($result);
	} else {
		echo "<h4>No results!</h4>";
	}
	?>
</body>
