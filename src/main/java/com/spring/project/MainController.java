package com.spring.project;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	@RequestMapping(value = "/parking/main", method = RequestMethod.GET)
	public String getMain() {
		return "main";
	}
}