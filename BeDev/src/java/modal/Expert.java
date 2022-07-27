/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author admin
 */
public class Expert {  
    private int expertID;
    private String expertName;
    private String img;
    private String phone;
    private String description;
    private Account account;

    public Expert() {
    }

    public Expert(int expertID) {
        this.expertID = expertID;
    }

    public Expert(int expertID, String expertName, String img) {
        this.expertID = expertID;
        this.expertName = expertName;
        this.img = img;
    }
    
    public Expert(String expertName, String img, String phone, String description, Account account) {
        this.expertName = expertName;
        this.img = img;
        this.phone = phone;
        this.description = description;
        this.account = account;
    }

    public Expert(String expertName, String img, String phone, String description) {
        this.expertName = expertName;
        this.img = img;
        this.phone = phone;
        this.description = description;
    }
    
    public Expert(int expertID, String expertName, String img, String description) {
        this.expertID = expertID;
        this.expertName = expertName;
        this.img = img;
        this.phone = phone;
        this.description = description;
    }
    
    public Expert(int expertID, String expertName, String img, String phone, String description) {
        this.expertID = expertID;
        this.expertName = expertName;
        this.img = img;
        this.phone = phone;
        this.description = description;
    }
     
    
    public int getExpertID() {
        return expertID;
    }

    public void setExpertID(int expertID) {
        this.expertID = expertID;
    }

    public String getExpertName() {
        return expertName;
    }

    public void setExpertName(String expertName) {
        this.expertName = expertName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
    
    
    
}
