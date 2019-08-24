package com.dpf.text.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author eRunn
 * @create 2019-05-22 23:57
 * @email 446933040@qq.com
 */
public class Text {
    public static void main(String[] args) {
        ApplicationContext app = new AnnotationConfigApplicationContext("springmvc.xml");
        String[] beanDefinitionNames = app.getBeanDefinitionNames();
        for (String name :beanDefinitionNames){
            System.out.println(name);
        }


    }


}
