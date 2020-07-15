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
// Make sur I get an ID
if (isset($_GET['id'])) {

    // Make sure it is a number I get
    $movieID = (int) $_GET['id'];

    // Make sure it's an number AND a valid ID
    if ($movieID > 0) {
        $db_name = 'gclf';
        $db_handle = mysqli_connect('localhost', 'root', '', $db_name);
        $db_found = mysqli_select_db($db_handle, $db_name);

        if ($db_found) {

            $sql_query = 'SELECT m.*, c.gender 
            FROM movies m 
            INNER JOIN categories c ON c.category_id = m.category_id
            WHERE m.id = ' . $movieID;

            $result_query = mysqli_query($db_handle, $sql_query);
            $movie = mysqli_fetch_assoc($result_query);

            echo '<img href="' . $movie['poster'] . '" alt="' . $movie['title'] . '">';
            echo '<p><strong>Title : </strong>' . $movie['title'] . '</p>';
            echo '<p><strong>Year of release : </strong>' . $movie['year_released'] . '</p>';

            echo '<br>';
            echo '<p><strong>Caregory : </strong>' . $movie['gender'] . '</p>';
        } else {
            echo 'DB not found (' . $db_name . ')';
        }
    } else {
        echo 'Something\'s wrong1... movie_id not OK!';
        echo '<a href="./">Go Back</a>';
    }
} else {
    echo 'Something\'s wrong... no movie_id provided!';
    echo '<a href="./">Go Back</a>';
}

?>


</body>

</html>