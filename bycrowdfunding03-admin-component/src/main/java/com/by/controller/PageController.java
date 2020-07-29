package com.by.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/main.html")
    public String aaa(){
        return "main";
    }
    @RequestMapping("/tag.html")
    public String tag(){
        return "tag";
    }



}
