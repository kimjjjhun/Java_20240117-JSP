package com.saeyan.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * CREATE TABLE PRODUCT(
    code NUMBER(5) PRIMARY key,
    name varchar2(100) not null,
    price NUMBER(8) not null,
    pictureurl varchar2(50),
    description varchar2(1000)
);
 */
@Setter
@Getter
@ToString
public class ProductVO {
	private int code;          
	private String name;
	private Integer price;
	private String pictureUrl;
	private String description;
}
