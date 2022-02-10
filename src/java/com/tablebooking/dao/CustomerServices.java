/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tablebooking.dao;

import com.tablebooking.beans.Customer;
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
public class CustomerServices {
    
    public int registerCustomer(int customerId, String customerName, String customerAddrees, 
            String email, String phoneNumber) throws Exception { 
         int i = 0;
        Connection con = null;
         try {
        con = ConnectionManager.getConnection();
         String sql = "SELECT * FROM customers";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, customerId);
         ps.setString(2, customerName);
         ps.setString(3, customerAddrees);
         ps.setString(4, email);
         ps.setString(5, phoneNumber);
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
    public List report() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Customer> customerList = new ArrayList<>();
        try {
            String sql = "SELECT customerId, customerName, customerAddrees, email, phoneNumber FROM customers";
            con = ConnectionManager.getConnection();
            System.out.println("Connection is " + con);
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customerId"));
                customer.setCustomerName(rs.getString("customerName"));
                customer.setCustomerAddrees(rs.getString("customerAddrees"));
                customer.setEmail(rs.getString("email"));
                customer.setPhoneNumber(rs.getInt("phoneNumber"));
                customerList.add(customer);
            }
            return customerList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
     public Customer fetchCustomerDetails(Integer customerId) throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
         Customer customer = new Customer();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT customerId, customerName, CustomerAddrees, "
                    + "email, phoneNumber FROM customers WHERE customerId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("customerId = " + customerId);
            ps.setInt(1, customerId);
            System.out.println("Select SQL = " + ps);

            rs = ps.executeQuery();
            if (rs.next()) {

               customer.setCustomerId(rs.getInt("customerId"));
               customer.setCustomerName(rs.getString("customerName"));
               customer.setCustomerAddrees(rs.getString("CustomerAddrees"));
                customer.setEmail(rs.getString("email"));
                customer.setPhoneNumber(rs.getInt("phoneNumber"));

            }
            return customer;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateCustomerDetails(Integer customerId, String customerName, String customerAddrees, 
            String email, String phoneNumber) throws SQLException, Exception {

        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE customers SET customerName = ?, customerAddrees = ?, "
                    + " email = ?, phoneNumber = ? "
                    + "WHERE customerId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,customerName );
            ps.setString(2, customerAddrees);
            ps.setString(4, email);
            ps.setString(5, phoneNumber);
            ps.setInt(6, customerId);
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

    public int deleteCustomerDetails(Integer customerId) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE customers SET status = 0 WHERE customerId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customerId);
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

    
         
   
    
