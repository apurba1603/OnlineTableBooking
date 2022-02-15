/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Struts2/ActionSupport.java to edit this template
 */
package com.tablebooking.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.tablebooking.beans.Menu;
import com.tablebooking.dao.MenuServices;
import com.tablebooking.dao.ReservationServices;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author Apu
 */
public class MenuAction extends ActionSupport {
    private int productId;
    private String foodItems;
    private Double price;
    private ResultSet rs = null;
    private Menu menu = null;
    private boolean noData = false;
    private MenuServices menuServices = null;
    private List<Menu> menuList = null;
    private int ctr=0;
    private String msg;
    private SessionMap<String, Object> sessionMap;
    
    
    public String menu() throws Exception {
        System.out.println("Menu print");
        setMenuServices(new MenuServices());
        try {
            setMenuList(new ArrayList<Menu>());
            setMenuList(getMenuServices().showMenu((int)sessionMap.get("restaurantId")));

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
     * @return the menu
     */
    public Menu getMenu() {
        return menu;
    }

    /**
     * @param menu the menu to set
     */
    public void setMenu(Menu menu) {
        this.menu = menu;
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
    
}
