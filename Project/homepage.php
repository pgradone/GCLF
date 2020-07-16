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
        </form>

        <div class="categories">
            <a href="">adventure</a>
            <a href="">comedy</a>
            <a href="">drama</a>
            <a href="">horror</a>
            <a href="">Sci-fi</a>
            <a href="">triller</a>
        </div>

        <section class="categories">
            <article>
                <div id="card">

                </div>
                <h3>
                    <a href="">title</a>
                </h3>
            </article>

            <article>
                <div id="card">

                </div>
                <h3>
                    <a href="movie-details.php">title</a>
                </h3>
            </article>

            <article>
                <div id="card">

                </div>
                <h3>
                    <a href="">title</a>
                </h3>
            </article>
            <article>
                <div id="card">

                </div>
                <h3>
                    <a href="">title</a>
                </h3>
            </article>
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
