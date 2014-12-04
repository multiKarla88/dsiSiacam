/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author MeisterAlex
 */
@MappedSuperclass
@Table(name = "usuario")
@XmlRootElement
public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IDUSER")
    private Integer iduser;
    @Size(max = 20)
    @Column(name = "NOMBREUSER")
    private String nombreuser;
    @Size(max = 20)
    @Column(name = "PASSWORDUSER")
    private String passworduser;
    @Column(name = "FECHAUSER")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechauser;
    @Size(max = 10)
    @Column(name = "ESTADOUSER")
    private String estadouser;
    @OneToMany(mappedBy = "iduser")
    private Collection<Empleado> empleadoCollection;
    @JoinColumn(name = "IDROL", referencedColumnName = "IDROL")
    @ManyToOne
    private Rol idrol;

    public Usuario() {
    }

    public Usuario(Integer iduser) {
        this.iduser = iduser;
    }

    public Integer getIduser() {
        return iduser;
    }

    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

    public String getNombreuser() {
        return nombreuser;
    }

    public void setNombreuser(String nombreuser) {
        this.nombreuser = nombreuser;
    }

    public String getPassworduser() {
        return passworduser;
    }

    public void setPassworduser(String passworduser) {
        this.passworduser = passworduser;
    }

    public Date getFechauser() {
        return fechauser;
    }

    public void setFechauser(Date fechauser) {
        this.fechauser = fechauser;
    }

    public String getEstadouser() {
        return estadouser;
    }

    public void setEstadouser(String estadouser) {
        this.estadouser = estadouser;
    }

    @XmlTransient
    public Collection<Empleado> getEmpleadoCollection() {
        return empleadoCollection;
    }

    public void setEmpleadoCollection(Collection<Empleado> empleadoCollection) {
        this.empleadoCollection = empleadoCollection;
    }

    public Rol getIdrol() {
        return idrol;
    }

    public void setIdrol(Rol idrol) {
        this.idrol = idrol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iduser != null ? iduser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.iduser == null && other.iduser != null) || (this.iduser != null && !this.iduser.equals(other.iduser))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Usuario[ iduser=" + iduser + " ]";
    }
    
}
