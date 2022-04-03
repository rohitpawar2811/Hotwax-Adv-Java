package com.customer.DAO;

import com.customer.model.LoginParty;
import com.customer.model.PartyCustomer;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
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

                 b=true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PartyDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }


    public LoginParty getUserByEmail(String userEmail){
        LoginParty user=null;

        try {
            String query="Select * from userlogin where userLoginId=? ";

            PreparedStatement  prepareStatement=con.prepareStatement(query);
            prepareStatement.setString(1,userEmail);


            ResultSet rs= prepareStatement.executeQuery();
            if(rs.next()){
                user=new LoginParty();
                user.setPartyID(rs.getInt(3));
                user.setLoginPID(rs.getString("userLoginId"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;

    }

    public ArrayList<HashMap<LoginParty,PartyCustomer>> getUsers(){
        ArrayList<HashMap<LoginParty,PartyCustomer>> userList = new ArrayList<>();

        try {
            String query = " Select party.partyId,party.fname,party.lname,party.address,party.city,party.zip,party.state,party.country,party.phone,userLogin.UserLoginId,userLogin.password from userlogin natural join party ";
            PreparedStatement  prepareStatement = con.prepareStatement(query);

            ResultSet rs = prepareStatement.executeQuery();

            while(rs.next()){
                HashMap<LoginParty,PartyCustomer> map = new HashMap<>();

                LoginParty user = new LoginParty();
                PartyCustomer user2 = new PartyCustomer();

                user.setPartyID(rs.getInt(1));
                user.setLoginPID(rs.getString(10));
                user.setPassword(rs.getString(11));
                user2.setPid(1);
                user2.setFname(rs.getString(2));
                user2.setLname(rs.getString(3));
                user2.setAddress(rs.getString(4));
                user2.setCity(rs.getString(5));
                user2.setZip(rs.getString(6));
                user2.setState(rs.getString(7));
                user2.setCountry(rs.getString(8));
                user2.setPhone(rs.getString(9));

                map.put(user,user2);
                userList.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;

    }


    public Boolean UpdateParty(PartyCustomer party, LoginParty login) {
         Boolean b=false;
        try{
        String query = "update Party Set fname=?,lname=?,address=?,city=?,zip=?,state=?,country=?,phone=? Where partyId=? ";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, party.getFname());
        ps.setString(2, party.getLname());
        ps.setString(3 , party.getAddress());
        ps.setString(4 , party.getCity());
        ps.setString(5 , party.getZip());
        ps.setString(6 , party.getState());
        ps.setString(7 , party.getCountry());
        ps.setString(8 , party.getPhone());
        ps.setInt(9,login.getPartyID());
        ps.executeUpdate();


        query ="update userlogin Set userLoginId=?,password=? Where PartyId=?";
        ps = con.prepareStatement(query);
        ps.setString(1, login.getLoginPID());
        ps.setString(2 , login.getPassword());
        ps.setInt(3 ,login.getPartyID());

        ps.executeUpdate();
        ps.close();
        b=true;
    } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;

    }

    public Boolean deleteParty(int pid) {
        Boolean b=false;
        try {
            String query = " delete from userlogin Where partyId=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ps.executeUpdate();


            query = " delete from Party Where partyId=? ";
            ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ps.executeUpdate();


            ps.close();
            b=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
         return b;
    }

}
