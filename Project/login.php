<?php session_start();?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        $errors['email'] = 'You must enter a valid email address.';
    }

    if (empty($password)) {
        $errors['password'] = 'Password is mandatory.';
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
                $errors['wrongpassword'] = 'Wrong password.';
            }
        } else {
            $errors['mailnotfound'] = 'User with this address email doesnt exists.';
        }

    }
}

var_dump($errors);
?>

    <h1>Log In to the website</h1>
    <form action="" method="post">
        <input type="mail" name="email" placeholder="mail"><br>
        <input type="password" name="password" placeholder="password"><br>
        <input type="submit" name="submit" value="LOGIN">
    </form>
</body>

</html>