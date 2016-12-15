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
public class Played {

    String player;
    int count;

    public Played(String player, int count) {

        this.player = player;
        this.count = count;
    }

    public Played() {
    }

    public String getPlayer() {

        return player;
    }

    public void setPlayer(String player) {

        this.player = player;
    }

    public int getCount() {

        return count;
    }

    public void setCount(int count) {

        this.count = count;
    }

}
