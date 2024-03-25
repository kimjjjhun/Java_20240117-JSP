package com.saeyan.dto;
/*
 * create table board( 
num NUMBER(5) primary key, 
pass VARCHAR2(30) not null,
name VARCHAR2(30) not null, 
email VARCHAR2(30), 
title VARCHAR2(50), 
content VARCHAR2(1000), 
readcount NUMBER(4) DEFAULT 0, 
writedate date default sysdate 
);*/

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO {
	private int num;
	private String pass; 
	private String name;
	private String email;
	private String title;
	private String content;
	private int readcount;
	private Timestamp writedate;

}
