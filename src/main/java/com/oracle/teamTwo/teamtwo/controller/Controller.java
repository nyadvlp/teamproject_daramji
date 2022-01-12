package com.oracle.teamTwo.teamtwo.controller;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {
	
	@GetMapping(value = "nav")
	public String main() {
		return "teamtwo/nav";
	}
	
}
