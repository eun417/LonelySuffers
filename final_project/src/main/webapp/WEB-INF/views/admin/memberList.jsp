<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/adminTable.css"></link>
<style>
    .member-count{
        font-weight: 900;
    }
    .member-count>span{
        color: rgb(255, 0, 0);
    }

</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <form action="/adminSearchMember.do" method="get" name="search-member">
            <div class="search-bar">
                <span class="material-symbols-outlined search-icon">search</span>
                <input type="search" placeholder="아이디로 사용자 검색" name="searchMember">
            </div>
        </form>
        <div class="list-wrapper">
            <form action="/changeGrade.do" method="get" name="memberList">
                <div class="memberList-top list-top">
                    <div class="member-count">전체 사용자 <span>n</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck"></th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>성별</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>회원 등급</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="memberCheck"></td>
                            <td>홍길동</td>
                            <td>hong123</td>
                            <td>여</td>
                            <td>010-9595-6363</td>
                            <td>hong123@naver.com</td>
                            <td>2023-03-12</td>
                            <td>
                                <select class="grade-change">
                                    <option value="사용자">사용자</option>
                                    <option value="판매자">판매자</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div></div>
                </div>
                <div class="list-bottom">
                    <div>
                        <input type="submit" value="등급 변경">
                        <a href="#">회원 탈퇴</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    $(".search-bar>input").on("click",function(){
        $(this).toggleClass("active-search-bar");
    });
</script>
</html>