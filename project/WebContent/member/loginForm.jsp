<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="../css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


</head>
<body>

<!-- <ul class="w3-ul">
    <li><i class="fa fa-home"></i> Home</li>
    <li class="w3-large"><i class="fa fa-home"></i> Home</li>
    <li class="w3-xlarge"><i class="fa fa-home"></i> Home</li>
    <li class="w3-xxlarge"><i class="fa fa-home"></i> Home</li>
    <li class="w3-xxxlarge"><i class="fa fa-home"></i> Home</li>
    <li class="w3-jumbo w3-teal"><i class="fa fa-home"></i> Home</li>
  </ul> -->
  
   

	
		 <div class="sidenav" style="background-color: lightslategray;"> 
         <div class="login-main-text">
            <h2> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
       </div>   
  
      <div class="main">
      <br>
      	 <a href="../main/main.jsp"><img alt="" src="home.png" width="50px" height="50px" style="float:right; margin-bottom: 100px; margin-right:530px; " ></a>
         <div class="col-md-6 col-sm-12">
        
            <div class="login-form">
               <form action="loginPro.jsp" method="post">
                  <div class="form-group">
                     <label>User ID</label>
                     <input type="text" name="id" class="form-control" placeholder="User ID">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="pass" class="form-control" placeholder="Password">
                  </div>
                  <input type="submit" value="Login" class="btn btn-black">
                  <input type="button" value="Register" class="btn btn-secondary" onclick="location.href='joinForm.jsp'">
               <br><br> 
               </form>
               <!-- <p><a href="../main/main.jsp"><button class="w3-btn w3-orange w3-xlarge" style="color: white;">Home<i class="w3-margin-left fa fa-home"></i></button></a></p> -->
                <br><br><br>
                
            </div>
         </div>
      </div>
      
      


</body>
</html>