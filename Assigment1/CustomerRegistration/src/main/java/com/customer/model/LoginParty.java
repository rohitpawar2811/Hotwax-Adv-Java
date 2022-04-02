package com.customer.model;

public class LoginParty {
    private int partyID;
    private String loginPID;
    private String password;


    public LoginParty(int partyID, String loginPID, String password) {
        this.partyID = partyID;
        this.loginPID = loginPID;
        this.password = password;
    }

    public LoginParty() {
    }

    @Override
    public String toString() {
        return "loginParty{" +
                "partyID=" + partyID +
                ", loginPID='" + loginPID + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public int getPartyID() {
        return partyID;
    }

    public void setPartyID(int partyID) {
        this.partyID = partyID;
    }

    public String getLoginPID() {
        return loginPID;
    }

    public void setLoginPID(String loginPID) {
        this.loginPID = loginPID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
