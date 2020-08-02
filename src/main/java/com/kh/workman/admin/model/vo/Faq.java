package com.kh.workman.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqCategory;
}
