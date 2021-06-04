<?php
require_once "../config.php";

function ValidatePass($password, $password_repeat){
    if($password === $password_repeat){
        return true;
    }
    else{
        return false;
    }
}
function CheckUserExist($username){
    $sql1 = "SELECT user_email, user_pass from wtaxy_user where user_name ='$username'";  
            $result = mysqli_query($conn, $sql1);  
            $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
            $count = mysqli_num_rows($result);    
            if($count == 1){  
                echo"<script>alert('Username already exist In system')</script>";
            } 
        return true;
}
