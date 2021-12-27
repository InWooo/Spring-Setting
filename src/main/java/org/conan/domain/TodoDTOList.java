package org.conan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoDTOList {
	private String title;
	private Date dueDate;
}
