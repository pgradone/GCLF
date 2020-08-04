<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php require_once 'nav.php'; ?>
    <?php
    $db_name = 'gclf';
    $db_handle = mysqli_connect('localhost', 'root', '', $db_name);
    $db_found = mysqli_select_db($db_handle, $db_name);

    if ($db_found) {

        // build selection criteria given the key and value of $_GET supervariable
        $criteria = !empty($_GET) ? 'WHERE ' . key($_GET) . ' LIKE \'%' . $_GET[key($_GET)] . '%\'' : '';
        // build query text with criteria, if any
        $sql_query = 'SELECT m.*, c.gender FROM movies m
                LEFT JOIN categories c ON c.category_id = m.category_id ' . $criteria;
        $result_query = mysqli_query($db_handle, $sql_query);
        if ($result_query) {
            // $movie = mysqli_fetch_assoc($result_query);
            $movies = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
            foreach ($movies as $movie) {
                echo '<strong>Title : </strong>' . $movie['title'] . '<br>';
                echo '<img src="' . $movie['poster'] . '" alt="' . $movie['title'] . '" style="height:200px" ">';
                echo '<p><strong>Synopsis : </strong>' . $movie['synopsis'] . '</p>';
                echo '<strong>Released : </strong>' . $movie['year_released'] . ', ';
                echo '<strong>Caregory : </strong>' . $movie['gender'] . '<br>';
                if (isset($movie['imdb_ref']))
                    echo '<p><a href="' . $movie['imdb_ref'] . '">IMDB details</a></p>';
                $sql_query = 'SELECT * FROM act INNER JOIN actors a ON a.actor_id = act.actor_id WHERE act.movie_id = ' . $movie['movie_id'];
                $result_query = mysqli_query($db_handle, $sql_query);
                if ($result_query) {
                    echo '<p><strong>Actors:</strong><p>';
                    $actors = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
                    foreach ($actors as $actor) {
                        echo '<img src="' . $actor['portrait'] . '" alt="' . $actor['first_name'] . ' ' . $actor['surname'] . '" style="height:50px" ">' .
                            $actor['first_name'] . ' ' . $actor['surname'] . '<br>';
                    }
                } else {
                    echo 'wrong query for actors : ' . $sql_query . '<br><hr>';
                }
                echo '<hr>';
            }
        } else {
            echo 'wrong query for movies : ' . $sql_query . '<br>';
        }
    } else {
        echo 'DB not found (' . $db_name . ')';
    }

    ?>


</body>

</html>