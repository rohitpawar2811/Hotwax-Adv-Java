package com.customer.controller;


import com.customer.DAO.PartyDao;
import com.customer.helper.ConnectionProvider;
import com.customer.model.LoginParty;
import com.customer.model.PartyCustomer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/updateServ")
public class UpdateServ extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();

        PartyCustomer partyC = new PartyCustomer();
        LoginParty partyL = new LoginParty();

        partyC.setFname(req.getParameter("fname"));
        partyC.setLname(req.getParameter("lname"));
        partyC.setAddress(req.getParameter("address"));
        partyC.setCity(req.getParameter("city"));
        partyC.setState(req.getParameter("state"));
        partyC.setZip(req.getParameter("zip"));
        partyC.setCountry(req.getParameter("country"));
        partyC.setPhone(req.getParameter("phone"));

        partyL.setLoginPID(req.getParameter("email"));
        partyL.setPassword(req.getParameter("password"));
        partyL.setPartyID(Integer.parseInt(req.getParameter("pid").trim()));


        PartyDao save = new PartyDao(ConnectionProvider.getConnection());
        Boolean Status = save.UpdateParty( partyC , partyL);
        if (Status) {
             out.print("done");

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
