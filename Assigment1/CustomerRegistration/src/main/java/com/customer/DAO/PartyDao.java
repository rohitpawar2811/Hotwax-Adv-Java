package com.customer.DAO;

import com.customer.model.LoginParty;
import com.customer.model.PartyCustomer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PartyDao {

    private Connection con;

    public PartyDao(Connection con){
        this.con = con;
    }

    public boolean insertParty(PartyCustomer p, LoginParty l){
        boolean b = false;
        String q = "insert into Party( ) values(?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(q);


            ps.executeUpdate();
            b = true;
        } catch (SQLException ex) {
            Logger.getLogger(PartyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }






}
