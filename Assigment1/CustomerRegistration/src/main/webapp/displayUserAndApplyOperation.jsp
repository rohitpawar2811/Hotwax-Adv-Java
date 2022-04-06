 <%@page import="java.util.*" %>
 <%@page import="com.customer.model.*" %>
 <%@page import="com.customer.helper.*" %>
 <%@page import="com.customer.DAO.*" %>

 <%
    Object u = session.getAttribute("currentUser");
    if(u==null){
       response.sendRedirect("login.jsp");
    }
  %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
    *{


    }
    </style>

    <!-- script -->

    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function delete1(pid) {

           console.log("hii");

        }

        function update(pid){

            let refOfForm = $("#update-form"+pid)

            let fdata  = new FormData(document.getElementById("update-form"+pid));

            let obj2 = {};
             for(let a of fdata.entries()){
                   key = a[0];
                   value = a[1];
                   console.log(a);
                   obj2[key]=value;
               }
                console.log(obj2);

              $.ajax({
                     url:"updateServ",
                     type:'POST',
                     data :obj2,
                      success: function(data, textStatus, jqXHR) {
                         if($.trim(data) == "done"){
                            swal({
                                 title: "done!",
                                 text: "Successfully updated",
                                 icon: "success",
                             }).then((value)=>{
                                       if(value){
                                           location.href="displayUserAndApplyOperation.jsp";
                                       }
                                       else{
                                           location.href="displayUserAndApplyOperation.jsp";
                                       }
                               });
                         }else{
                            swal({
                                 title: "done!",
                                 text: "Something went wrong try again",
                                 icon: "success",
                             });
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
        }

        </script>



    <title>Document</title>
</head>
<body>
<%@ include file = "navbarAfterLogin.html" %>

<!--header heading section-->
<div class=" container text-center bg-dark rounded p-5">

    <div class="container rounded-lg shadow-lg bg-warning">
        <div class="h1 lead display-4">
            All Users Data....
            <hr>
        </div>
    </div>
    <br>

    <div class="container text-center bg-primary p-5 rounded-lg ">
       <%
           PartyDao pd = new PartyDao(ConnectionProvider.getConnection());
           ArrayList<HashMap<LoginParty,PartyCustomer>> listU = pd.getUsers();
           for(HashMap<LoginParty,PartyCustomer> user : listU){
             LoginParty lp=null;
             PartyCustomer pc=null;

             for( Map.Entry<LoginParty,PartyCustomer> pair : user.entrySet()){
                   lp = pair.getKey();
                   pc = pair.getValue();
             }

       %>
        <div class="card mt-3 col-md-8 offset-2 shadow " style="border-radius:20px;">
            <div class="card-header rounded-lg display-4 ">
              <%=pc.getFname()%> <%=pc.getLname()%>
            </div>
            <div class="card-body d-flex flex-column">

                <!--container 1-->
                <div class="container col-md-8">

                    <!--    form for updating user data -->
                    <form class="form" id="update-form<%=lp.getPartyID()%>">


                        <input type="hidden" class="form-control" name="fname" style="border-radius:15px;" value="<%=pc.getFname()%>" required>
                        <input type="hidden" class="form-control" name="lname" style="border-radius:15px;" value="<%=pc.getLname()%>" required>
                        <input type="hidden" class="form-control" name="pid" style="border-radius:15px;" value="<%=lp.getPartyID()%>" required>

                        <div>
                            <label>Email :</label>
                            <input type="text" class="form-control" name="email" style="border-radius:15px;" value="<%=lp.getLoginPID()%>" required>
                        </div>
                        <div>
                            <label>Address :</label>
                            <input type="text" class="form-control" name="address" style="border-radius:15px;" value="<%=pc.getAddress()%>" required>

                        </div>
                        <div>
                            <label>City :</label>
                            <input type="text" class="form-control" name="city" style="border-radius:15px;" value="<%=pc.getCity()%>" required>

                        </div>
                        <div>
                            <label>Zip :</label>
                            <input type="text" class="form-control" name="zip" style="border-radius:15px;" value="<%=pc.getZip()%>" required>

                        </div>
                        <div>
                            <label>State :</label>
                            <input type="text" class="form-control" name="state" style="border-radius:15px;" value="<%=pc.getState()%>" required>

                        </div>
                        <div>
                            <label>Country :</label>
                            <input type="text" class="form-control" name="country" style="border-radius:15px;" value="<%=pc.getCountry()%>" required>
                        </div>
                        <div>
                            <label>Mobile :</label>
                            <input type="number" class="form-control" name="phone" style="border-radius:15px;" value="<%=pc.getPhone()%>" required>
                        </div>
                        <div>
                            <label>Password :</label>
                            <input type="text" class="form-control" name="password" style="border-radius:15px;" value="<%=lp.getPassword()%>" required>
                        </div>
                    </form>
                </div>
                <!--container 2-->
                <div class="container mt-2 col-md-8 d-flex flex-row justify-content-center">

                    <div class="p-3 m-1">
                        <a class="btn btn-primary btn-lg" onclick="update(<%=lp.getPartyID()%>)" id="update<%=lp.getPartyID()%>">Update</a>
                    </div>

                    <div class="p-3 m-1">
                        <button type="button" class="btn btn-lg btn-danger" data-toggle="modal" data-target="#exampleModal<%=lp.getPartyID()%>">
                           Delete
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->



        <%

              }

        %>

    </div>
</div>


<%
 for(HashMap<LoginParty,PartyCustomer> user : listU){
         LoginParty lp=null;
         PartyCustomer pc=null;

         for( Map.Entry<LoginParty,PartyCustomer> pair : user.entrySet()){
               lp = pair.getKey();
               pc = pair.getValue();
         }

%>

<!-- Modal -->
<div class="modal fade" id="exampleModal<%=lp.getPartyID()%>" tabindex="-1" aria-labelledby="exampleModalLabel<%=lp.getPartyID()%>" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel<%=lp.getPartyID()%>">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Do You really Want to delete data
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         <button type="button" class="btn btn-primary" onclick="location.href = './deleteServ?pid=<%=lp.getPartyID()%>';"   class="float-left submit-button" >Confirm</button>

      </div>
    </div>
  </div>
</div>

<%
   }
%>






</body>
</html>