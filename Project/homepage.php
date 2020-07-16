<?php

require_once 'nav.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/style-home.css">
    <title>Home</title>
</head>

<body>
    <main>
        <h2>Welcome to our movie homepage</h2>

        <p>
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus illo, tempora sit consequatur dolorem
            dignissimos accusantium voluptatum corrupti obcaecati sapiente in laborum delectus animi minus natus, ad
            iste at
            alias? Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse nihil eum quidem quod qui possimus
            omnis
            consequuntur officiis, deserunt repellendus optio animi magnam, assumenda rem, natus illum ea aut corporis.
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum consequuntur corrupti eveniet excepturi
            inventore
            voluptatem, harum adipisci repellat incidunt nesciunt, dignissimos nulla! Temporibus facere inventore
            suscipit
            excepturi veniam sapiente! Facere!
        </p>

        <form action="" method="post">
            <input type="search" name="search" id="mysearch">
            <input type="submit" name="submit" value="Search a Movie">
            <div id="results"></div>
        </form>

        <div class="categories">
            <?php 
            $db_name = 'gclf';
            $db_handle = mysqli_connect('localhost', 'root', '', $db_name);
            $db_found = mysqli_select_db($db_handle, $db_name);
            
            if ($db_found) {
                //! count the TITLEs for EACH category
                $sql_query = 'SELECT c.gender, COUNT(m.title) as cg FROM categories c
                LEFT JOIN movies m ON c.category_id = m.category_id
                GROUP BY c.gender';
                $result_query = mysqli_query($db_handle, $sql_query);
                if ($result_query) {
                    $categories = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
                    foreach ($categories as $category) {
                        echo '<a href="movie-details.php?gender=' . $category['gender'] . '">' . $category['gender'] . '(' . $category['cg'] . ')</a>';
                    }
                }
            }
            
            ?>
        </div>

        <section class="highlightedmovies">
            <?php
           $db_name = 'gclf';
           $db_handle = mysqli_connect('localhost', 'root', '', $db_name);
           $db_found = mysqli_select_db($db_handle, $db_name);
           
           if ($db_found) {
               $sql_query = 'SELECT * FROM movies';
               $result_query = mysqli_query($db_handle, $sql_query);
               if ($result_query) {
                   $movies = mysqli_fetch_all($result_query, MYSQLI_ASSOC);
                   foreach ($movies as $movie) {
                    //    echo '<a href="movie-details.php?gender=' . $category['gender'] . '">' . $category['gender'] . '</a>';
                        echo '<article>
                        <div id="card">
                        <img src="' . $movie['poster'] . '" alt="' . $movie['title'] . '" style="height:200px" ">
                        <br>
                        </div>
                        <h3>
                            <a href="movie-details.php?movie_id=' . $movie['movie_id'] . '">title</a>
                        </h3>
                    </article>';
                    }
               }
           }

            ?>

         
        </section>
    </main>
    <script src=" https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
    </script>
    <script>
    $(function() {
        $('#mysearch').keyup(function(e) {
            e.preventDefault();
            $.ajax({
                url: 'search.php',
                type: 'post',
                dataType: "html",
                data: {
                    mySearch: $(this).val()
                },
                success: function(result) {
                    console.log(result);
                    $('#results').show();
                    $('#results').html(result);
                    $("#results").css("background", "#FFF");
                },
                error: function(err) {
                    // IF AJAX ERROR HAPPENED
                }
            });
        });
    });

    function selectCountry(val) {
        $("#mysearch").val(val);
        $("#results").hide();
    }
    </script>

</body>

</html>
