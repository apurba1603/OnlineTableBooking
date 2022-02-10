/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.tablebooking.beans.Admin;
import com.tablebooking.beans.Reservations;
import com.tablebooking.beans.User;
import com.tablebooking.dao.AdminServices;
import com.tablebooking.dao.ReservationServices;
import com.tablebooking.dao.UserServices;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author amankumar
 */
public class AdminActions extends ActionSupport {
    //private static Logger log = Logger.getLogger(UserAction.class);

    private String userName;
    private String password;
    private String firstName;
    private String lastName;
    private String dob;
    private String address;
    private String email;
    private String phoneNumber;
    private boolean validUser;
    private boolean status;
    private int reservationId;
    private int restaurantId;
    private String customerId;
    private String customerName;
    private int bookedTable;
    private int orderId;
    private String bookingDate;
    private String restaurantName;
    private int person;
    private String submitType;
    private ResultSet rs = null;
    private User user = null;
    private List<User> userList = null;
    private boolean noData = false;
    private ReservationServices reservationServices = null;
    private List<Reservations> reservationList = null;
    private UserServices userServices = null;
    private String login;
    
    

    private String msg = "";

    private int ctr = 0;
    
    
    public String showUsers() throws Exception {
        setUserServices(new UserServices());
        try {
            setUserList(new ArrayList<User>());
            setUserList(getUserServices().report());

            if (!userList.isEmpty()) {
                setNoData(false);
                System.out.println("Users retrieve = " + getUserList().size());
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "REPORT";
    }
    
    public String showAllReservations() throws Exception {
        setReservationServices(new ReservationServices());
        try {
            setReservationList(new ArrayList<Reservations>());
            setReservationList(getReservationServices().showAllReservations());
            System.out.println("in action: "+customerName);

            if (!reservationList.isEmpty()) {
                setNoData(false);
                System.out.println("Reservations retrieve = " + getReservationList().size());
                System.out.println("setting nodata=false");
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "RESERVATIONS";
    }



    

    
//
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
     * @return the validUser
     */
    public boolean isValidUser() {
        return validUser;
    }

    /**
     * @param validUser the validUser to set
     */
    public void setValidUser(boolean validUser) {
        this.validUser = validUser;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
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

//    /**
//     * @return the user
//     */
//    public User getUser() {
//        return user;
//    }
//
//    /**
//     * @param user the user to set
//     */
//    public void setUser(User user) {
//        this.user = user;
//    }
//
//    /**
//     * @return the userList
//     */
//    public List<User> getUserList() {
//        return userList;
//    }
//
//    /**
//     * @param userList the userList to set
//     */
//    public void setUserList(List<User> userList) {
//        this.userList = userList;
//    }
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
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    


    /**
     * @return the userList
     */
    public List<User> getUserList() {
        return userList;
    }

    /**
     * @param userList the userList to set
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
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

    /**
     * @return the userServices
     */
    public UserServices getUserServices() {
        return userServices;
    }

    /**
     * @param userServices the userServices to set
     */
    public void setUserServices(UserServices userServices) {
        this.userServices = userServices;
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
    public String getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(String customerId) {
        this.customerId = customerId;
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

}
