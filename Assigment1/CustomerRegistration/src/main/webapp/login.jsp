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
                          <input type="text" class="form-control" id="exampleInputUser" aria-describedby="UserHelp" placeholder="Enter User ID" required>
                      </div>
                      <div class="form-group">
                          <label class="lead" for="exampleInputPassword1">Password :</label>
                          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                      </div>
                      <div class="form-check">
                          <input type="checkbox" class="form-check-input" id="exampleCheck1">
                          <label class="form-check-label" for="exampleCheck1">Check me out</label>
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







          <!-- Optional JavaScript; choose one of the two! -->

          <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
          <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

          <!-- Option 2: Separate Popper and Bootstrap JS -->
          <!--
          <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
          -->
  </body>
  </html>