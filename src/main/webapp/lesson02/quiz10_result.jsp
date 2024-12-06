<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<title>Melong</title>
<style>
	a:hover {text-decoration:none;}
	header {height:70px;}
	.contents {min-height:350px;}
	nav {height:40px;}
	.music-info {color:#999; font-size:12px;}
	footer {height:30px;}
</style>
</head>
<body>
<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "http://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/867/444/81867444_1616662460652_1_600x600.JPG");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>
	<div class="container">
		<header class="d-flex align-items-center">
			<h3 class="col-2 mb-0"><a href="/lesson02/quiz10_list.jsp" class="text-success">Melong</a></h3>
			<div class="col-10">
				<form method="get" action="/lesson02/quiz10_result.jsp">
				<%
					Map<String, Object> target = null; // 검색된 결과(노래)
					
					// 1) id로 들어오는 경우 -> a 태그
					if (request.getParameter("id") != null) {
						int id = Integer.parseInt(request.getParameter("id"));
						
						for (Map<String, Object> music : musicList) {
							if (music.get("id").equals(id)) {
								target = music;
								break;
							}
						}
					}
					
					// 2) 검색어로 들어오는 경우 -> form 태그
					if (request.getParameter("search") != null) {
						for (Map<String, Object> music : musicList) {
							if (music.get("title").equals(request.getParameter("search"))) {
								target = music;
								break;
							}
						}
					}
					
				%>
					<div class="input-group col">
						<input type="text" class="form-control col-6" name="search">
						<div class="input-group-append">
							<button class="btn btn-info" type="submit">검색</button>
						</div>
					</div>
				</form>
			</div>
		</header>
		<nav class="d-flex align-items-center">
			<ul class="nav nav-fill font-weight-bold">
				<li class="nav-item"><a href="" class="nav-link text-dark">멜롱챠트</a></li>
				<li class="nav-item"><a href="" class="nav-link text-dark">최신음악</a></li>
				<li class="nav-item"><a href="" class="nav-link text-dark">장르음악</a></li>
				<li class="nav-item"><a href="" class="nav-link text-dark">멜롱DJ</a></li>
				<li class="nav-item"><a href="" class="nav-link text-dark">뮤직어워드</a></li>
			</ul>
		</nav>
		<h4 class="font-weight-bold">곡 정보</h4>
		<section class="contents">
			<div class="border border-success d-flex p-3">
				<div class="mr-3 d-flex align-items-center justify-content-center">
					<image src="<%= target.get("thumbnail") %>" alt="singer" width="180">
				</div>
				<div>
					<div class="display-4"><%= target.get("title") %></div>
					<div class="text-success font-weight-bold"><%= target.get("singer") %></div>
					<div class="music-info d-flex text-secondary mt-2">
						<div>
							<div>앨범</div>
							<div>재생시간</div>
							<div>작곡가</div>
							<div>작사가</div>
						</div>
						<div class="ml-4">
							<div><%= target.get("album") %></div>
							<div class="text-dark"><%= (Integer)target.get("time") / 60 %> : <%= (Integer)target.get("time") % 60 %></div>
							<div><%= target.get("composer") %></div>
							<div><%= target.get("lyricist") %></div>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<h4 class="font-weight-bold">가사</h4>
				<hr>
				<span>가사 정보 없음</span>
			</div>
		</section>
		<hr>
		<footer class="d-flex align-items-center text-secondary ml-3">
			<small>Copyright 2024. melong All Rights Reserved.</small>
		</footer>
	</div>
</body>
</html>