package pe.catalyst.ticket.dao;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import pe.catalyst.ticket.model.Persona;

@Repository
@Transactional
public interface PersonaDAO {

   
    public List<Persona> getAll();

}
