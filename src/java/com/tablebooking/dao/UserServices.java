/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tablebooking.dao;

import com.tablebooking.beans.User;
import com.tablebooking.core.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Apu
 */
public class UserServices {

    public int registerUser(String userName, String password) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO users (userName,password) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            System.out.println("SQL for insert=" + ps);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public User registerGoogleUser(String email, String firstName, String lastName) throws Exception {
        ResultSet rs = null;
        User user = this.fetchGoogleUserDetails(email);
        int i = 0;
        Connection con = null;
        String userName = email;

        try {
            if (user==null) {

                 con = ConnectionManager.getConnection();
                    String sql = "INSERT INTO users (userName, firstName, lastName, email) VALUES (?,?,?,?)";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, email);
                    ps.setString(2, firstName);
                    ps.setString(3, lastName);
                    ps.setString(4, email);
                    System.out.println("SQL for insert=" + ps);
                    i = ps.executeUpdate();
                    user = this.fetchGoogleUserDetails(email);
                     
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public User fetchGoogleUserDetails(String userName) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        User user = null;

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM users WHERE userName= ? AND status= 1;";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("userName = " + userName);
            ps.setString(1, userName);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setDob(rs.getString("dob"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setStatus(true);
                user.setValidUser(true);
                user.setUserRole(rs.getBoolean("userRole"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public List report() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<User> userList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users WHERE userRole=0";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                User user = new User();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setStatus(rs.getBoolean("status"));

                userList.add(user);
            }
            return userList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public User fetchUserDetails(String userName) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        User user = new User();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT userName, password, firstName, lastName, "
                    + "dob, address, email, phoneNumber FROM users WHERE userName=?";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("userName = " + userName);
            ps.setString(1, userName);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {

                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setDob(rs.getString("dob"));
                user.setDob(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));

            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateUserDetails(String userName, String dob, String email, String firstName, String lastName,
            String address, String phoneNumber) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE users SET\n"
                    + "firstName = ?,\n"
                    + "lastName = ?,\n"
                    + "dob = ?,\n"
                    + "address = ?,\n"
                    + "email = ?, \n"
                    + "phoneNumber = ?\n"
                    + "WHERE userName = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, dob);
            ps.setString(4, address);
            ps.setString(5, email);
            ps.setString(6, phoneNumber);
            ps.setString(7, userName);
            System.out.println("Select SQL = " + ps);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int deleteUserDetails(String userName) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE users SET status = 0 WHERE userName = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public static User validateLoginCredentials(User user) throws SQLException {
        ResultSet rs = null;
        Connection con = null;
        String userName = user.getUserName();
        String password = user.getPassword();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM users WHERE userName= ? AND password= ? AND status= 1;";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("userName = " + userName);
            ps.setString(1, userName);
            ps.setString(2, password);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setDob(rs.getString("dob"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setStatus(true);
                user.setValidUser(true);
                user.setUserRole(rs.getBoolean("userRole"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

}
