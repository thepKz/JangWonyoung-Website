/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

/**
 *
 * @author ducco
 */
public class UserDTO {


    private String username;
    private String password;
    private String mail;
    private int status;

    public UserDTO() {
    }

    public UserDTO(String username, String password, String mail, int status) {
        this.username = username;
        this.password = password;
        this.mail = mail;
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getMail() {
        return mail;
    }

    public int getStatus() {
        return status;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
