/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author pc
 */
public class menuitems {
    private int itemId;
    private String ItemName;
    private String Type;
    private String ingredients;
    private int price;
    private int veg;
    private int cooking_time;

    public menuitems(int itemId, String ItemName, String Type, String ingredients, int price, int veg, int cooking_time) {
        this.itemId = itemId;
        this.ItemName = ItemName;
        this.Type = Type;
        this.ingredients = ingredients;
        this.price = price;
        this.veg = veg;
        this.cooking_time = cooking_time;
    }

    public menuitems() {
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return ItemName;
    }

    public void setItemName(String ItemName) {
        this.ItemName = ItemName;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getVeg() {
        return veg;
    }

    public void setVeg(int veg) {
        this.veg = veg;
    }

    public int getCooking_time() {
        return cooking_time;
    }

    public void setCooking_time(int cooking_time) {
        this.cooking_time = cooking_time;
    }
    
    
}
