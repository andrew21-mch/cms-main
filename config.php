<?php
$dbhost = "localhost";
$dbname = "cms";
$dbuser = "root";
$dbpass = "";

$conn = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);
if(!$conn){
  echo '<script>alert("connection error")</script>';
}