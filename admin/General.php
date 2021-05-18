<?php

require_once "../config.php";
class User {
    public $first_name;
    public $last_name;
    public $username;
    public $password;
    public $user_email;

    public function __construct(){
        //some code
    }

    public function CreateAccount($username,$user_email,$password,$first_name,$last_name){
        if(isset($_POST['register'])){
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $username = $_POST['username'];
            $password = $_POST['password'];
            $user_email = $_POST["email"];


            $sql = "INSERT INTO `wtaxy_user`(`user_name`, `user_email`, `user_pass`, `user_first_name`, `user_last_name`) VALUES ('[$username]','[$user_email]','[$password]','[$first_name]','[$last_name]')";
            if(mysqli_query($conn,$sql)){
                echo"<script>alert('YAccount Succesfully Created');</script>";
            }
            else
            {
            echo "ERROR:". $sql. "<br>". mysqli_error($conn);
            }
        }
    }
    public function LoginUser(){
        //some code here for login
    }


}
user = new CreateAccount($username,$user_email,$password,$first_name,$last_name);