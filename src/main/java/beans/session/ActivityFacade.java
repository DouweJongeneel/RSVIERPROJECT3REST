/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.session;

import beans.entity.Activity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author douwejongeneel
 */
@javax.ejb.Stateless
public class ActivityFacade extends AbstractFacade<Activity> {

    @PersistenceContext(unitName = "rsvier_workshop3.rest_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ActivityFacade() {
        super(Activity.class);
    }
    
}
