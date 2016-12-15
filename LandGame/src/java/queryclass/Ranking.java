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
public class Ranking {

    String player;
    int point, position;

    public Ranking(String player, int point) {

        this.player = player;
        this.point = point;
    }

    public Ranking() {
    }

    public String getPlayer() {

        return player;
    }

    public void setPlayer(String player) {

        this.player = player;
    }

    public int getPoint() {

        return point;
    }

    public void setPoint(int point) {

        this.point = point;
    }
}
