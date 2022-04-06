<%@page import="java.util.*" %>
<%@page import="com.customer.model.*" %>
<%@page import="com.customer.helper.*" %>
<%@page import="com.customer.DAO.*" %>

<div class="table-responsive">
        <table class="table table-stripped">
             <tr>
               <th>S.No</th>
               <th>Fname</th>
               <th>Lname</th>
               <th>Email</th>
               <th>City</th>
               <th>Country</th>
               <th>State</th>
               <th>Mobile</th>
             </tr>

<%

     String type=request.getParameter("type");
     String search=request.getParameter("search");

     PartyDao pd = new PartyDao(ConnectionProvider.getConnection());
     ArrayList<HashMap<LoginParty,PartyCustomer>> listU = pd.search(type,search);
     int cnt=1;
     for(HashMap<LoginParty,PartyCustomer> user : listU){
       LoginParty lp=null;
       PartyCustomer pc=null;

       for( Map.Entry<LoginParty,PartyCustomer> pair : user.entrySet()){
             lp = pair.getKey();
             pc = pair.getValue();
       }


  %>


             <tr>
                <td><%=cnt%></td>
                <td><%=pc.getFname()%></td>
                <td><%=pc.getLname()%></td>
                <td><%=lp.getLoginPID()%></td>
                <td><%=pc.getCity()%></td>
                <td><%=pc.getCountry()%></td>
                <td><%=pc.getState()%></td>
                <td><%=pc.getPhone()%></td>
             </tr>
             <%
                    cnt++;
                  }

                  %>

        </table>


