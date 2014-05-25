/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package info.toegepaste.www;

import com.sun.faces.facelets.compiler.UIText;
import info.toegepaste.www.entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BTO-Ben
 */
@WebServlet(name = "ManageServlet", urlPatterns = {"/ManageServlet"})
public class ManageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = null;
        HttpSession session = request.getSession(true);

        try {
            RequestDispatcher rd = null;
            emf = Persistence.createEntityManagerFactory("2Ti4_Meulemans_Ben_project2014PU");
            EntityManager em = emf.createEntityManager();
            EntityTransaction tx = em.getTransaction();
            //let op: gebruik hier de juiste naam van de persistence unit 
            //(zoek op in persistence.xml)
            //methode om alles aan te maken in commentaar na aanmaken
            //maakEntiteiten();

            //als op overzicht artikels is geklikt
            if (request.getParameter("beheerLeden") != null) {
                Query q = em.createNamedQuery("Lid.GetAllLeden");
                List<Lid> leden = q.getResultList();
                request.setAttribute("leden", leden);
                rd = request.getRequestDispatcher("beheerLeden.jsp");
            }
            if (request.getParameter("verwijderLid") != null) {
                EntityTransaction et = em.getTransaction();
                et.begin();
                long lidId = Long.parseLong(request.getParameter("lidId"));
                Lid verwijderLid = em.find(Lid.class, lidId);
                em.remove(verwijderLid);
                et.commit();
                request.setAttribute("melding", "Het lid is verwijderd.");
                Query q = em.createNamedQuery("Lid.GetAllLeden");
                List<Lid> leden = q.getResultList();
                request.setAttribute("leden", leden);
                em.close();
                rd = request.getRequestDispatcher("beheerLeden.jsp");
            }
            if (request.getParameter("opslaanLid") != null) {
                EntityTransaction et = em.getTransaction();
                et.begin();
                long lidId = Long.parseLong(request.getParameter("id"));
                Lid wijzigLid = em.find(Lid.class, lidId);
                wijzigLid.setEmail(request.getParameter("email"));
                wijzigLid.setVoornaam(request.getParameter("voornaam"));
                wijzigLid.setFamilienaam(request.getParameter("familienaam"));
                et.commit();
                request.setAttribute("melding", "De wijzigingen zijn aangepast.");
                Query q = em.createNamedQuery("Lid.GetAllLeden");
                List<Lid> leden = q.getResultList();
                request.setAttribute("leden", leden);
                em.close();
                rd = request.getRequestDispatcher("beheerLeden.jsp");
            }
            if (request.getParameter("uitleningenLidId") != null) {
                long lidId = Long.parseLong(request.getParameter("uitleningenLidId"));
                Query q = em.createNamedQuery("Uitlening.GetUitleningenByLidId");
                q.setParameter("lidId", lidId);
                List<Uitlening> uitleningen = q.getResultList();
                request.setAttribute("uitleningen", uitleningen);
                rd = request.getRequestDispatcher("UitleningenLid.jsp");
            }
            if (request.getParameter("beheerArtikels") != null) {

            }
            if (request.getParameter("beheerUitleningen") != null) {

            }
            if (request.getParameter("adminLidId") != null) {
                Query q = em.createNamedQuery("Lid.GetLidById");
                q.setParameter("id", Long.parseLong(request.getParameter("adminLidId")));
                Lid lid = (Lid) q.getSingleResult();
                request.setAttribute("lid", lid);
                rd = request.getRequestDispatcher("adminLid.jsp");
            }
            if (request.getParameter("overzicht") != null) {
                Query q1 = em.createNamedQuery("Boek.GetAllBoeken");
                List<Boek> boeken = q1.getResultList();
                Query q2 = em.createNamedQuery("DVD.GetAllDvds");
                List<DVD> dvds = q2.getResultList();
                request.setAttribute("boeken", boeken);
                request.setAttribute("dvds", dvds);
                rd = request.getRequestDispatcher("overzicht.jsp");
                //eerst met if checken of titel ingevuld is, als dit is List<boek> boeken overschrijven met nieuwe lijst
                //als de andere dingen ingevuld zin filteren door de items die niet voldoen te verwijderen uit de lijst met remove
            }
            if (request.getParameter("detail") != null) {
                //check of dvd of boek is
                if (request.getParameter("detail").toString().equals("dvd")) {
                    Query q = em.createNamedQuery("DVD.GetDvdById");
                    q.setParameter("id", Long.parseLong(request.getParameter("id")));
                    Object artikel = q.getSingleResult();
                    session.setAttribute("type", "DVD");
                    session.setAttribute("artikel", artikel);
                } else {
                    Query q = em.createNamedQuery("Boek.GetBoekById");
                    q.setParameter("id", Long.parseLong(request.getParameter("id")));
                    Object artikel = q.getSingleResult();
                    session.setAttribute("type", "Boek");
                    session.setAttribute("artikel", artikel);
                }
                em.close();
                rd = request.getRequestDispatcher("detail.jsp");
            }
            if (request.getParameter("aanmelden") != null) {
                if (request.getParameter("lidnummer").equals("admin")) {
                    Lid lid = new Lid();
                    lid.setVoornaam("admin");
                    lid.setFamilienaam("password");
                    rd = request.getRequestDispatcher("index.jsp");
                    request.setAttribute("melding", "Aangemeld als admin.");
                    session.setAttribute("lid", lid);
                    rd.forward(request, response);
                }
                Query q = em.createNamedQuery("Lid.GetLidByLidnummer");
                int lidnummer = 0;
                try {
                    lidnummer = Integer.parseInt(request.getParameter("lidnummer"));
                } catch (NumberFormatException e) {
                    lidnummer = 0;
                }
                q.setParameter("lidnummer", lidnummer);
                List<Lid> leden = q.getResultList();
                if (leden.isEmpty()) {
                    request.setAttribute("fout", "Dit lidnummer is foutief");
                } else {
                    Lid lid = leden.get(0);
                    session.setAttribute("lid", lid);
                }
                rd = request.getRequestDispatcher("index.jsp");
            }
            if (request.getParameter("afmelden") != null) {
                session.removeAttribute("lid");
                session.removeAttribute("artikel");
                session.removeAttribute("type");
                request.setAttribute("melding", "Afgemeld.");
                rd = request.getRequestDispatcher("index.jsp");
            }
            if (request.getParameter("uitlenen") != null) {
                Uitlening uitlening = new Uitlening();
                uitlening.setLid((Lid) session.getAttribute("lid"));
                Artikel artikel = (Artikel) session.getAttribute("artikel");
                uitlening.setArtikel(artikel);
                GregorianCalendar nu = new GregorianCalendar();
                uitlening.setUitleenDatum(nu);
                tx.begin();
                em.persist(uitlening);
                tx.commit();
                em.close();
                request.setAttribute("melding", session.getAttribute("type").toString() + " met titel " + artikel.getTitel() + " is in uw uitleningen opgenomen.");
                session.removeAttribute("artikel");
                session.removeAttribute("type");
                rd = request.getRequestDispatcher("index.jsp");
            }
            if (request.getParameter("nieuwLid") != null) {
                session.setAttribute("lid", null);
                rd = request.getRequestDispatcher("nieuwLid.jsp");
            }
            if (request.getParameter("registreren") != null) {
                Lid lid = new Lid();
                lid.setEmail(request.getParameter("email"));
                lid.setFamilienaam(request.getParameter("familienaam"));
                lid.setVoornaam(request.getParameter("voornaam"));
                Query q = em.createNamedQuery("Lid.GetMaxLidnummer");
                Integer lidnummer = (Integer) q.getSingleResult();
                lid.setLidnummer(lidnummer + 1);
                tx.begin();
                em.persist(lid);
                tx.commit();
                em.close();
                //lid in sessie steken
                session.setAttribute("lid", lid);
                request.setAttribute("melding", "Succesvol geregistreerd. U bent nu aangemeld. Uw lidnummer is " + lid.getLidnummer() + ". Onthoudt dit nummer goed, want u heeft dit nodig om de volgende keer aan te melden.");
                //doorsturen naar melding met knop verder gaan met uitlening
                rd = request.getRequestDispatcher("index.jsp");
            }
            if (request.getParameter("filteren") != null) {
                Query q1 = em.createNamedQuery("Boek.GetAllBoeken");
                List<Boek> boeken = q1.getResultList();
                Query q2 = em.createNamedQuery("DVD.GetAllDvds");
                List<DVD> dvds = q2.getResultList();
                //als titel ingevuld is lijst tot die boeken/DVDs beperken
                if (!request.getParameter("titel").toString().equals("")) {
                    //titel meegeven om terug als waarde in tekstvak in te stellen
                    request.setAttribute("titel", request.getParameter("titel"));
                    Query q3 = em.createNamedQuery("Boek.GetByTitel");
                    q3.setParameter("titel", "%" + request.getParameter("titel") + "%");
                    boeken = q3.getResultList();
                    Query q4 = em.createNamedQuery("DVD.GetByTitel");
                    q4.setParameter("titel", "%" + request.getParameter("titel") + "%");
                    dvds = q4.getResultList();
                }
                //als genre geselecteerd is
                if (!request.getParameter("genre").toString().equals("Alle")) {
                    //genre meegeven om terug als waarde in dropdown in te stellen
                    request.setAttribute("genre", request.getParameter("genre"));
                    for (Iterator<Boek> it = boeken.iterator(); it.hasNext();) {
                        Boek boek = it.next();
                        //als het een ander genre is, verwijderen uit lijst
                        if (!boek.getGenre().toString().equals(request.getParameter("genre"))) {
                            it.remove();
                        }
                    }
                    for (Iterator<DVD> it = dvds.iterator(); it.hasNext();) {
                        DVD dvd = it.next();
                        //als het een ander genre is, verwijderen uit lijst
                        if (!dvd.getGenre().toString().equals(request.getParameter("genre"))) {
                            it.remove();
                        }
                    }
                }
                //als jaar ingevuld is
                if (!request.getParameter("jaar").toString().equals("")) {
                    //jaar meegeven om terug als waarde in tekstvak in te stellen
                    request.setAttribute("jaar", request.getParameter("jaar"));
                    for (Iterator<Boek> it = boeken.iterator(); it.hasNext();) {
                        Boek boek = it.next();
                        //als het een ander jaar is, verwijderen uit lijst
                        if (boek.getJaar() != Integer.parseInt(request.getParameter("jaar"))) {
                            it.remove();
                        }
                    }
                    for (Iterator<DVD> it = dvds.iterator(); it.hasNext();) {
                        DVD dvd = it.next();
                        //als het een ander jaar is, verwijderen uit lijst
                        if (dvd.getJaar() != Integer.parseInt(request.getParameter("jaar"))) {
                            it.remove();
                        }
                    }
                }
                //als auteur ingevuld is
                if (!request.getParameter("auteur").toString().equals("")) {
                    //auteur meegeven om terug als waarde in dropdown in te stellen
                    request.setAttribute("auteur", request.getParameter("auteur"));
                    for (Iterator<Boek> it = boeken.iterator(); it.hasNext();) {
                        Boek boek = it.next();
                        //als het boek niet van de auteur is, verwijderen uit lijst
                        if (!boek.getAuteur().equals(request.getParameter("auteur"))) {
                            it.remove();
                        }
                    }
                }
                if (!request.getParameter("regisseur").toString().equals("")) {
                    //auteur regisseur om terug als waarde in dropdown in te stellen
                    request.setAttribute("regisseur", request.getParameter("regisseur"));
                    for (Iterator<DVD> it = dvds.iterator(); it.hasNext();) {
                        DVD dvd = it.next();
                        //als de dvd niet van de regisseur is, verwijderen uit lijst
                        if (!dvd.getRegisseur().equals(request.getParameter("regisseur"))) {
                            it.remove();
                        }
                    }
                }
                request.setAttribute("boeken", boeken);
                request.setAttribute("dvds", dvds);
                rd = request.getRequestDispatcher("overzicht.jsp");
            }
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
            emf.close();
        }
    }

    private void maakEntiteiten() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("2Ti4_Meulemans_Ben_project2014PU");
        Lid lid = new Lid();
        lid.setVoornaam("Ben");
        lid.setFamilienaam("Meulemans");
        lid.setEmail("9benm2@gmail.com");
        lid.setLidnummer(384832);

        DVD dvd = new DVD();
        dvd.setTitel("The Ring");
        dvd.setJaar(2002);
        dvd.setGenre(Genre.THRILLER);
        dvd.setRegisseur("Gore Verbinski");

        Uitlening uitlening = new Uitlening();
        uitlening.setLid(lid);
        uitlening.setArtikel(dvd);

        GregorianCalendar nu = new GregorianCalendar();
        uitlening.setUitleenDatum(nu);

        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        tx.begin();
        em.persist(lid);
        em.persist(dvd);
        em.persist(uitlening);
        tx.commit();
        em.close();
        out.println("Succesvol");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
