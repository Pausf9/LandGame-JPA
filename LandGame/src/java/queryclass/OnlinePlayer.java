/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package queryclass;

/**
 *
 * @author Pau 
 */
public class OnlinePlayer {

    String player, lastLogin;

    public OnlinePlayer(String player, String lastLogin) {
        
        this.player = player;
        this.lastLogin = lastLogin;
    }

    public OnlinePlayer() {
    }

    public String getPlayer() {
        
        return player;
    }

    public void setPlayer(String player) {
        
        this.player = player;
    }

    public String getLastLogin() {
        
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        
        this.lastLogin = lastLogin;
    }
}
