/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 *
 * @author samurai
 */
public class testEstado {
    public static void main(String[] args){
    Estados estado = new Estados();
    estado.setTexto("Probando 1234");
    
    estado.setPublicador("joe@joe.com");
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Estado");
    EntityManager em = emf.createEntityManager();
    EntityTransaction tx = em.getTransaction();
    tx.begin();
    em.persist(estado);
    tx.commit();
    em.close();
    emf.close();
    }
}
