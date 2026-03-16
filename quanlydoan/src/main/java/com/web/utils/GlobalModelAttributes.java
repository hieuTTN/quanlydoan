package com.web.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalModelAttributes {

    @Autowired
    private UserUtils userUtils;

    @ModelAttribute
    public void addGlobalAttributes(Model model, HttpServletRequest request, HttpSession session) {
        model.addAttribute("userLogged", userUtils.getUserWithAuthority());
    }
}
