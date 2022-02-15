/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.actions;

import com.tablebooking.beans.Menu;
import com.tablebooking.beans.Reservations;
import com.tablebooking.beans.Restaurant;
import com.tablebooking.beans.User;
import com.tablebooking.dao.MenuServices;
import com.tablebooking.dao.OrderServices;
import com.tablebooking.dao.ReservationServices;
import com.tablebooking.dao.RestaurantServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author amankumar
 */
public class ReservationAction implements SessionAware {

    private int restaurantId;
    private int productId;
    private int quantity;
    private String restaurantName;
    private String foodItems;
    private String location;
    private String timings;
    private double approxCost;
    private String submitType;
    private int reservationId;
    private int customerId;
    private String bookingDate;
    private double subTotal;
    private String time;
    private int bookedTable;
    private int orderId;
    private String customerName;
    private int person;
    private String email;
    private int cartSize;
    private Double price;
    private Double total;
    private String phoneNumber;
    private ResultSet rs = null;
    private Restaurant restaurant = null;
    private boolean noData = false;
    private RestaurantServices restaurantServices = null;
    private ReservationServices reservationServices = null;
    private List<Restaurant> restaurantList = null;
    private List<Reservations> reservationList = null;
    private ArrayList cart = null;
    private String name, password;
    private SessionMap<String, Object> sessionMap;
    private int ctr = 0;
    private String msg;

    public String showAllReservation() throws Exception {
        System.out.println("showAllReservation invoked");
        setReservationServices(new ReservationServices());
        try {
            setReservationList(new ArrayList<Reservations>());
            setReservationList(getReservationServices().showAllReservations());

            if (!reservationList.isEmpty()) {
                setNoData(false);
                System.out.println("Reservationt retrieve = " + getReservationList().size());
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "RESERVATIONS";
    }

    public String addProductToCart() throws IOException {
        System.out.println("Cart: " + productId);
        MenuServices item = new MenuServices();
        if (sessionMap.get("Cart") == null) {
//            ArrayList productInCart = new ArrayList<Menu>();
            HashMap<Integer, Menu> cart = new HashMap<>();

            try {
                Menu product = item.fetchProduct(productId);
//                productInCart.add(product);
                cart.put(productId, product);
                getSessionMap().put("Cart", cart);
            } catch (Exception ex) {
                Logger.getLogger(ReservationAction.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            HashMap cart = (HashMap) sessionMap.get("Cart");
            try {
                Menu product = item.fetchProduct(productId);
                cart.put(productId, product);
                getSessionMap().put("Cart", cart);
            } catch (Exception ex) {
                Logger.getLogger(ReservationAction.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        HashMap cart = (HashMap) sessionMap.get("Cart");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        out.println(cart.size());
        System.out.println("Items in cart=" + cart.size());
        System.out.println("Cart:111 " + sessionMap.get("Cart") + cart.size());
        System.out.println("Cart:123 cart size: " + cart.size());
        return "cart";
    }

    public String viewCart() throws Exception {
        String cartStatus = "EMPTYCART";
        setCart(new ArrayList<Menu>());
        ArrayList viewCart = new ArrayList<Menu>();
        HashMap productInCart = (HashMap) sessionMap.get("Cart");
        if (productInCart != null) {

            try {
                Iterator<Map.Entry<Integer, Menu>> itr = productInCart.entrySet().iterator();
                while (itr.hasNext()) {
                    Map.Entry<Integer, Menu> entry = itr.next();
                    viewCart.add(entry.getValue());
                }

                setCart(viewCart);
                int i = 0;
                while (i < cart.size()) {
                    Menu product = (Menu) cart.get(i);
                    subTotal += product.getPrice();
                    i++;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            sessionMap.put("Total", subTotal);
            cartStatus = "CART";
        }

        return cartStatus;
    }

    public String showReservations() throws Exception {
        setReservationServices(new ReservationServices());
        try {

            if (!reservationList.isEmpty()) {
                setNoData(false);
                System.out.println("Reservationt retrieve = " + getReservationList().size());
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "RESERVATIONS";
    }

    public String reservation() throws Exception {
        System.out.println("reservation()");
        Restaurant restaurant = (Restaurant) sessionMap.get("restaurant");
        setRestaurantId(restaurant.getRestaurantId());
        setRestaurantName(restaurant.getRestaurantName());
        setLocation(restaurant.getLocation());
        setApproxCost(restaurant.getApproxCost());
        System.out.println("restaurant name: " + (String) sessionMap.get("restaurantName"));
        System.out.println("restaurant name:" + restaurantName);
        User user = (User) sessionMap.get("User");
        setReservationServices(new ReservationServices());
        String returnValue = "";
        setRestaurant(new Restaurant());
        System.out.println("reservation: " + restaurantId + person + customerName);

        try {

            setCtr(getReservationServices().makeReservation(restaurantId, restaurantName,
                    user.getUserName(), getCustomerName(), getBookingDate(), getBookedTable(), getPerson(), 0, getEmail(), getPhoneNumber()));
            if (getCtr() > 0) {
                setMsg("Reservation Successfull");
            } else {
                setMsg("Some error");
            }
            returnValue = "RESERVED";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return returnValue;
    }

    public String reservationAndOrder() throws Exception {
        System.out.println("reservationAndOrder()");
        Restaurant restaurant = (Restaurant) sessionMap.get("restaurant");
        setRestaurantId(restaurant.getRestaurantId());
        setRestaurantName(restaurant.getRestaurantName());
        setLocation(restaurant.getLocation());
        setApproxCost(restaurant.getApproxCost());
        System.out.println("restaurant name: " + (String) sessionMap.get("restaurantName"));
        System.out.println("restaurant name:" + restaurantName);
        User user = (User) sessionMap.get("User");
        setReservationServices(new ReservationServices());
        String returnValue = "";
        setRestaurant(new Restaurant());
        System.out.println("reservation: " + restaurantId + person + customerName);
        setSubTotal((double)sessionMap.get("Total"));
        restaurant = (Restaurant)sessionMap.get("restaurant");
        setTotal(restaurant.getApproxCost()+subTotal);
        try {
            OrderServices createOrder = new OrderServices();
            int lastOrderId = createOrder.registerOrder(restaurantId, user.getUserName());
            ArrayList viewCart = new ArrayList<Menu>();
            HashMap productInCart = (HashMap) sessionMap.get("Cart");
            Iterator<Map.Entry<Integer, Menu>> itr = productInCart.entrySet().iterator();
            while (itr.hasNext()) {
                Map.Entry<Integer, Menu> entry = itr.next();
                viewCart.add(entry.getValue());
            }

            createOrder.orderItems(lastOrderId, viewCart);

            setCtr(getReservationServices().makeReservation(restaurantId, restaurantName,
                    user.getUserName(), getCustomerName(), getBookingDate(), getBookedTable(), getPerson(), lastOrderId, getEmail(), getPhoneNumber()));
            if (getCtr() > 0) {
                setMsg("Reservation Successfull");
            } else {
                setMsg("Some error");
            }
            sessionMap.remove("Cart");
            returnValue = "RESERVED";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return returnValue;
    }

    public String cancelReservation() throws Exception {
        ReservationServices dao = new ReservationServices();
        try {
            int isDeleted = dao.cancelReservation(reservationId);
            if (isDeleted > 0) {
                msg = "Record deleted successfully";
            } else {
                msg = "Some error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "CANCELLED";
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the sessionMap
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    /**
     * @param sessionMap the sessionMap to set
     */
    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    /**
     * @return the reservationList
     */
    public List<Reservations> getReservationList() {
        return reservationList;
    }

    /**
     * @param reservationList the reservationList to set
     */
    public void setReservationList(List<Reservations> reservationList) {
        this.reservationList = reservationList;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap) map; // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the foodItems
     */
    public String getFoodItems() {
        return foodItems;
    }

    /**
     * @param foodItems the foodItems to set
     */
    public void setFoodItems(String foodItems) {
        this.foodItems = foodItems;
    }

    /**
     * @return the cartSize
     */
    public int getCartSize() {
        return cartSize;
    }

    /**
     * @param cartSize the cartSize to set
     */
    public void setCartSize(int cartSize) {
        this.cartSize = cartSize;
    }

    /**
     * @return the price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return the cart
     */
    public ArrayList getCart() {
        return cart;
    }

    /**
     * @param cart the cart to set
     */
    public void setCart(ArrayList cart) {
        this.cart = cart;
    }

    /**
     * @return the subTotal
     */
    public double getSubTotal() {
        return subTotal;
    }

    /**
     * @param subTotal the subTotal to set
     */
    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    /**
     * @return the total
     */
    public Double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(Double total) {
        this.total = total;
    }

}
