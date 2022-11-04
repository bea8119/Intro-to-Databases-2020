<html>
	<head>
		<title>Artworks</title>
	</head>
	<body>
		<h4>Set a range of author's bith year and the city</h4>
		<form action="process.php" method="GET">
			<table>
				<tr>Birthdate between</tr>
				<tr>
					<td>year</td>
					<td><input type="text" size="4" maxlength="4" name="year1"></td>
				</tr>
				<tr>
					<td>and year</td>
					<td><input type="text" size="4" maxlength="4" name="year2"></td>
				</tr>
				<tr>
					<td>City: </td>
					<td>
						<select name="city">
							<option value="Torino">Torino</option>
							<option value="Milano">Milano</option>
							<option value="Roma">Roma</option>
							<option value="Napoli">Napoli</option>
						</select>
					</td>
				</tr>
			</table>
			<br/>
			<input type="reset" value="Cancel" />
			<input type="submit" value="Send" />
		</form>
	</body>
</html>