/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package info.toegepaste.www.entity;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author BTO-Ben
 */
@NamedQueries({
    @NamedQuery(name = "DVD.GetAllDvds", query = "select d from DVD d order by d.titel"),
    @NamedQuery(name = "DVD.GetByTitel", query = "SELECT d FROM DVD d WHERE lower(d.titel) like :titel order by d.titel")
})

@Entity
@DiscriminatorValue("DVD")
public class DVD extends Artikel implements Serializable {

    private String regisseur;

    public DVD() {
    }

    public String getRegisseur() {
        return regisseur;
    }

    public void setRegisseur(String regisseur) {
        this.regisseur = regisseur;
    }
}
