package org.conan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.conan.domain.SampleDTO;
import org.conan.domain.SampleDTOList;
import org.conan.domain.TodoDTOList;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@RequestMapping("/sample/*")
@Controller
@Log4j
public class SampleController {
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		return "ex01";
	}
	
	
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name")String name,@RequestParam("age")int age) {
		log.info("name : "+name);
		log.info("age : "+age);
		return "ex02";
	}
	
	@GetMapping("/ex02List")
	public String ex02(@RequestParam("ids")ArrayList<String> ids){
		log.info("ids : "+ids);
		return "ex02List";
	}
	
	@GetMapping("/ex02Array")
	public String ex02(@RequestParam("ids")String[] ids){
		log.info("array ids : "+Arrays.toString(ids));
		return "ex02List";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class,new CustomDateEditor(df,false));
	}
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos : "+list);
		return "ex02Bean";
	}
	@GetMapping("/ex03")
	public String ex03(TodoDTOList todo) {
		log.info("todo : "+todo);
		return "ex03";
	}
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto,@ModelAttribute("page") int page) {
		log.info("dto : "+dto);
		log.info("page : "+page);
		return "/sample/ex04";
	}
	
	@GetMapping("/ex05")
	public void ex05(String name,int age) {
		log.info("name : "+name);
		log.info("age : "+age);
	}
	
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("ex06 : "+"success");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("conan");
		return dto;
	}
}
