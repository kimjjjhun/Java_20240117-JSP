package com.saeyan.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
   create table member(
    name varchar2(30),
    userid varchar2(30)PRIMARY KEY ,
    pwd varchar2(20),
    email varchar2(30),
    phone varchar2(13),
    admin number(1)
);
  */
@Setter
@Getter
@ToString
public class MemberVO {
	String name;
	String userid;
	String pwd;
	String email;
	String phone;
	int admin;
}
