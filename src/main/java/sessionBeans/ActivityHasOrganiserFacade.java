/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionBeans;

import entityBeans.ActivityHasOrganiser;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author douwejongeneel
 */
@javax.ejb.Stateless
public class ActivityHasOrganiserFacade extends AbstractFacade<ActivityHasOrganiser> {

    @PersistenceContext(unitName = "rsvier_workshop3.rest_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ActivityHasOrganiserFacade() {
        super(ActivityHasOrganiser.class);
    }
    
}
