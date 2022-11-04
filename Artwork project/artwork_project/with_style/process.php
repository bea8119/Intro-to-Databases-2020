<?php

function get_alert_html($error){
	return '<div class="alert alert-danger" role="alert">'. $error. '</div>';
}

function get_color_by_category($category){
	switch ($category) {
		case 'architecture':
		$color = "LightGreen";
		break;
		case 'painting':
		$color = "Orange";
		break;
		case 'sculpture':
		$color = "LightCoral";
		break;
		default:
		$color = "LightBlue";
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
		echo "<tr style='background-color: $color'>";

		foreach ($row as $cell) {
			echo "<td>$cell</td>";
		}

		echo "</tr>";
	}
}


function show_query_results($result){
	echo '<table class="table">';
	
	show_header($result);

	show_rows($result);

	echo "</table>";
}

?>


<html>
<head>
    <title>Artworks results</title>
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="./bootstrap.min.css">
	<link rel="stylesheet" href="./style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Artwork project</a>
    </nav>
    <div class="container">
        <div class="custom-template ">
	<?php

	

	// VALIDATE FORM PARAMETERS
	if( !isset($_REQUEST["year1"]) or 
		!isset($_REQUEST["year2"]) or 
		!isset($_REQUEST["city"]))
	{
		$error_message = "Error: insert all requested data";
		print(get_alert_html($error_message));
		die();
	}

	if( !is_numeric($_REQUEST["year1"]) or 
		!is_numeric($_REQUEST["year2"]) or 
		($_REQUEST["year1"] > $_REQUEST["year2"]))
	{
		$error_message = "Error: year values not correct";
		print(get_alert_html($error_message));
		die();
	}

	// GET FORM PARAMETERS
	$a1 = $_REQUEST["year1"];
	$a2 = $_REQUEST["year2"];
	$c = $_REQUEST["city"];


	// DATABASE CONNECTION
	$con = mysqli_connect('localhost','root','','Artwork'); //set your username and password
	if (mysqli_connect_errno())
	{
		$error_message = 'Failed to connect to MySQL: ' . mysqli_connect_error();
		print(get_alert_html($error_message));
		die();
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
	if( !$result ){
		$error_message = 'Query error: ' . mysqli_error($con);
		print(get_alert_html($error_message));
		die();
	}
		
	//SHOW RESULTS

	echo "<h2>Artworks in $c of authors born between $a1 and $a2</h2>";
	if(mysqli_num_rows($result) > 0){
		show_query_results($result);
	} else {
		echo '<div class="alert alert-warning" role="alert">
				No results!
	  		</div>';
	}
	?>
</body>
