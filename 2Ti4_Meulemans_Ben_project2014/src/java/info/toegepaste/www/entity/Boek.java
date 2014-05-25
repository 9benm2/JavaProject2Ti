/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package info.toegepaste.www.entity;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author BTO-Ben
 */
@NamedQueries({
    @NamedQuery(name = "Boek.GetAllBoeken", query = "select b from Boek b order by b.titel"),
    @NamedQuery(name = "Boek.GetByTitel", query = "SELECT b FROM Boek b WHERE lower(b.titel) like :titel order by b.titel"),
    @NamedQuery(name = "Boek.GetBoekById", query = "select b from Boek b where b.id = :id")
})

@Entity
@DiscriminatorValue("Boek")
public class Boek extends Artikel implements Serializable {

    private String auteur;
    private int aantalpaginas;

    public Boek() {
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public int getAantalpaginas() {
        return aantalpaginas;
    }

    public void setAantalpaginas(int aantalpaginas) {
        this.aantalpaginas = aantalpaginas;
    }
}
