  <%
    Object u = session.getAttribute("currentUser");
    if(u==null){
       response.sendRedirect("login.jsp");
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
      <style>

       @import url(https://fonts.googleapis.com/css?family=Open+Sans);

       body{
         background: #f2f2f2;
         font-family: 'Open Sans', sans-serif;
       }

       .search {
         width: 100%;
         position: relative;
         display: flex;
       }

       .searchTerm {
         width: 100%;
         border: 3px solid #00B4CC;
         border-right: none;
         padding: 5px;
         height: 50px;
         border-radius: 5px 0 0 5px;
         outline: none;
         color: #9DBFAF;
       }

       .searchTerm:focus{
         color: #00B4CC;
       }

       .searchButton {
         width: 75px;
         height: 50px;
         border: 1px solid #00B4CC;
         background: #00B4CC;
         text-align: center;
         color: #fff;
         border-radius: 0 5px 5px 0;
         cursor: pointer;
         font-size: 20px;
       }

       /*Resize the wrap to see the search bar change!*/
       .wrap{
         width: 30%;
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
       }

      </style>
      <title>Hello, world!</title>

  </head>
  <body>
  <!-- this is including -->
  <%@ include file = "navbar.html" %>
  <div class ="container text-center">
      <div class="container w-50 h-50">
          <div class="msg-container text-center  card shadow-lg ">
              <div class="card-body">
                  <div class="h1 bg-primary rounded-lg shadow-lg">
                      SEARCHING PAGE......
                  </div>
              </div>
          </div>
      </div>
  </div>

  <div class="container text-center">
       <div class=" m-2 ml-5 card bg-warning mt-3 text-center">
            <div class="form-check">
              <input class="form-check-input" type="radio" name="choice" id="exampleRadios1" value="1" checked>
              <label class="form-check-label h4" for="exampleRadios1">
                 first name
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="choice" id="exampleRadios2" value="2">
              <label class="form-check-label h4" for="exampleRadios2">
                  last name
              </label>
            </div>
       </div>
      <div class="wrap">
         <div class="search">
            <input type="text" class="searchTerm" placeholder="What are you looking for?">
            <button type="submit" class="searchButton">
               Search
           </button>
         </div>
      </div>
  </div>

  <div class="container">
    <div class="table-responsive">
        <table class="table table-stripped">
             <tr>
               <th></td>
               <th></td>
               <td>
             </tr>
        </table>
    </div>
  </div>



  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
           <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
           <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

           <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



  </body>
  </html>
