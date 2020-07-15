<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>

<body>
    <?php
require_once 'homepage.php';
$mail = '';
$username = '';

$errors = array();

// Check if the form was submitted
if (isset($_POST['submit'])) {
    $mail = $_POST['mail'];
    $password = $_POST['password'];
    $username = $_POST['username'];
    // First, I clean the email
    $sanitizeMail = filter_var($mail, FILTER_SANITIZE_EMAIL);
    // Verify the format
    $sanitizeMail = filter_var($sanitizeMail, FILTER_VALIDATE_EMAIL);

    // Check inputs
    if (!$sanitizeMail) {
        $errors['mail'] = 'You must enter a valid email address.';
    }

    if (empty($username)) {
        $errors['username'] = 'Username is mandatory.';
    }

    if (empty($password)) {
        $errors['password'] = 'Password is mandatory.';
    }

    // If there is no errors, insert user into DB
    if (count($errors) == 0) {

        //Connect to the DB
        $conn = mysqli_connect("localhost", "root", "", "gclf");

        // Make sure email is not already taken
        $selectQuery = 'SELECT *
      FROM users
      WHERE mail = \'' . $sanitizeMail . '\'';

        $result_query = mysqli_query($conn, $selectQuery);
        $count = mysqli_num_rows($result_query);

        if ($count > 0) {
            // EMAIL ALREADY TAKEN !
            $errors['duplicatemail'] = 'Email already taken !';
        } else {

            // Hash the password
            $securePassword = password_hash($password, PASSWORD_DEFAULT);

            // Prepare & Execute query
            $query = "INSERT INTO users(username, mail, password)
        VALUES('$username', '$sanitizeMail', '$securePassword')";

            // !!!!! Check the query : var_dump($query);

            $result_query = mysqli_query($conn, $query);

            // Check if the user was successfully registered
            if ($result_query) {
                echo 'Successfully registered. You can now login.<br>';
                echo '<a href="login.php">Login</a>';
            } else {
                echo 'Something went wrong... Try again.';
            }

            // Close connection
        }
        mysqli_close($conn);
    }
}

foreach ($errors as $key => $error) {
    echo "Error($key) : $error<br>";
}

?>


    <h1>Register to the website</h1>
    <br>
    <form action="" method="post">
        <input type="text" name="username" placeholder="username" value="<?=$username;?>"><br>
        <input type="text" name="mail" placeholder="email" value="<?=$mail;?>"><br>
        <input type="password" placeholder="password" name="password"><br>
        <input type="submit" name="submit" value="Register">
    </form>
</body>

</html>