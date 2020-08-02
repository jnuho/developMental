package com.kh.workman.common.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class JobGithubCrawler {
    
  /**
   * @since 19.11.11
   * @author jnuho@outlook.com
   * @param id : parameter appended to request url
   * @return url : company logo image url
   * @implNote visited http://www.itworld.co.kr/robots.txt
   * to check if crawling is allowed.
   */
//  The following is specification from http://www.itworld.co.kr/robots.txt
//  User-agent: *
//  Crawl-delay: 5
//  Allow: /
//
//  Disallow: 
//  # Directories
//  Disallow: /_connector/
//  Disallow: /_extension/
//  Disallow: /download/
//  # Paths (clean URLs)
//  Disallow: /node/
//  Disallow: /admin/

  public static String crawlImg(String id) {

    String link = "https://jobs.github.com/positions/" + id; //link to be crawled
    String url = ""; //crawled logo image url
    try {
      Document doc = Jsoup.connect(link).get();
      Element img = doc.select("div.module.logo div.inner div.logo a img").first();

      if(img != null) //logo image exists
        url = img.absUrl("src");
      else //logo image does not exists
        url = "/resources/images/noimage.png";

    } catch(IOException e) {
      e.printStackTrace();
    }
    
    return url;
  }
}
