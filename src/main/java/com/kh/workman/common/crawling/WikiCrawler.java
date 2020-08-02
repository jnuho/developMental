package com.kh.workman.common.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WikiCrawler {

  public static List<String> crawlLanguageList() {

    String url = "https://en.wikipedia.org/wiki/List_of_programming_languages";

    Document doc = null;
    try {
      doc = Jsoup.connect(url).get();
    } catch(IOException e) {
      e.printStackTrace();
    }

    //메인뉴스 리스트
    Elements languages = doc.select("div.columns ul li").nextAll().select("a");


    List<String> list = new ArrayList<String>();
    
    for(Element lang: languages) {
      list.add(lang.html().toString());
    }
    System.out.println(list);

    return list;
  }
}
