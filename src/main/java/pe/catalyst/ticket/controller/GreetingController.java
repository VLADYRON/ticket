package pe.catalyst.ticket.config.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pe.catalyst.ticket.dao.PersonaDAO;

@Controller
public class GreetingController {

    @Autowired
    private PersonaDAO _persona;

    @RequestMapping("/greeting")
    public String greeting(@RequestParam(value = "name", required = false, defaultValue = "World") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

    @RequestMapping("/hola")
    public String hola(Model model) {
        model.addAttribute("personas", _persona.getAll());
        return "hola";
    }

}
