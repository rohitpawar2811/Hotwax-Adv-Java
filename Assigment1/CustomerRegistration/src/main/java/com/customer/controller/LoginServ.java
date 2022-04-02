package com.customer.controller;



import com.customer.DAO.PartyDao;
import com.customer.helper.ConnectionProvider;
import com.customer.model.LoginParty;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String userEmail=request.getParameter("uemail");
        String userPass=request.getParameter("upass");
        System.out.print(userEmail+" "+userPass);
        PartyDao dao=new PartyDao(ConnectionProvider.getConnection());
        LoginParty user=null;
        user= dao.getUserByEmail(userEmail.trim());

        if(user==null){
             out.print("user not registered");
        }
        else if(user.getPassword().equals(userPass)){
            HttpSession session= request.getSession(true);
            session.setAttribute("currentUser",user);
            out.println("done");
//            response.sendRedirect("./profile.jsp");
        }
        else{
            //Password wrong case
            out.println("wrong");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.sendRedirect("login.jsp");
    }
}