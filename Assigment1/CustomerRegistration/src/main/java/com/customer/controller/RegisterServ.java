package com.customer.controller;


import com.customer.DAO.PartyDao;
import com.customer.helper.ConnectionProvider;
import com.customer.helper.MailApi;
import com.customer.model.LoginParty;
import com.customer.model.PartyCustomer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class RegisterServ extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();

        PartyCustomer partyC = new PartyCustomer();
        LoginParty partyL = new LoginParty();

        partyC.setFname( req.getParameter("fname") );
        partyC.setLname(req.getParameter("lname"));
        partyC.setAddress( req.getParameter("address") );
        partyC.setCity( req.getParameter("city"));
        partyC.setState( req.getParameter("state"));
        partyC.setZip(req.getParameter("zip"));
        partyC.setCountry(req.getParameter("country"));
        partyC.setPhone( req.getParameter("phone") );

        partyL.setLoginPID(req.getParameter("email"));
        partyL.setPassword(req.getParameter("password"));


        PartyDao save = new PartyDao(ConnectionProvider.getConnection());
        Boolean Status = save.insertParty( partyC , partyL);
        if (Status) {
            String mailMessage = " You have successfully Signup on Hotwax enjoy leaning ";
            String mailSubject ="Hotwax auth";
            MailApi.sendMail(mailMessage , mailSubject , partyL.getLoginPID());
            out.print("done");
            HttpSession s = req.getSession();
            s.setAttribute("currentUser", partyL);


        } else {
            //do nothing that means either server-db internal error/user already existed
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            res.sendRedirect("index.jsp");

        } catch (IOException ex) {
            Logger.getLogger(RegisterServ.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
}