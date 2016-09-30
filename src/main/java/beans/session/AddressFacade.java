/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.session;

import beans.entity.Address;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author douwejongeneel
 */
@javax.ejb.Stateless
public class AddressFacade extends AbstractFacade<Address> {

    @PersistenceContext(unitName = "workshop3BPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AddressFacade() {
        super(Address.class);
    }
    
}
