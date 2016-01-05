package pe.catalyst.ticket.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pe.catalyst.ticket.model.Persona;

@Repository
@Transactional
public class PersonaDAOH implements PersonaDAO {

    @Autowired
    private SessionFactory _sessionFactory;

    private Session getSession() {
        return _sessionFactory.getCurrentSession();
    }

    @Override
    //@SuppressWarnings("unchecked")
    public List<Persona> getAll() {
        return getSession().createQuery("from Persona").list();
    }

    @Override
    public List<Persona> search(String nombre) {
        Criteria criteria = getSession().createCriteria(Persona.class);
        criteria.add(Restrictions.like("nombres", nombre, MatchMode.ANYWHERE));
        return criteria.list();
    }

}
