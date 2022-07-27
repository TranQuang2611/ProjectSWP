
/*
 * Copyright(C) 2005, FPT university
 * ...
 * ...
 *
 * Record of change:
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2018-09-10      1.0                 HuyTQ           First Implement
 */
package modal;

/**
 *
 * @author ADMIN
 */
public class Admin {
    private  Account account;
    private  String name;
    private String imgURL;
    private String phone;

    public Admin() {
    }

    public Admin(Account account, String name, String imgURL, String phone) {
        this.account = account;
        this.name = name;
        this.imgURL = imgURL;
        this.phone = phone;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
}
