package com.customer.DAO;

import com.customer.model.LoginParty;
import com.customer.model.PartyCustomer;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PartyDao {

    private Connection con;

    public PartyDao(Connection con){
        this.con = con;
    }

    public boolean insertParty(PartyCustomer party, LoginParty login){
        boolean b = true;
        try {
            // checking if user already registered or not
            System.out.println("hii"+party+"\n"+login);
            PreparedStatement prepareS;
            String query = "select partyId from Userlogin where userLoginId = ? ";
            prepareS = con.prepareStatement(query);
            prepareS.setString(1,login.getLoginPID());
            ResultSet getData = prepareS.executeQuery();
            if(getData.next()){
                getData.close();
                prepareS.close();
                con.close();
                return  false;
            }
            else{
                 getData.close();

                 query = "insert into Party(fname,lname,address,city,zip,state,country,phone) values(?,?,?,?,?,?,?,?)";
                 PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                 ps.setString(1, party.getFname());
                 ps.setString(2, party.getLname());
                 ps.setString(3 , party.getAddress());
                 ps.setString(4 , party.getCity());
                 ps.setString(5 , party.getZip());
                 ps.setString(6 , party.getState());
                 ps.setString(7 , party.getCountry());
                 ps.setString(8 , party.getPhone());

                 ps.executeUpdate();
                 ResultSet getDataRSet =  ps.getGeneratedKeys();
                 getDataRSet.next();

//               Auto-genrated key
                 int partId = getDataRSet.getInt(1);

                 query ="insert into userlogin (userLoginId,password,partyId) values (?,?,?)";
                 ps = con.prepareStatement(query);
                 ps.setString(1, login.getLoginPID());
                 ps.setString(2 , login.getPassword());
                 ps.setInt(3 ,partId);

                 ps.executeUpdate();
                 getDataRSet.close();
                 ps.close();
                 con.close();
                 b=true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PartyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }






}
