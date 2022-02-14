package com.tablebooking.actions;

import com.tablebooking.beans.Menu;
import com.tablebooking.beans.Reservations;
import com.tablebooking.beans.User;
import com.tablebooking.dao.OrderServices;
import com.tablebooking.dao.ReservationServices;
import com.tablebooking.dao.UserServices;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Apu
 */
public class UserAction implements SessionAware {
    private static Logger log = Logger.getLogger(UserAction.class);
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
    private String submitType;
    private ResultSet rs = null;
    private User user = null;
    private List<User> userList = null;
    private boolean noData = false;
    private ReservationServices reservationServices = null;
    private List<Reservations> reservationList = null;
    private List<Menu> orderList = null;
    private int reservationId;
    private Reservations reservation = null;
    private int restaurantId;
    private int customerId;
    private String customerName;
    private int bookedTable;
    private int orderId;
    private String bookingDate;
    private String restaurantName;
    private int person;

    private String msg = "";
    private UserServices userServices = null;
    private int ctr = 0;

    private SessionMap<String, Object> sessionMap;

    public String registerUser() throws Exception {
        setUserServices(new UserServices());

        try {
            setCtr(getUserServices().registerUser(getUserName(), getPassword(), getFirstName(), getLastName(), getEmail(), getPhoneNumber()));
            if (getCtr() > 0) {
                setMsg("Registration Successfull");
            } else {
                setMsg("Some error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("This is log for registerUser() method");
        return "REGISTER";
    }

    public String userLogin() throws Exception {
        UserServices dao = new UserServices();
        String login;
        User myUser = new User();
        myUser.setUserName(getUserName());
        myUser.setPassword(getPassword());

        User validUser = UserServices.validateLoginCredentials(myUser);
        try {
            System.out.println("Role=" + validUser.isUserRole()) ;
            if (validUser.isValidUser()) {
                if (validUser.isUserRole()) {
                    reservationServices = new ReservationServices();
                    setUserName(validUser.getUserName());
                    setPassword(validUser.getPassword());
                    setFirstName(validUser.getFirstName());
                    setReservationList(new ArrayList<Reservations>());
                    setReservationList(reservationServices.showAllReservations());
                    System.out.println("91: "+reservationList);
                    login = "ADMINLOGIN";
                    System.out.println("ADMINLOGIN");

                } else {
                    getSessionMap().put("User", validUser);
                    setUserName(validUser.getUserName());
                    setPassword(validUser.getPassword());
                    setFirstName(validUser.getFirstName());
                    setLastName(validUser.getLastName());
                    setEmail(validUser.getEmail());
                    setPhoneNumber(validUser.getPhoneNumber());
                    login = "USERLOGIN";
                    System.out.println("USERLOGIN");
                }

            } else {
                setMsg("Login failed");
                login = "LOGINFAILED";
                System.out.println("LOGINFAILED");
            }

        } catch (Exception e) {
            e.printStackTrace();
            login = "ERROR";
        }
        log.info("This is log4j");
        return login;
    }
    
    public String userProfile() throws Exception {
        
        String valid;
        
//        System.out.println("in userProfile "+user.getUserName());

        try {
            User user = (User) sessionMap.get("User");
        System.out.println("user:" + user);
            System.out.println("in try block user:" + user.isValidUser());
            if (user != null && user.isValidUser()) {
                setUserName(user.getUserName());
                setPassword(user.getPassword());
                setFirstName(user.getFirstName());
                setLastName(user.getLastName());
                setEmail(user.getEmail());
                setPhoneNumber(user.getPhoneNumber());
                setReservationList(new ArrayList<Reservations>());
                setReservationServices(new ReservationServices());
                setReservationList(getReservationServices().fetchReservationDetails(getUserName()));
                if (!reservationList.isEmpty()) {
                    setNoData(false);
                    System.out.println("Reservationt retrieve = " + getReservationList().size());
                    System.out.println("setting nodata=false");
                } else {
                    setNoData(true);
                }
                valid = "VALID";
            } else {
                setMsg("Login failed");
                valid = "INVALID";
            }

        } catch (Exception e) {
            e.printStackTrace();
            valid = "INVALID";
        }
        System.out.println(valid);
        log.info("This is log4j");
        return valid;
    }
    
    public String showOrders() throws Exception {
        OrderServices orders = new OrderServices();
        setOrderList(orders.showOrders(reservationId));
        this.userProfile();
        return "VALID";
    }

    public String logout() throws Exception {
        System.out.println("Logout");
        try {
            System.out.println("Logout");
            if (getSessionMap() != null) {
                getSessionMap().invalidate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("This is log4j");
        return "LOGOUT";
    }

    public String deleteUser() throws Exception {
        UserServices dao = new UserServices();
        try {
            int isDeleted = dao.deleteUserDetails(getUserName());
            if (isDeleted > 0) {
                setMsg("Record deleted successfully");
            } else {
                setMsg("Some error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "DELETE";
    }

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

    public String updateUser() throws Exception {
        UserServices dao = new UserServices();
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        User user = (User) session.getAttribute("User");
        System.out.println("Update user method");
        try {
            int i = dao.updateUserDetails(user.getUserName(), getDob(), getPassword(), getFirstName(), getLastName(), getAddress(), getPhoneNumber());
            if (i > 0) {
                User myUser = new User();
                myUser.setUserName(user.getUserName());
                myUser.setPassword(getPassword());
                User validUser = UserServices.validateLoginCredentials(myUser);
                getSessionMap().put("User", validUser);
                setUserName(validUser.getUserName());
                setPassword(validUser.getPassword());
                setFirstName(validUser.getFirstName());
                setLastName(validUser.getLastName());
                setEmail(validUser.getEmail());
                setPhoneNumber(validUser.getPhoneNumber());
                System.out.println("Update page");
                setMsg("Record Updated Successfuly");
            } else {
                setMsg("error");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "UPDATE";
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

    @Override
    public void setSession(Map<String, Object> map) {
        setSessionMap((SessionMap<String, Object>) (SessionMap) map); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
     * @return the reservation
     */
    public Reservations getReservation() {
        return reservation;
    }

    /**
     * @param reservation the reservation to set
     */
    public void setReservation(Reservations reservation) {
        this.reservation = reservation;
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
     * @return the orderList
     */
    public List<Menu> getOrderList() {
        return orderList;
    }

    /**
     * @param orderList the orderList to set
     */
    public void setOrderList(List<Menu> orderList) {
        this.orderList = orderList;
    }
}
