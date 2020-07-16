<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./styles/style-login.css">
</head>

<body>

    <?php
    require_once 'nav.php';
    $errors = array();

    if (isset($_POST['submit'])) {
        $mail = $_POST['email'];
        $password = $_POST['password'];
        // First, I clean the email
        $sanitizeMail = filter_var($mail, FILTER_SANITIZE_EMAIL);
        // Verify the format
        $sanitizeMail = filter_var($sanitizeMail, FILTER_VALIDATE_EMAIL);

        // Check inputs
        if (!$sanitizeMail) {
            $errors['email'] = "<p style=' color:red; text-align:center';>You must enter a valid email.";
        }

        if (empty($password)) {
            $errors['password'] = "<p style=' color:red; text-align:center';>Password is mandatory.";
        }

        if (count($errors) == 0) {
            //Connect to the DB
            $conn = mysqli_connect("localhost", "root", "", "gclf");

            $selectQuery = 'SELECT *
      FROM users
      WHERE email = \'' . $sanitizeMail . '\'';

            $result_query = mysqli_query($conn, $selectQuery);
            $user = mysqli_fetch_assoc($result_query);

            // Check if the user exists
            if (!is_null($user) && !empty($user)) {
                if (password_verify($password, $user['password'])) {
                    echo 'Successfully Login';
                    $_SESSION['email'] = $sanitizeMail;
                    $_SESSION['username'] = $user['username'];
                } else {
                    $errors['wrongpassword'] = "<p style=' color:red; text-align:center';>Wrong password. Please review.";
                }
            } else {
                $errors['mailnotfound'] = "<p style=' color:red; text-align:center';>This email doesn\'t exist. Please retry.";
            }
        }
    }

    //var_dump($errors);
    ?>

    <h2 style="text-align: center;">Please login:</h2><br>
    <form style="text-align: center;" action="" method="post">
        <input type="mail" name="email" placeholder="Email"><br><br>
        <input type="password" name="password" placeholder="Password"><br><br>
        <input type="submit" name="submit" value="Enter">
    </form>
</body>

</html>