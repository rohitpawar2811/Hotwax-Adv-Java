  <%
    Object u = session.getAttribute("currentUser");
    if(u!=null){
       response.sendRedirect("profile.jsp");
    }
  %>

  <!doctype html>
  <html lang="en">
  <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

      <title>Hello, world!</title>
  </head>
  <body>
  <!-- this is including -->
  <%@ include file = "navbar.html" %>
  <div class ="container text-center">
      <div class="container w-50 h-50">
          <div class="msg-container text-center  card shadow-lg ">
              <div class="card-header">
                  <div class="h1 bg-primary rounded-lg shadow-lg">
                      Login User
                  </div>
              </div>
              <div class="card-body">
                  <form class="form" method="post" id="form-submit">
                      <div class="form-group">
                          <label class="lead h1" for="exampleInputUser">Username :</label>
                          <input type="email" class="form-control" name="uemail" id="exampleInputUser" aria-describedby="UserHelp" placeholder="Enter User Email ID" required >
                      </div>
                      <div class="form-group">
                          <label class="lead" for="exampleInputPassword1">Password :</label>
                          <input type="password" class="form-control" name="upass" id="exampleInputPassword1" placeholder="Password" required>
                      </div>

                      <button type="submit" class="btn btn-primary">Submit</button>

                  </form>
              </div>
             <div class="card-link p-2">
                if you are not <a href="./Registration.jsp">Registered the Register first!!!</a>
             </div>
          </div>
      </div>
      <div>





         <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


          <script>
             $('document').ready(()=>{

                $("#form-submit").on("submit",(e)=>{
                   e.preventDefault();
                   console.log("hii");
                   let obj2 = {}
                   let fdata = new FormData(document.getElementById('form-submit'));
                     for(let a of fdata.entries()){
                       key = a[0];
                       value = a[1];
                       console.log(a);
                       obj2[key]=value;
                   }
                    console.log(obj2);
                    $.ajax({
                        url:"LoginServ",
                        type:'POST',
                        data :obj2,
                         success: function(data, textStatus, jqXHR) {
                                console.log("you successfully looged in" + data);
                                if ( $.trim(data) == "done") {
                                    swal({
                                        title: "done!",
                                        text: "Click ok ",
                                        icon: "success",
                                    }).then((value)=>{
                                              if(value){
                                                  location.href="profile.jsp";
                                              }
                                              else{
                                                  location.href="login.jsp";
                                              }
                                          });
                                 }
                                else if ($.trim(data) == "user not registered") {
                                         swal({
                                             title: " not done!",
                                             text: "You have to Signup first!",
                                             icon: "success",
                                         })
                                 }
                                else if($.trim(data) == "wrong"){
                                   swal({
                                          title: "wrong!",
                                          text: "Your Password is wrong!",
                                          icon: "success",
                                      })
                                }
                         },
                         error: function(data, textStatus, jqXHR) {
                            console.log(data + " " + textStatus + " " + jqXHR);
                            console.log(textStatus);
                            console.log(data);
                            swal({
                                title: "done!",
                                text: "Technical error",
                                icon: "warning",
                            });
                        }
                    });
                });
             });
          </script>

  </body>
  </html>