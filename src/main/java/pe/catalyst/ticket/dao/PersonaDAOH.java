package pe.catalyst.ticket.dao;

import pe.catalyst.ticket.dao.PersonaDAO;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pe.catalyst.ticket.dao.PersonaDAO;
import pe.catalyst.ticket.model.Persona;

@Repository
@Transactional
public class PersonaDAOH implements PersonaDAO {

    @Autowired
    private SessionFactory _sessionFactory;

    private Session getSession() {
        return _sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Persona> getAll() {
        return getSession().createQuery("from Persona").list();
    }

}
