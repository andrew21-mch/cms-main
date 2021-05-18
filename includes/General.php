<?php

require_once "../config.php";
require_once "validations.inc.php";
if(isset($_POST['register'])){
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password_repeat = $_POST['password_repeat'];
    $user_email = $_POST["email"];

    if(ValidatePass($password, $password_repeat)==true){
    $sql = "INSERT INTO `wtaxy_user`(`user_name`, `user_email`, `user_pass`, `user_first_name`, `user_last_name`) VALUES ('$username','$user_email','$password','$first_name','$last_name')";
    if(mysqli_query($conn,$sql)){
        echo"<script>alert('YAccount Succesfully Created');</script>";
    }
    else
    {
    echo "ERROR:". $sql. "<br>". mysqli_error($conn);
    }
}
else{
    echo"<script>alert('Passwords did not match');</script>";
}
}
    