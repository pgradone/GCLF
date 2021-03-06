<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="./styles/style-register.css">
</head>

<body>
    <?php
    require_once 'nav.php';
    $mail = '';
    $firstname = '';
    $lastname = '';

    $errors = array();

    // Check if the form was submitted
    if (isset($_POST['submit'])) {
        $mail = $_POST['mail'];
        $password = $_POST['password'];
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        // First, I clean the email
        $sanitizeMail = filter_var($mail, FILTER_SANITIZE_EMAIL);
        // Verify the format
        $sanitizeMail = filter_var($sanitizeMail, FILTER_VALIDATE_EMAIL);

        // Check inputs
        if (!$sanitizeMail) {
            $errors['mail'] = "<p style=' color:red; text-align:center';>You must enter a valid email address.";
        }

        if (empty($firstname)) {
            $errors['firstname'] = "<p style=' color:red; text-align:center';>First name is mandatory.";
        }
        if (empty($lastname)) {
            $errors['lastname'] = "<p style=' color:red; text-align:center';>Last name is mandatory.";
        }

        if (empty($password)) {
            $errors['password'] = "<p style=' color:red; text-align:center';>Password is mandatory.";
        }

        // If there is no errors, insert user into DB
        if (count($errors) == 0) {

            //Connect to the DB
            $conn = mysqli_connect("localhost", "root", "", "gclf");

            // Make sure email is not already taken
            $selectQuery = 'SELECT *
      FROM users
      WHERE email = \'' . $sanitizeMail . '\'';

            $result_query = mysqli_query($conn, $selectQuery);
            $count = mysqli_num_rows($result_query);
            if ($count > 0) {
                // EMAIL ALREADY TAKEN !
                $errors['duplicatemail'] = 'Email already taken !';
            } else {

                // Hash the password
                $securePassword = password_hash($password, PASSWORD_DEFAULT);
                //var_dump($selectQuery);

                // Prepare & Execute query
                $query = "INSERT INTO users(firstname ,lastname, email, password)
        VALUES('$firstname','$lastname', '$sanitizeMail', '$securePassword')";

                // !!!!! Check the query : var_dump($query);

                $result_query = mysqli_query($conn, $query);

                // Check if the user was successfully registered
                if ($result_query) {
                    echo "<p style='color:white; background-color:grey; text-align:center';>Successfully registered. You can now login.<br>";
                    header('Refresh: 5; url="login.php');
                } else {
                    echo "<p style='color:red; text-align:center'>Something went wrong... Try again.";
                }

                // Close connection
            }
            mysqli_close($conn);
        }
    }

    foreach ($errors as $key => $error) echo "$error";

    ?>


    <h2 style="text-align:center"> Register on the website</h2> <br>
    <form class="register" action="" method="post" style="text-align: center">
        <input type="text" name="firstname" placeholder="First Name" value="<?= $firstname; ?>"><br><br>
        <input type="text" name="lastname" placeholder="Last Name" value="<?= $lastname; ?>"><br><br>
        <input type="text" name="mail" placeholder="Email" value="<?= $mail; ?>"><br><br>
        <input type="password" name="password" placeholder="Password"><br><br>
        <input type="submit" name="submit" value="Register">
    </form>
</body>

</html>