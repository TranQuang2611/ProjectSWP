/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author ACER
 */
public class Account {
    private int accountID;
    private String email;
    private String password;
    private boolean emailVeriFy;
    private Role role;
    private boolean status;

    public Account() {
    }

    public Account(int accountID) {
        this.accountID = accountID;
    }

    public Account(int accountID, String email, Role role, boolean status) {
        this.accountID = accountID;
        this.email = email;
        this.role = role;
        this.status = status;
    }
    
    
    public Account(int accountID, String email, String password, boolean emailVeriFy, Role role, boolean status) {
        this.accountID = accountID;
        this.email = email;
        this.password = password;
        this.emailVeriFy = emailVeriFy;
        this.role = role;
        this.status = status;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isEmailVeriFy() {
        return emailVeriFy;
    }

    public void setEmailVeriFy(boolean emailVeriFy) {
        this.emailVeriFy = emailVeriFy;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
