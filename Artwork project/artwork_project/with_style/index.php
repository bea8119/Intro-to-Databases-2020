<html>
<head>
    <title>Artworks</title>
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
            
            <h5>Set a range of author's birth year and the city</h5>
            <form action="process.php" method="GET">
                <p class="lead" >Birthdate between</p>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label" for="start_year">Start year</label>
                    <div class="col-sm-10">
                        <input id="start_year" class="form-control" type="text" name="year1" placeholder="e.g. 1500">
                    </div>
                </div>
                <div class="form-group row" >
                    <label class="col-sm-2 col-form-label" for="end_year">End year</label>
                    <div class="col-sm-10">
                        <input id="end_year" class="form-control" type="text" name="year2" placeholder="e.g. 1600">
                    </div>
                </div>
                <p class="lead" >Artwork city</p>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label" for="select_city">City</label>
                    <div class="col-sm-10">
                        <select id="select_city" class="form-control"  name="city">
                            <option value="Torino">Torino</option>
                            <option value="Milano">Milano</option>
                            <option value="Roma">Roma</option>
                            <option value="Napoli">Napoli</option>
                        </select>
                    </div>
                </div>
                
                <input class="btn btn-primary" type="submit" value="Send" />
                <input class="btn" type="reset" value="Cancel" />
            </form>
        </div>
    </div>
    
    
    
    
    
    
</div>



</body>
</html>


