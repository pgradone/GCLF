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
    <h3>Movies catalogue</h3>
    <hr>
    <?php

    $conn = mysqli_connect("localhost", "root", "", "gclf");
    $query = 'SELECT * FROM movies LIMIT 3';

    $results = mysqli_query($conn, $query);
    $movies = mysqli_fetch_all($results, MYSQLI_ASSOC);

    //var_dump($results);
    mysqli_close($conn);
    ?>
    <h3>Select by date</h3>

    <?php foreach ($movies as $movie) : ?>
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
        <a href="movie.php?id=<?= $movie['ID'] ?>">Details</a>
    <?php endforeach; ?>

</body>

</html>