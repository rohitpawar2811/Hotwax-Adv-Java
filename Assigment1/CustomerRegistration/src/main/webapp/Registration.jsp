 <!doctype html>
 <html lang="en">
 <head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

     <title>Registration</title>
 </head>
 <body>
 <!-- this is including -->
 <%@ include file = "navbar.html" %>

 <div class="text-center container" id="error-box" style="display:none">
      <div class=" ml-1 mt-2 mr-1 mb-2 card shadow-lg alert-danger" >
           <span>
                <button type="button" id="e-close" class="close" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>

           <div class="lead" id="error-msg">
               Error
           </div>
           </span>
       </div>
 </div>
 <div class ="container text-center">
     <div class="container w-50 h-50">
         <div class="msg-container text-center  card shadow-lg ">
             <div class="card-header">
                 <div class="h4 p-2 bg-primary rounded-lg shadow-lg">
                     Registration Page
                 </div>
             </div>
             <div class="card-body">
                 <form class="form" method="post" id="form-submit">
                     <div class="form-group">
                         <label class="" for="exampleInputFUser">first Username :</label>
                         <input type="text" class="form-control" id="exampleInputFUser" name="fname" aria-describedby="UserHelp" placeholder="Enter User Fname" required >
                     </div>
                     <div class="form-group">
                         <label class="" for="exampleInputLUser">last Name :</label>
                         <input type="text" class="form-control" id="exampleInputLUser" name="lname" aria-describedby="UserHelp" placeholder="Enter User Lname" required>
                     </div>
                     <div class="form-group">
                         <label class="" for="exampleInputEmail">EmailID :</label>
                         <input type="text" class="form-control" id="exampleInputEmail" name="email" aria-describedby="UserHelp" placeholder="Enter User EmailID" required>
                     </div>
                     <div class="form-group">
                         <label class="" for="exampleInputPassword1">Password :</label>
                         <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
                     </div>
                     <div class="form-group">
                         <label for="exampleFormControlTextarea1">Address</label>
                         <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Address" name="address" rows="3" required></textarea>
                     </div>
                     <div class="form-row">
                         <div class="form-group col-md-6">
                             <label for="exampleInputCity">City</label>
                             <input type="text" class="form-control" id="exampleInputCity" name="city" aria-describedby="UserHelp" placeholder="Enter the City" required>
                         </div>
                         <div class="form-group col-md-4">
                             <label for="exampleInputState">State</label>
                             <input type="text" class="form-control" id="exampleInputState" name="state" aria-describedby="UserHelp" placeholder="Enter User State" required>
                         </div>
                         <div class="form-group col-md-2">
                             <label for="inputZip">Zip</label>
                             <input type="text" name="zip" class="form-control" id="inputZip">
                         </div>
                     </div>
                     <div class="form-group">
                         <label class="" for="exampleInputCountry">Country :</label>
                         <input type="text" class="form-control" id="exampleInputCountry" name="country" aria-describedby="UserHelp" placeholder="Enter User Country" required>
                     </div>
                     <div class="form-group">
                         <label class="" for="exampleInputPhone">Phone :</label>
                         <input type="number" class="form-control" id="exampleInputPhone" name="phone" aria-describedby="UserHelp" placeholder="Enter User Phone number" required>
                     </div>
                     <div class="form-check">
                         <input type="checkbox" class="form-check-input" id="check">
                         <label class="form-check-label" for="check">Check me out</label>
                     </div>
                     <button type="submit" class="btn btn-primary">Submit</button>

                 </form>
             </div>

         </div>
     </div>
 </div>








         <!-- Optional JavaScript; choose one of the two! -->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

         <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
 <!--        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>-->
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
          <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



         <script>
             $('document').ready(()=>{

              $("#e-close").on("click",()=>{
                   let eBox = $('#error-box');
                   let eMsg = $('#error-msg');
                   eBox.hide();
                   eMsg.text("");
              })


              $("#form-submit").on("submit",(e)=>{
                   e.preventDefault();
                   console.log("hii");
                   let obj2 = {}
                   let fdata = new FormData(document.getElementById('form-submit'));
                   for(let a of fdata.entries()){
                       key = a[0];
                       value = a[1];
                       obj2[key]=value;
                   }

                   if($("#check").is(":checked")){
                          let res=validate(fdata);

                           $.ajax({
                               url: "RegisterServ",
                               type: 'POST',
                               data : obj2,
                           success: function(data, textStatus, jqXHR) {
                               console.log("you successfully looged in" + data);
                               if (data.toString().localeCompare("done") == 0) {
                                   swal({
                                       title: "done!",
                                       text: "You Registered succesfully!",
                                       icon: "success",
                                   }).then((value)=>{
                                           if(value){
                                               location.href="login.jsp";
                                           }
                                           else{
                                               location.href="login.jsp";
                                           }
                                       });
                                   }
                                   else {
                                       swal({
                                           title: "Error!",
                                           text: "You have been already Register succesfully!",
                                           icon: "warning",
                                       }).then((value)=>{
                                           if(value){
                                               location.href="login.jsp";
                                           }
                                           else{
                                               location.href="login.jsp";
                                           }
                                       });

                                       }
                                       $('#sub').show();
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
                   else{
                      alert("hall you did'nt check the button");
                   }
              })

             })

             function validate(data){
                 let flag= true;
                 let eBox = $('#error-box');
                 let eMsg = $('#error-msg');
                  for(var pair of data.entries()) {

                     let key=pair[0].toString();

                     let value=pair[1];
                     if(value===""){
                       eMsg.text(eMsg.text()+"\n"+"Field "+key+"is required enter data...")
                         eBox.show();
                         flag = false;

                     }
                     if(key==="fname" && key.length<6){
                        eMsg.text("fname is too short")
                        flag = false;
                     }
                     else if(key==="email" && key.length<10){
                        eMsg.text("Email is Invalid")
                        flag = false;
                     }
                     else if(key==="password" && key.length<8){
                        eMsg.text("Password is too Short");
                        flag = false;
                     }

                  }

                  if(flag=false){
                      eBox.show();
                  }

                  return flag;
             }
          </script>
  </body>
  </html>