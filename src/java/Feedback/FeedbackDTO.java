/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Feedback;

/**
 *
 * @author ADMIN
 */
public class FeedbackDTO {
    private String id;
    private String orderID;
    private String feedback;

    public FeedbackDTO() {
    }

    public FeedbackDTO(String id, String orderID, String feedback) {
        this.id = id;
        this.orderID = orderID;
        this.feedback = feedback;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    
}
