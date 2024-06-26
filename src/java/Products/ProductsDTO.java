/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class ProductsDTO implements Serializable{

    private String id;
    private String name;
    private int price;
    private String category;
    private int amount;
    private String color;
    private String type;
    private String size;
    private int status;
    private String picture;

    public ProductsDTO() {
    }

    public ProductsDTO(String id, String name, int price, String category, int amount, String color, String type, String size, int status, String picture) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.category = category;
        this.amount = amount;
        this.color = color;
        this.type = type;
        this.size = size;
        this.status = status;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

}
