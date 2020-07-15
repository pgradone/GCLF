<?php ?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <nav class="topnav">
        <a class="active" href="homepage.php">home</a>
        <a href="#categories">Categories</a>
        <a href="#addmovie">Add Movie</a>
        <a href="register.php">Register</a>
        <a href="login.php">Login</a>

        <div class="search-container">
            <form action="/action_page.php">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </nav>
    <div style="padding-left:16px">
        <h2></h2>
    </div>

</body>

</html>