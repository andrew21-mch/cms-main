<?php

function ValidatePass($password, $password_repeat){
    if($password === $password_repeat){
        return true;
    }
    else{
        return false;
    }
}
