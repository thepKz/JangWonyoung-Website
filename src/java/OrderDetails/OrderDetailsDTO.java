/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OrderDetails;

/**
 *
 * @author ADMIN
 */
public class OrderDetailsDTO {
    private String orderID;
    private String productID;

    public OrderDetailsDTO() {
    }

    public OrderDetailsDTO(String orderID, String productID) {
        this.orderID = orderID;
        this.productID = productID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

}
