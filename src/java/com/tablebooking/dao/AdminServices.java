/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Admin;
import com.tablebooking.core.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author amankumar
 */
public class AdminServices {

    public int registerAdmin(String userName, String password, String firstName, String lastName,
            String email, String phoneNumber) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO admin VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, email);
            ps.setString(6, phoneNumber);
            ps.setInt(7, 1);
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

    public Admin validateLoginCredentials(String userName, String password) throws SQLException {
        ResultSet rs = null;
        Connection con = null;
        Admin admin=null;
        
        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM admin WHERE userName= ? AND password= ? AND status= 1;";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("userName = " + userName);
            ps.setString(1, userName);
            ps.setString(2, password);
            System.out.println("Select SQL = " + ps);
            admin = new Admin();
            rs = ps.executeQuery();

            if (rs.next()) {
//                admin = new Admin();
                admin.setUserName(rs.getString("userName"));
                admin.setPassword(rs.getString("password"));
                admin.setFirstName(rs.getString("firstName"));
                admin.setLastName(rs.getString("lastName"));
                admin.setEmail(rs.getString("email"));
                admin.setPhoneNumber(rs.getString("phoneNumber"));
                admin.setStatus(true);
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (con != null) {
                con.close();
            }
        }
        return admin;
    }

    public List adminReport() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Admin> adminList = new ArrayList<>();
        try {
            String sql = "SELECT userName, password, firstName, "
                    + "lastName, email, phoneNumber "
                    + "FROM users WHERE userRole=0;";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Admin admin = new Admin();
                admin.setUserName(rs.getString("userName"));
                admin.setPassword(rs.getString("password"));
                admin.setFirstName(rs.getString("firstName"));
                admin.setLastName(rs.getString("lastName"));
                admin.setEmail(rs.getString("email"));
                admin.setPhoneNumber(rs.getString("phoneNumber"));

                adminList.add(admin);
            }
            return adminList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public Admin fetchAdminDetails(String userName) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        Admin admin = new Admin();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT userName, password, firstName, lastName, "
                    + "email, phoneNumber FROM users WHERE userName=?";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("userName = " + userName);
            ps.setString(1, userName);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {

                admin.setUserName(rs.getString("userName"));
                admin.setPassword(rs.getString("password"));
                admin.setFirstName(rs.getString("firstName"));
                admin.setLastName(rs.getString("lastName"));
                admin.setEmail(rs.getString("email"));
                admin.setPhoneNumber(rs.getString("phoneNumber"));

            }
            return admin;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateAdminDetails(String userName, String password, String firstName, String lastName,
            String email, String phoneNumber) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE admin SET password = ?, firstName = ?, "
                    + "lastName = ?, email = ?, phoneNumber = ? "
                    + "WHERE userName = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, phoneNumber);
            ps.setString(6, userName);
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

    public int deleteAdminDetails(String userName) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE admin SET status = 0 WHERE userName = ?";
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

}
