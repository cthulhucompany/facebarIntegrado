/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author samurai
 */
@Entity
@Table(name = "estados")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estados.findAll", query = "SELECT e FROM Estados e"),
    @NamedQuery(name = "Estados.findByIdedo", query = "SELECT e FROM Estados e WHERE e.idedo = :idedo"),
    @NamedQuery(name = "Estados.findByTexto", query = "SELECT e FROM Estados e WHERE e.texto = :texto"),
    @NamedQuery(name = "Estados.findByFoto", query = "SELECT e FROM Estados e WHERE e.foto = :foto"),
    @NamedQuery(name = "Estados.findByEnlace", query = "SELECT e FROM Estados e WHERE e.enlace = :enlace"),
    @NamedQuery(name = "Estados.findByFechacreacion", query = "SELECT e FROM Estados e WHERE e.fechacreacion = :fechacreacion")})
public class Estados implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id 
    @GeneratedValue
    @Column(name = "idedo")
    private Integer idedo;
    @Size(max = 2147483647)
    @Column(name = "texto")
    private String texto;
    @Size(max = 2147483647)
    @Column(name = "foto")
    private String foto;
    @Size(max = 2147483647)
    @Column(name = "enlace")
    private String enlace;
    @Column(name = "fechacreacion")
    @Temporal(TemporalType.DATE)
    private Date fechacreacion;
    @Column(name= "publicador")
    private String publicador;

    public String getPublicador() {
        return publicador;
    }

    public void setPublicador(String publicador) {
        this.publicador = publicador;
    }
    
    public Estados() {
    }

    public Estados(Integer idedo) {
        this.idedo = idedo;
    }

    public Integer getIdedo() {
        return idedo;
    }

    public void setIdedo(Integer idedo) {
        this.idedo = idedo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getEnlace() {
        return enlace;
    }

    public void setEnlace(String enlace) {
        this.enlace = enlace;
    }

    public Date getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(Date fechacrecion) {
        this.fechacreacion = fechacrecion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idedo != null ? idedo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estados)) {
            return false;
        }
        Estados other = (Estados) object;
        if ((this.idedo == null && other.idedo != null) || (this.idedo != null && !this.idedo.equals(other.idedo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Estados[ idedo=" + idedo + " ]";
    }
    
}
