/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.asd.model;

/**
 *
 * @author clint
 */
public class Product {
	private int id;
	private String name;
	private Double price;	
	private String receivedDate;
	private String region;
	private String description;

    public Product() {
    }

    public Product(int id, String name, Double price, String receivedDate, String region, String description) {
        this.id = id;
        this.name = name;
        this.price = price;        
        this.receivedDate = receivedDate;
        this.region = region;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }    

    public String getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(String receivedDate) {
        this.receivedDate = receivedDate;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", receivedDate=" + receivedDate + ", region=" + region + ", description=" + description + '}';
    }

}