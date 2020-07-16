<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php require_once 'nav.php';?>
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
            echo '<div style="display:flex"></div><img src="' . $movie['poster'] . '" alt="' . $movie['title'] . '" style="height:200px" ">';
            echo '<p><strong>Title : </strong>' . $movie['title'] . '</p>';
            echo '<p><strong>Category : </strong>' . $movie['gender'] . '</p></div>';
            echo '<p><strong>Synopsis : </strong>' . $movie['synopsis'] . '</p>';
            echo '<p><strong>Released : </strong>' . $movie['year_released'] . '</p>';
            echo '<p><strong>Caregory : </strong>' . $movie['gender'] . '</p>';
<<<<<<< HEAD
=======
=======
                . $criteria;
            $result_query = mysqli_query($db_handle, $sql_query);
            if ($result_query) {
                // $movie = mysqli_fetch_assoc($result_query);
                $movies = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
                foreach ($movies as $movie) {
                    echo '<div style="display:flex"></div><img src="' . $movie['poster'] . '" alt="' . $movie['title'] . '" style="height:200px" ">';
                    echo '<p><strong>Title : </strong>' . $movie['title'] . '</p>';
                    echo '<p><strong>Category : </strong>' . $movie['gender'] . '</p></div>';
                    echo '<p><strong>Synopsis : </strong>' . $movie['synopsis'] . '</p>';
                    echo '<p><strong>Released : </strong>' . $movie['year_released'] . '</p>';
                    echo '<p><strong>Caregory : </strong>' . $movie['gender'] . '</p>';
                    echo '<hr>';
                    // get actors for each movie
                    $sql_query = 'SELECT * FROM act INNER JOIN actors a ON a.actor_id = act.actor_id WHERE act.movie_id = ' . $movie['movie_id'];
                    $result_query = mysqli_query($db_handle, $sql_query);
                    if ($result_query) {
                        $actors = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
                        foreach ($actors as $actor) {

                        }
                    }
                }
            } else {
                echo 'wrong query : ' . $sql_query . '<br>';
            }
        } else {
            echo 'DB not found (' . $db_name . ')';
>>>>>>> 8c99d73efe76c23820663498ba3048ec0dbc7c36
>>>>>>> 789b807397b38442b585be9cb6abc6cbcbaf0a67
        }
    } else {
        echo 'wrong query : ' . $sql_query . '<br>';
    }
} else {
    echo 'DB not found (' . $db_name . ')';
}

?>


</body>

</html>