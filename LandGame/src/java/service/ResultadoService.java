/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import queryclass.Ranking;
import queryclass.OnlinePlayer;
import dbjuego.Soleresultados;
import dbjuego.Soleusuarios;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import queryclass.Played;

/**
 *
 * @author Pau
 */
public class ResultadoService {

    protected EntityManager em;

    public ResultadoService(EntityManager em) {
        this.em = em;
    }

    public ResultadoService() {
    }

    //Recibe un string puntuacion
    //Pattern encuentra los carácteres dígitos
    //Matcher interpreta el patrón creado por la clase Pattern y devuelve los 
    //valores que encajan con el patrón
    public int getPuntuacion(String puntuacion) {

        String cadena = "";
        int resultadoFinal = 0;
        Pattern p = Pattern.compile("(\\d+)");
        Matcher m = p.matcher(puntuacion);
        while (m.find()) {
            cadena = cadena + m.group(1);
        }
        try {
            resultadoFinal = Integer.parseInt(cadena);
        } catch (NumberFormatException e) {
        }
        return resultadoFinal;
    }

    //Método que introduce en la tabla los resultados
    public void addresult(Soleusuarios code, int point, java.sql.Date dateinicio, java.sql.Date datefin) {

        Soleresultados a = new Soleresultados();
        EntityTransaction tx = em.getTransaction();
        a.setCodigoUsuarios(code);
        a.setPuntuacion(point);
        a.setFechaInicio(dateinicio);
        a.setFechaFinal(datefin);
        try {
            tx.begin();
            em.persist(a);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
        }
    }

    //Devuelve de la base de datos un arraylist con los valores de usuarios y 
    //sus últimos logins 
    public ArrayList<OnlinePlayer> getOnline() {

        Query q = em.createNativeQuery("select distinct  usuario as player,  min(age(now(),fecha_final)) as last_login \n"
                + "                from public.Soleresultados, public.Soleusuarios\n"
                + "                where codigo=codigo_usuarios\n"
                + "                group by usuario\n"
                + "                order by min(age(now(),fecha_final)) asc limit 5;");

        ArrayList<OnlinePlayer> lista = new ArrayList<OnlinePlayer>();
        List<Object[]> results = q.getResultList();
        for (Object[] elements : results) {
            OnlinePlayer on = new OnlinePlayer();
            String name = String.valueOf(elements[0]);
            String time = String.valueOf(elements[1]);
            on.setPlayer(name);
            on.setLastLogin(time);
            lista.add(on);
        }
        return lista;
    }

    //Devuelve de la base de datos un arraylist con los valores de usuarios y puntuación 
    public ArrayList<Ranking> getRanking() {

        Query q = em.createNativeQuery("SELECT usuario as PLAYERS, puntuacion as POINTS\n"
                + "                   FROM public.Soleusuarios, public.Soleresultados  \n"
                + "                   WHERE puntuacion = (\n"
                + "                               SELECT MIN(puntuacion)\n"
                + "                               FROM public.Soleresultados\n"
                + "                               WHERE codigo = codigo_usuarios and puntuacion>0\n"
                + "                               )\n"
                + "                    group by puntuacion, usuario\n"
                + "                  order by puntuacion asc limit 10;");

        ArrayList<Ranking> lista = new ArrayList<Ranking>();
        List<Object[]> results = q.getResultList();
        for (Object[] elements : results) {
            Ranking ran = new Ranking();
            String name = String.valueOf(elements[0]);
            String sPoint = String.valueOf(elements[1]);
            int ipoint = Integer.parseInt(sPoint);
            ran.setPlayer(name);
            ran.setPoint(ipoint);
            lista.add(ran);
        }
        return lista;
    }

    //Devuelve de la base de datos un arraylist con los valores de usuarios que
    //más han jugado 
    public ArrayList<Played> getTopPlayed() {

        Query q = em.createNativeQuery("SELECT  usuario, count(puntuacion)\n"
                + "  FROM public.Soleresultados, public.Soleusuarios\n"
                + "  WHERE codigo=codigo_usuarios\n"
                + "  GROUP BY usuario\n"
                + "  ORDER BY count(puntuacion) desc limit 10;");
        ArrayList<Played> lista = new ArrayList<Played>();
        List<Object[]> results = q.getResultList();
        for (Object[] elements : results) {
            Played play = new Played();
            String name = String.valueOf(elements[0]);
            String scount = String.valueOf(elements[1]);
            int icount = Integer.parseInt(scount);
            play.setPlayer(name);
            play.setCount(icount);
            lista.add(play);
        }
        return lista;
    }
}
