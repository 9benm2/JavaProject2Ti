/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package info.toegepaste.www.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author BTO-Ben
 */
@Entity
public class Uitlening implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private GregorianCalendar UitleenDatum;
    @ManyToOne
    private Lid lid;
    @ManyToOne
    private Artikel artikel;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public GregorianCalendar getUitleenDatum() {
        return UitleenDatum;
    }

    public void setUitleenDatum(GregorianCalendar UitleenDatum) {
        this.UitleenDatum = UitleenDatum;
    }

    public Lid getLid() {
        return lid;
    }

    public void setLid(Lid lid) {
        this.lid = lid;
    }

    public Artikel getArtikel() {
        return artikel;
    }

    public void setArtikel(Artikel artikel) {
        this.artikel = artikel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Uitlening)) {
            return false;
        }
        Uitlening other = (Uitlening) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "info.toegepaste.www.entity.Uitlening[ id=" + id + " ]";
    }
    
}
