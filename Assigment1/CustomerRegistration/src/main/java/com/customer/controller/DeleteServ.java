package com.customer.controller;


import com.customer.DAO.PartyDao;
import com.customer.helper.ConnectionProvider;
import com.sun.net.httpserver.Authenticator;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/deleteServ")
public class DeleteServ extends HttpServlet {


    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int pid = Integer.parseInt(request.getParameter("pid"));
            PartyDao save = new PartyDao(ConnectionProvider.getConnection());
            Boolean Status = save.deleteParty(pid);
            System.out.print(pid);
            if (Status) {
                response.sendRedirect("delete.html");
            } else {
                //do nothing that means either server-db internal error/user already existed
            }



        }
    }

}
