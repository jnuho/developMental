package com.kh.workman.common.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class JobSaraminCrawler {
    
  /**
   * @since 19.11.11
   * @author jnuho@outlook.com
   * @param url : Company description page
   * @param absUrl : company logo image url
   * @implNote visited http://www.saramin.co.kr/robots.txt to check if crawling is allowed.
   */
//  The following is specification from http://www.saramin.co.kr/robots.txt
  
//  # robots.txt for http://www.saramin.co.kr/
//    User-agent: Mediapartners-Google
//    Disallow:
//
//    User-agent: ia_archiver
//    Disallow:
//
//    User-agent: AdsBot-Google
//    Disallow:
//
//    User-agent: AdsBot-Google-Mobile
//    Disallow:
//
//    User-agent: *
//    Disallow: /ad
//    Disallow: /zf_user/mandb
//    Disallow: /zf_user/mandb/view
//    Disallow: /zf_user/talent
//    Disallow: /zf_user/talent/search
//    Allow:    /zf_user/talent/browse-resume
//    Disallow: /zf_user/nonmember/apply
//    Disallow: /zf_user/member/apply/
//    Disallow: /zf_user/member/resume/
//    Disallow: /zf_user/free-consulting-resume/
//    Disallow: /zf_user/help/event-intro-consulting/
//    Allow:    /zf_user/help/event-intro-consulting/main
//    Allow:    /zf_user/help/event-intro-consulting/list
//    Disallow: /zf_user/pds-resume/face-decorate/
//    Disallow: /zf_user/pds-resume/resume-advice/
//    Disallow: /zf_user/recruit/spec-qna
//    Disallow: /zf_user/bbs-brand
//    Disallow: /zf_user/exam-history
//    Disallow: /zf_user/interview-history
//    Disallow: /zf_user/job-worry-solve/
//    Disallow: /zf_user/persons/
//    Disallow: /zf_user/company/
//    Disallow: /zf_user/recruit/recruit-posting/
//    Disallow: /zf_user/recruit/recruitPosting/
//    Disallow: /zf_user/popup/areaPrint/
//    Disallow: /zf_ad
//    Disallow: /recruit/recruit_view.php
//    Disallow: /recruit/recruit_view_blog.php
//    Disallow: /zf_user/recruit-apply/
//    Disallow: /zf_user/special-recruit/special-recruit/category/ 
//    Disallow: /zf_user/united-company/ 
//    Disallow: /helpdesk/
//    Disallow: /inc
//    Disallow: /zf_user/recruit-apply-form/update-company-apply-form-cnt/rec_idx/1021627/form_gb/company
//    Disallow: /error/
//    Disallow: /zf_user/event/dream/resume-manage-event-winner
//    Disallow: /Click*
//    Disallow: /zf_user/track-apply-form/
//    Disallow: /zf_user/job-info-guide/jobinfo-redi
//    Disallow: /zf_user/recruit/view/
//    Allow   : /zf_user/jobs/view/popup
//    Allow   : /zf_user/jobs/public/popup-view
//    Allow   : /zf_user/jobs/public/popupView
//    Allow   : /zf_user/jobs/relay/recruit-view
//    Allow   : /zf_user/jobs/relay/recruitView
//    Disallow: /zf_user/special-recruit/
//    Disallow: /zf_user/special-company-recruit/
//    Disallow: /zf_user/jobs/view/etc
//    Disallow: /zf_user/headhunting/recruit-plan/recruit-view/
//    Disallow: /zf_user/headhunting/recruit-plan/recruitView/
//    Disallow: /zf_user/jobs/view*innerCampaign=headhuntingView
//    Disallow: /zf_user/jobs/view*innerCampaign/headhuntingView
//    Disallow: /61280259/
//
//    Sitemap: http://www.saramin.co.kr/sitemap.xml
//    Sitemap: http://www.saramin.co.kr/sitemapindex.xml

  public static String crawlCompanyLogo(String url) {

    Document doc = null;
    try {
      doc = Jsoup.connect(url).get();
    } catch(IOException e) {
      e.printStackTrace();
    }

    //회사 로고 
    if(doc ==null) {
      return "/resources/images/noimage.png";
    }
    else {
      Element img= doc.select("div.thumb_company span.inner_thumb img").first();
      Element imgTxt= doc.select("div.thumb_company span.txt_name").first();
      if(imgTxt!=null || img == null || img.absUrl("src") ==null
          || img.absUrl("src").length() ==0)
        return "/resources/images/noimage.png";

      String absUrl = img.absUrl("src");
      return absUrl;
    }

  }
}
