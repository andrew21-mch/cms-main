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
function UserExist($username){
    $stmt = "SELECT user_email FROM wtaxy_user WHERE user_email=$username";
    $result = mysqli_query($conn,$stmt);
    if(mysqli_num_rows($result)) {
        return true;
    }
    else{
        return false;
    }

    
}
