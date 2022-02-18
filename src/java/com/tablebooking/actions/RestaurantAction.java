/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts2/ActionSupport.java to edit this template
 */
package com.tablebooking.actions;

import com.tablebooking.beans.Menu;
import com.tablebooking.beans.Restaurant;
import com.tablebooking.beans.User;
import com.tablebooking.dao.MenuServices;
import com.tablebooking.dao.ReservationServices;
import com.tablebooking.dao.RestaurantServices;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Apu
 */
public class RestaurantAction implements SessionAware {

    private String userName;
    private String firstName;
    private String lastName;
    private String address;
    private String email;
    private String phoneNumber;
    private int restaurantId;
    private String restaurantName;
    private String location;
    private String timings;
    private double approxCost;
    private String submitType;
    private int reservationId;
    private int customerId;
    private MenuServices menuServices = null;
    private List<Menu> menuList = null;
    private String bookingDate;
    private String time;
    private int bookedTable;
    private int orderId;
    private String customerName;
    private int person;
    private ResultSet rs = null;
    private Restaurant restaurant = null;
    private boolean noData = false;
    private RestaurantServices restaurantServices = null;
    private ReservationServices reservationServices = null;
    private List<Restaurant> restaurantList = null;
    private String name, password;
    private SessionMap<String, Object> sessionMap;
    private User user=null;

    private String msg = "";
    private int ctr = 0;

    public String showRestaurants() throws Exception {
//        System.out.println("Restaurant Id showRestaurants"+getRestaurantId());
        setRestaurantServices(new RestaurantServices());
        try {
            setRestaurantList(new ArrayList<Restaurant>());
            setRestaurantList(restaurantServices.showAllRestaurants());

            if (!restaurantList.isEmpty()) {
                setNoData(false);
                System.out.println("Restaurant retrieve = " + getRestaurantList().size());
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "RESTAURANTS";
    }

    public String bookTable() throws Exception {

        try {
            restaurantServices = new RestaurantServices();
            System.out.println("Restaurant id :" + restaurantId);
            
            sessionMap.put("restaurantId", getRestaurantId());
            Restaurant restaurant = restaurantServices.fetchRestaurantDetails(getRestaurantId());
            System.out.println("restaurant=" + restaurant);
            if (restaurant != null) {
                setRestaurantName(restaurant.getRestaurantName());
                setLocation(restaurant.getLocation());
                setTimings(restaurant.getTimings());
                setApproxCost(restaurant.getApproxCost());
                sessionMap.put("restaurant", restaurant);
                System.out.println("Restaurant name :" + restaurantName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "RESTAURANT";
    }
    
    public String bookTableAndOrder() throws Exception {

        try {
            restaurantServices = new RestaurantServices();
            setRestaurantId((int)sessionMap.get("restaurantId"));
            user=(User)sessionMap.get("User");
            System.out.println("Restaurant id :" + restaurantId);
            
            Restaurant restaurant = restaurantServices.fetchRestaurantDetails(getRestaurantId());
            System.out.println("restaurant=" + restaurant);
            if (restaurant != null) {
                setRestaurantName(restaurant.getRestaurantName());
                setLocation(restaurant.getLocation());
                setTimings(restaurant.getTimings());
                setApproxCost(restaurant.getApproxCost());
                sessionMap.put("restaurant", restaurant);
                setUserName(user.getUserName());
                setFirstName(user.getFirstName());
                setLastName(user.getLastName());
                setEmail(user.getEmail());
                setPhoneNumber(user.getPhoneNumber());
                System.out.println("Restaurant name :" + restaurantName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "RESTAURANT";
    }
    
    public String menu() throws Exception {
        System.out.println("Menu print");
        setMenuServices(new MenuServices());
        try {
            setMenuList(new ArrayList<Menu>());
            setMenuList(getMenuServices().showMenu((int)sessionMap.get("restaurantId")));
            setRestaurantName(((Restaurant)sessionMap.get("restaurant")).getRestaurantName());
            if (!menuList.isEmpty()) {
                setNoData(false);
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "MENU";
    }

    

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
     * @return the submitType
     */
    public String getSubmitType() {
        return submitType;
    }

    /**
     * @param submitType the submitType to set
     */
    public void setSubmitType(String submitType) {
        this.submitType = submitType;
    }

    /**
     * @return the rs
     */
    public ResultSet getRs() {
        return rs;
    }

    /**
     * @param rs the rs to set
     */
    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    /**
     * @return the restaurant
     */
    public Restaurant getRestaurant() {
        return restaurant;
    }

    /**
     * @param restaurant the restaurant to set
     */
    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    /**
     * @return the noData
     */
    public boolean isNoData() {
        return noData;
    }

    /**
     * @param noData the noData to set
     */
    public void setNoData(boolean noData) {
        this.noData = noData;
    }

    /**
     * @return the restaurantServices
     */
    public RestaurantServices getRestaurantServices() {
        return restaurantServices;
    }

    /**
     * @param restaurantServices the restaurantServices to set
     */
    public void setRestaurantServices(RestaurantServices restaurantServices) {
        this.restaurantServices = restaurantServices;
    }

    /**
     * @return the restaurantList
     */
    public List<Restaurant> getRestaurantList() {
        return restaurantList;
    }

    /**
     * @param restaurantList the restaurantList to set
     */
    public void setRestaurantList(List<Restaurant> restaurantList) {
        this.restaurantList = restaurantList;
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

    /**
     * @return the reservationId
     */
    public int getReservationId() {
        return reservationId;
    }

    /**
     * @param reservationId the reservationId to set
     */
    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    /**
     * @return the customerId
     */
    public int getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    /**
     * @return the bookingDate
     */
    public String getBookingDate() {
        return bookingDate;
    }

    /**
     * @param bookingDate the bookingDate to set
     */
    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * @return the bookedTable
     */
    public int getBookedTable() {
        return bookedTable;
    }

    /**
     * @param bookedTable the bookedTable to set
     */
    public void setBookedTable(int bookedTable) {
        this.bookedTable = bookedTable;
    }

    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the customerName
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * @return the person
     */
    public int getPerson() {
        return person;
    }

    /**
     * @param person the person to set
     */
    public void setPerson(int person) {
        this.person = person;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the reservationServices
     */
    public ReservationServices getReservationServices() {
        return reservationServices;
    }

    /**
     * @param reservationServices the reservationServices to set
     */
    public void setReservationServices(ReservationServices reservationServices) {
        this.reservationServices = reservationServices;
    }

    /**
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * @return the ctr
     */
    public int getCtr() {
        return ctr;
    }

    /**
     * @param ctr the ctr to set
     */
    public void setCtr(int ctr) {
        this.ctr = ctr;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap) map; // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the menuServices
     */
    public MenuServices getMenuServices() {
        return menuServices;
    }

    /**
     * @param menuServices the menuServices to set
     */
    public void setMenuServices(MenuServices menuServices) {
        this.menuServices = menuServices;
    }

    /**
     * @return the menuList
     */
    public List<Menu> getMenuList() {
        return menuList;
    }

    /**
     * @param menuList the menuList to set
     */
    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

}
