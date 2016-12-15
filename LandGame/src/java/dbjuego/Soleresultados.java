/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbjuego;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Pau
 */
@Entity
//Crea la tabla Resultados
@Table(name = "soleresultados")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Soleresultados.findAll", query = "SELECT t FROM Soleresultados t"),
    @NamedQuery(name = "Soleresultados.findByCodigoResultados", query = "SELECT t FROM Soleresultados t WHERE t.codigoResultados = :codigoResultados"),
    @NamedQuery(name = "Soleresultados.findByPuntuacion", query = "SELECT t FROM Soleresultados t WHERE t.puntuacion = :puntuacion"),
    @NamedQuery(name = "Soleresultados.findByFechaInicio", query = "SELECT t FROM Soleresultados t WHERE t.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Soleresultados.findByFechaFinal", query = "SELECT t FROM Soleresultados t WHERE t.fechaFinal = :fechaFinal")})
public class Soleresultados implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "codigo_resultados")
    private Integer codigoResultados;
    @Column(name = "puntuacion")
    private Integer puntuacion;
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaInicio;
    @Column(name = "fecha_final")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaFinal;
    @JoinColumn(name = "codigo_usuarios", referencedColumnName = "codigo")
    @ManyToOne
    private Soleusuarios codigoUsuarios;

    public Soleresultados() {
    }

    public Soleresultados(Integer codigoResultados) {
        this.codigoResultados = codigoResultados;
    }

    public Integer getCodigoResultados() {
        return codigoResultados;
    }

    public void setCodigoResultados(Integer codigoResultados) {
        this.codigoResultados = codigoResultados;
    }

    public Integer getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(Integer puntuacion) {
        this.puntuacion = puntuacion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public Soleusuarios getCodigoUsuarios() {
        return codigoUsuarios;
    }

    public void setCodigoUsuarios(Soleusuarios codigoUsuarios) {
        this.codigoUsuarios = codigoUsuarios;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigoResultados != null ? codigoResultados.hashCode() : 0);
        return hash;
    }
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Soleresultados)) {
            return false;
        }
        Soleresultados other = (Soleresultados) object;
        if ((this.codigoResultados == null && other.codigoResultados != null) || (this.codigoResultados != null && !this.codigoResultados.equals(other.codigoResultados))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dbjuego.Soleresultados[ codigoResultados=" + codigoResultados + " ]";
    }

}
