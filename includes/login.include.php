<?php      
    require_once "../config.php"; 
        if(isset($_POST['login'])){
            $username = $_POST['email'];  
            $password = $_POST['password'];  
            
            //prevent sql injection
            $username = stripcslashes($username);  
            $password = stripcslashes($password);  
            $username = mysqli_real_escape_string($conn, $username);  
            $password = mysqli_real_escape_string($conn, $password);  
          
            $sql = "SELECT user_email, user_pass from wtaxy_user where user_email='$username' and user_pass='$password' ";  
            $result = mysqli_query($conn, $sql);  
            $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
            $count = mysqli_num_rows($result);  
              
            if($count == 1){  
                header("Location: ../user/dashboard.html"); 
            }  
            else{  
                header("Location: ../login.html"); 
            }     
        }
        
    ?>  