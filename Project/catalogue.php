<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue</title>
    <link rel="stylesheet" href="./styles/style-catalogue.css">
</head>

<body>
    <?php require_once 'nav.php'; ?>
    <h2>Movies catalogue</h2>
    <hr>
    <?php

    $conn = mysqli_connect("localhost", "root", "", "gclf");
    // retrieve the order
    $order = '';
    if (isset($_POST["order"]))
        $order = $_POST["order"];

    // change last part of the query

    $query = 'SELECT * FROM movies ORDER BY year_released ' . $order;

    $results = mysqli_query($conn, $query);
    $movies = mysqli_fetch_all($results, MYSQLI_ASSOC);
    //var_dump($results);
    mysqli_close($conn);
    ?>


    <form name="sort" method="POST">Order by year:</label>
        <select name="order">
            <option value="" disabled selected>Choose</option>
            <option value="asc">ASC</option>
            <option value="desc">DESC</option>
            <input type="submit" value="Go">
        </select>
    </form>

    <?php


    foreach ($movies as $movie) : ?>
        <hr>
        <img src="<?= $movie['poster'] ?>" alt="" height="300" width="200">
        <p>
            <strong>ID:</strong>
            <?= $movie['movie_id'] ?>
        </p>
        <p>
            <strong>Title:</strong>
            <?= $movie['title'] ?>
        </p>
        <p>
            <strong>Synopsis:</strong>
            <?= $movie['synopsis'] ?>
        </p>
        <a href="movie-details.php?movie_id=<?= $movie['movie_id'] ?>">Details</a>
    <?php endforeach; ?>

</body>

</html>