#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/*
 * Créé le 21 oct. 04
 */


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import formOnLine.actions.UserAction;
import formOnLine.msBeans.SubmitForm;
import formOnLine.msBeans.UserData;


/**
 * @author S. LERIDON
 *
 */
public class ContextUserAction extends UserAction {
    
    
    public ContextUserAction () {
    }
    


    
    public String testBeforeCreateSf(SubmitForm sf) {
        String txt = null;
        
        // contrôles spécifiques
        
        return txt;
    }
    
    
    public String initBeforeIndex(UserData u, HttpSession session, HttpServletRequest req) {
        
        return super.initBeforeIndex(u, session, req);
        
        
        
        // initialisations spécifiques 
        
        
        //--------------------------------------------
        // init liste évènements  
                    
            
        /*    
            // init stats (pour contrôle nb max d'inscriptions form 3)
            StatAction sa = new StatAction();
            ValueBeanList stats = new ValueBeanList();
            ValueBeanList list = null;
            
            
            list = u.getListRepByFid(2);
            
            for (int i=0 ; list !=null && i<list.size(); i++) {
                try {
                    Stat stat = new Stat();
                    SubmitForm sf = (SubmitForm)list.get(i);
                    
                    // récup nb réél de formulaires (validés ou en cours)
                    stat = sa.getStat(29, -1, 29, String.valueOf(sf.getS_id()));
                    
                    ReponseAction ra = new ReponseAction();
                    // récup du nb max
                    Reponse r = ra.selectOne(17,sf.getS_id() );
                    
                    stat.setVal(stat.getTotal());
                    stat.setTotal(Integer.parseInt(r.getSVal()));
                    stat.setNum(sf.getS_id());
                    stat.setTitre(sf.getTitre());
                    
                    stats.add(stat);
                } catch (SQLException e) {}
                
                
                
                // mise en session des stats
                if (stats==null) stats = new ValueBeanList();
                session.setAttribute(Stat.SESSION_LIST ,stats);
                
            }
            
            
        }*/
        
        
    }
}
