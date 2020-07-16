<?php

if (!empty($_POST) && isset($_POST['mySearch'])) {
    // echo 'I got this : ' . $_POST['mySearch'];
    $mySearch = trim($_POST['mySearch']);

    // Search into DB
    // require_once 'database.php';
    // Open a connection to the DBMS
    $connect = mysqli_connect('localhost', 'root', '', 'gclf');

    $query = "SELECT *
    FROM movies
    WHERE title LIKE '$mySearch%'";

    // Send an SQL request to our DB
    $result_query = mysqli_query($connect, $query);

    // Create the array that contains all title matching
    $movies = array();

    echo '<ul id="movies-list">';
    while ($res = mysqli_fetch_assoc($result_query)) {
        echo '<li onClick="selectCountry(\'' . $res['title'] . '\')">' . $res['title'] . '</li>';
    }
    echo '</ul>';
}
