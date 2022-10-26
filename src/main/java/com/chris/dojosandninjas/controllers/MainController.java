package com.chris.dojosandninjas.controllers;


import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.chris.dojosandninjas.models.Dojo;
import com.chris.dojosandninjas.models.Ninja;
import com.chris.dojosandninjas.services.DojoService;
import com.chris.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	private final NinjaService ninjaService;
	private final DojoService dojoService;
	
	public MainController(NinjaService ninjaService, DojoService dojoService) {
		this.ninjaService = ninjaService;
		this.dojoService = dojoService;
	}
	
	@GetMapping("/new/dojo")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "newDojo.jsp";
	}
	
	@PostMapping("/create/dojo")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "newDojo.jsp";
		}
		else {
			Dojo newDojo = dojoService.createDojo(dojo);
			return String.format("redirect:/dojo/%s", newDojo.getId());
		}
	}
	
	@GetMapping("/new/ninja")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "newNinja.jsp";
	}
	
	@PostMapping("/create/ninja")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "newNinja.jsp";
		}
		else {
			Ninja newNinja = ninjaService.createNinja(ninja);
			return String.format("redirect:/dojo/%s", newNinja.getDojo().getId());
		}
	}
	
	@GetMapping("/dojo/{id}")
	public String showDojo(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.findDojo(id);
//		List<Ninja> ninjas = dojo.getNinjas();
		model.addAttribute("dojo", dojo);
		return "showDojo.jsp";
	}
	
	
}
