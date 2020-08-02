<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <!-- Custom CSS -->
  <link rel="stylesheet" href="${path }/resources/css/sidebar.css">
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

  <!-- Sidebar  -->
  <div class="d-flex">
    <nav id="sidebar" class="p-0 flex-shrink-1">
      <div class="sidebar-header">
        <h3><a href="${path }/admin/adminMain">Admin Menu</a></h3>
      </div>
  
      <ul class="list-unstyled components">
        
        <li class="active">
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">회원 & FAQ</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="${path }/admin/selectMemberList.do" id="">회원관리</a>
            </li>
            <li>
              <a href="${path }/admin/faqList" id="">FAQ관리</a>
            </li>
          </ul>
          <a href="#pageSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Notice</a>
          <ul class="collapse list-unstyled" id="pageSubmenu1">
            <li>
              <a href="${path }/admin/noticeList" id="">공지 목록</a>
            </li>
            <li>
              <a href="${path }/admin/noticeForm" id="">공지사항 등록</a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>


