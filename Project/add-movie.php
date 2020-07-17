<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie</title>
    <link rel="stylesheet" href="./styles/style-sub-nav.css">

</head>

<body>
    <?php require_once 'nav.php';?>
    <div class="sub-nav-title">
        <h5>Selected film : title of film</h5>
    </div>
    <h2 style="text-align:center"> Add movie to the database</h2> <br>
    <form class="insertmovie" action="" method="post" style="text-align: center">
        <input type="text" name="title" placeholder="Movie title" value=""><br><br>
        <input type="text" name="year_released" placeholder="year of release" value=""><br><br>
        <input type="text" name="synopsis" placeholder="Synopsis" value=""><br><br>
        <input type="text" name="poster" placeholder="Poster" value=""><br><br>
        <input type="text" name="category_id" placeholder="Category" value=""><br><br>
        <input type="submit" name="createmovie" value="Create movie">
    </form>
</body>

</html>