package com.spring.gotgongbang.juneyub.controller;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
public class IndexController {
	
	@RequestMapping(value="/")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("redirect:/index.got");
		return mav;
	}
	
	@RequestMapping(value="/index.got")
	public ModelAndView index(ModelAndView mav) {

		mav.setViewName("home");
		
		return mav;
	}
}
