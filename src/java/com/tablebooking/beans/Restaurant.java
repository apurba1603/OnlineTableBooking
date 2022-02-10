/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tablebooking.beans;

/**
 *
 * @author Lenovo
 */
public class Restaurant {
    
    private int restaurantId;
    private String restaurantName;
    private String location;
    private String timings;
    private double approxCost;

    /**
     * @return the restaurantId
     */
    public int getRestaurantId() {
        return restaurantId;
    }

    /**
     * @param restaurantId the restaurantId to set
     */
    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    /**
     * @return the restaurantName
     */
    public String getRestaurantName() {
        return restaurantName;
    }

    /**
     * @param restaurantName the restaurantName to set
     */
    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the timings
     */
    public String getTimings() {
        return timings;
    }

    /**
     * @param timings the timings to set
     */
    public void setTimings(String timings) {
        this.timings = timings;
    }

    /**
     * @return the approxCost
     */
    public double getApproxCost() {
        return approxCost;
    }

    /**
     * @param approxCost the approxCost to set
     */
    public void setApproxCost(double approxCost) {
        this.approxCost = approxCost;
    }


}
