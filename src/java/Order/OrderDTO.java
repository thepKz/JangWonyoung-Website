/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package Order;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {
    private String id;
    private String userID;
    private String address;
    private int phone;
    private String status;
    private int totalPrice;

    public OrderDTO() {
    }

    public OrderDTO(String id, String userID, String address, int phone, String status,
            int totalPrice) {
        this.id = id;
        this.userID = userID;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

}
