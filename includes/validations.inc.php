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
    $record = "SELECT * FROM wtaxy_user";
    $result = mysqli_fetch_assoc($$record);

    print_r($result);

}
