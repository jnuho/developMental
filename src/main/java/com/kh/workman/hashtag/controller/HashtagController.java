package com.kh.workman.hashtag.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.workman.hashtag.model.service.HashtagService;

@Controller
public class HashtagController {

  @Autowired
  private HashtagService service;

}
