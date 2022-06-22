# :pushpin: CAMPER
> 캠핑족 혹은 캠핑에 입문하고 싶은 사람들이 정보를 공유 및 획득하기 위한 커뮤니티  

</br>

## :bookmark: 목차
1. [프로젝트 개요](#1-프로젝트-)
2. [사용 기술](#2-사용-기술)
3. [ERD 설계](#3-ERD-설계)
4. [맡은 역할](#4-맡은-역할)
5. [추가 변경사항](#5-추가-변경사항)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [회고 / 느낀점](#7-회고--느낀점)

</br></br>

## 1. 프로젝트 개요
#### `제작 기간`
2022 02월 15일 ~ 03월 15일  


#### `참여 인원`
팀 프로젝트 ( 4인 )  


#### `간단소개`
- 사용자는 회원가입( 일반 또는 SNS계정 ), 로그인 후 모든 서비스를 이용할 수 있습니다.
- 원하는 캠핑장을 키워드를 통해 검색하고 해당 캠핑장에 대한 정보를 얻으실 수 있습니다.
- 게시판이 기반인 커뮤니티 사이트를 선정하여 주제에 따라 다른 각각의 게시판을 구현해봄으로써  
사용자는 다양하게 정보를 습득할 수 있습니다.

</br></br>

## 2. 사용 기술
#### `Back-end`
  - Java 11
  - Spring Boot
  - MyBatis

#### `Front-end`
  - HTML
  - CSS
  - JavaScript / jQuery
  - JSTL
  
#### `Develpment Environment`
<p align="center">
<img src="https://user-images.githubusercontent.com/107043926/174969711-6e4d1d73-e13e-463d-a66e-31a6a15afa54.png"
     width="1000" height="400">
</p>

</br></br>

## 3. ERD 설계
<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/107043926/174970242-2c1b4332-85a7-462b-990b-ba4e2e8b4591.png">
</p>

</br></br>

## 4. 맡은 역할
#### 1. 프로젝트 세부 기획
  - 시퀀스 다이어그램 작성
  - 유스케이스 다이어그램 작성
  - 테이블 명세서 작성
  - 물리적 ERD 작성

</br>

#### 2. 커뮤니티(=게시판) 페이지 개발
  - 글 목록 / 등록 / 수정 / 삭제 기능 구현
  - 댓글 기능 구현
  - 글 등록시 웹 에디터인 CK Editor 사용

</br>

#### 3. 고객센터 페이지 개발
  - FAQ 페이지 목록 부트스트랩 아코디언 형식 적용
  - 공지사항 목록 기능 구현
  - 관리자인 사용자만 글 등록 가능

</br></br>

## 5. 추가 변경사항

> 팀 프로젝트를 끝낸 후, 개발은 협업하는 일이기에 많이 사용되는 코딩은 무엇인가에 대하여 고민하였고     
> 제가 생각하는 미흡한 점을 개선하고자 홀로 진행하게 되었습니다.

</br>

<details>
<summary><b>추가 변경사항 보기</b></summary>
<div markdown="1">

### 5-1 커뮤니티 게시판 MyBatis 프레임워크로 변경
  SQL 문이 프로그래밍 소스 코드로부터 완전히 분리되어 아래 3가지 기능이 향상되고  
  실무에 많이 사용되므로 변경이 필수라고 생각했고 추가 진행사항으로 결정하고 실행에 옮겼습니다.
  - 코드의 간결성(= 가독성 향상 )
  - 유지보수성 향상
  - 이식성 향상
  
  </br>
  
  기존 프로젝트의 디렉터리구조를 Mybatis를 적용해 아래와 같은 디렉터리 구조로 만들었습니다.
  
  </br>
  
  <p align="center">
  <img src="https://user-images.githubusercontent.com/107043926/173869875-78432eca-94d9-4c96-88d4-de3a37f387d8.png">
  </p>
  
  </br>
  
  <p align="center">
  <img src="https://user-images.githubusercontent.com/107043926/174450273-41865fa8-c2b0-43b8-9326-0adb9bc4e9e4.png">
  </p>
    
  </br>
  
  Mybatis 프레임워크를 적용하기 위해서 4개의 파일을 작성하고 Controller를 수정했습니다.
  <details>
  <summary><b>CommMapper.xml 코드 확인</b></summary>
    
  - Mybatis 사용목적 중 하나인 SQL문을 분리하기 위해 작성한다.
<div markdown="1">

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper 
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.camper.community.mapper.CommMapper">

	<!-- 게시판 Mapper.xml -->
	
	<!-- 커뮤니티 캠핑로그 / 캠핑꿀팁 / 캠핑가자 List -->
	<select id="boardList" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT PSEQ
	    		, TITLE
	            , NICK
	            , TYPE
	            , DATE_FORMAT( WDATE, '%y-%m-%d' ) AS WDATE
	    FROM p_table
	    WHERE TYPE = #{type}
	    ORDER BY PSEQ DESC
	    LIMIT 5 OFFSET #{offset}
	</select>
	
	<!-- 페이징 위한 게시글 count -->
	<select id="boardListCount" parameterType="com.camper.community.model.BoardTO" resultType="int" >
		SELECT COUNT(1)
		FROM p_table
		WHERE TYPE = #{type}
	</select>
	
	
	<!-- 커뮤니티 게시물 보기 -->
	<select id="viewBoard" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT TITLE
	    		, NICK
	            , DATE_FORMAT( WDATE, '%y-%m-%d' ) AS WDATE
	            , CONTENT
	            , TYPE
	            , PSEQ 
	    FROM p_table 
	    WHERE PSEQ = #{pseq}
	</select>
	    
	    
	<!-- 커뮤니티 게시물 등록 -->
	<insert id="writeBoard" parameterType="com.camper.community.model.BoardTO">
		INSERT INTO p_table 
	    VALUES( 0, #{title}, #{nick}, #{pwd}, #{content}, #{type}, now(), #{heart}, #{preply} )
	</insert>
	
	
	<!--  커뮤니티 게시물 삭제 확인 -->
	<delete id="deleteOkBoard" parameterType="com.camper.community.model.BoardTO">
		DELETE FROM p_table 
	    WHERE PSEQ = #{pseq}
	</delete>
	
	
	<!-- 커뮤니티 게시물 수정 -->
	<select id="modifyBoard" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT TITLE
				, NICK
				, CONTENT
				, TYPE
				, PSEQ
		FROM p_table 
		WHERE PSEQ = #{pseq}
	</select>
	
	
	<!-- 커뮤니티 게시물 수정 확인 -->
	 <update id="modifyOkBoard" parameterType="com.camper.community.model.BoardTO">
		UPDATE p_table SET TITLE = #{title}, CONTENT = #{content} 
	    WHERE PSEQ = #{pseq}
	</update>   
	    
	    
	<!-- 공지사항 List -->
	<select id="noticeList" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT NSEQ
	    		, TITLE
	            , NICK
	            , TYPE
	            , DATE_FORMAT( WDATE, '%y-%m-%d' ) AS WDATE 
	    FROM n_board 
	    WHERE TYPE = #{type}
	    ORDER BY NSEQ DESC 
	</select>
	    
	    
	<!-- 공지사항 게시물 보기 -->
	<select id="noticeView" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT TITLE
	    		, NICK
	            , DATE_FORMAT( WDATE, '%y-%m-%d' ) AS WDATE
	            , CONTENT
	            , TYPE
	            , NSEQ
	    FROM n_board 
	    WHERE NSEQ = #{nseq}
	</select>
	    
	    
	<!-- FAQ List -->
	<select id="faqList" parameterType="com.camper.community.model.BoardTO" resultType="com.camper.community.model.BoardTO">
		SELECT NSEQ
	    		, TITLE
	            , NICK
	            , CONTENT
	            , DATE_FORMAT(WDATE, '%Y-%m-%d' ) AS WDATE
	    FROM n_board 
	    WHERE TYPE = #{type}
	    ORDER BY NSEQ DESC  
	</select>
	
</mapper>
```

</div>
</details>
    
</br>
  
<details>
<summary><b>CommMapper.java 코드 확인</b></summary>
    
- CommMapper.xml 파일에 기재된 SQL문을 호출하기 위한 인터페이스(Interface)이다.
- 메서드명은 CommMapper.xml의 namespace ID와 맞춰야 한다.
<div markdown="1">

~~~java
package com.camper.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.camper.community.model.BoardTO;


@Mapper
public interface CommMapper {
	
	// 커뮤니티 메인페이지 3개 List
	public List<BoardTO> boardList( BoardTO to );
	
	// 페이징 위한 게시글 count
	public int boardListCount( BoardTO to );

	// 커뮤니티 게시글 보기
	public BoardTO viewBoard( BoardTO to );
	
	// 커뮤니티 게시글 등록
	public int writeBoard( BoardTO to );
	
	// 커뮤니티 게시글 삭제
	// public BoardTO deleteBoard( BOardTO to );

	// 커뮤니티 게시글 삭제 확인
	public int deleteOkBoard( BoardTO to );
	
	// 커뮤니티 게시글 수정
	public BoardTO modifyBoard( BoardTO to );
	
	// 커뮤니티 게시글 수정 확인
	public int modifyOkBoard( BoardTO to );
	
	// 공지사항 게시글 List
	public List<BoardTO> noticeList( BoardTO to );
	
	// 공지사항 게시글 보기
	public BoardTO noticeView( BoardTO to );
	
	// FAQ 게시글 List
	public List<BoardTO> faqList( BoardTO to);
}

~~~

</div>
</details>
  
</br>
   
<details>
<summary><b>CommService.java 코드 확인</b></summary>
    
- 해당 Service에서 수행하는 기능들을 먼저 정의한 것이다.
- Controller는 화면에서 넘어오는 매개변수들을 이용해 Service객체들을 호출한다.
<div markdown="1">

~~~java
package com.camper.community.service;

import java.util.List;

import com.camper.community.model.BoardTO;
import com.camper.model.NboardTO;

public interface CommService {

	// 커뮤니티 메인페이지 3개 List
	public List<BoardTO> boardList( BoardTO to ) throws Exception;
		
	// 페이징 위한 게시글 count
	public int boardListCount( BoardTO to ) throws Exception;
		
	// 커뮤니티 게시글 보기
	public BoardTO viewBoard( BoardTO to ) throws Exception;
		
	// 커뮤니티 게시글 등록
	public int writeBoard( BoardTO to ) throws Exception;
		
	/*
	// 커뮤니티 게시글 삭제
	public BoardTO deleteBoard( BoardTO to ) throws Exception;
	*/
		
	// 커뮤니티 게시글 삭제 확인
	public int deleteOkBoard( BoardTO to ) throws Exception;
		
	// 커뮤니티 게시글 수정
	public BoardTO modifyBoard( BoardTO to ) throws Exception;
		
	// 커뮤니티 게시글 수정 확인
	public int modifyOkBoard( BoardTO to ) throws Exception;
		
	// 공지사항 게시글 List
	public List<BoardTO> noticeList( BoardTO to ) throws Exception;
		
	// 공지사항 게시글 보기
	public BoardTO noticeView( BoardTO to ) throws Exception;
		
	// FAQ 게시글 List
	public List<BoardTO> faqList( BoardTO to ) throws Exception;
}

~~~

</div>
</details>
    
</br>

<details>
<summary><b>CommServiceImpl 코드 확인</b></summary>
    
- CommService.java를 부모로 상속받아 구현하게 된다.
- CommServiceImpl.java는 비즈니스 로직 즉, 기능을 구현하는 구현부를 수행하는 역할을 맡는다.
<div markdown="1">

~~~java
package com.camper.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camper.community.mapper.CommMapper;
import com.camper.community.model.BoardTO;
import com.camper.community.service.CommService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommServiceImpl implements CommService {

	@Autowired
	CommMapper commMapper;
	
	// 커뮤니티 게시글 List
	@Override
	public List<BoardTO> boardList(BoardTO to) throws Exception {
		
		List<BoardTO> list = null;
		
		try {
			list = commMapper.boardList( to );
		} catch (Exception e) {
			log.error( "[게시판 리스트 조회 에러]" + e.getMessage() );
		}
		
		return list;
	}
	
	// 페이징 위한 게시글 count
	public int boardListCount( BoardTO to ) throws Exception {
		// 게시판 카운트
		return commMapper.boardListCount( to );
		
	}
	
	// 게시판 게시글 상세보기
	@Override
	public BoardTO viewBoard(BoardTO to) throws Exception {
		
		BoardTO board = null;
		
		try {
			board = commMapper.viewBoard( to );
		} catch (Exception e) {
			log.error( "[게시글 상세 보기 에러]" + e.getMessage() );
		}
		
		return board;
	}
	
	// 게시판 게시글 등록
	@Override
	public int writeBoard(BoardTO to) throws Exception {
		
		int flag = 1;
		
		try {
			if( commMapper.writeBoard( to ) == 1 ) {
				flag = 0;
			}
		} catch (Exception e) {
			log.error( "[게시판 게시글 등록 에러]" + e.getMessage() );
		}
		return flag;
	}
	
	/*
	// 게시판 게시글 삭제
	@Override
	public BoardTO deleteBoard(BoardTO to) throws Exception {
		BoardTO board = null;
		
		try {
			board = commMapper.deleteBoard( to );
		} catch (Exception e) {
			log.error( "[게시판 게시글 삭제 에러]" + e.getMessage() );
		}
		
		return board;
		
	}
	*/
	
	// 게시판 게시글 삭제 확인
	@Override
	public int deleteOkBoard(BoardTO to) throws Exception {
		
		int flag = 1;
		
		try {
			if( commMapper.deleteOkBoard( to ) == 1 ) {
				// 정상
				flag = 0;
			}
		} catch (Exception e) {
			log.error( "[게시판 게시글 삭제 확인 에러]" + e.getMessage() );
		}
		return flag;
	}
	
	// 게시판 게시글 수정
	@Override
	public BoardTO modifyBoard(BoardTO to) throws Exception {
		
		BoardTO board2 = null;
		
		try {
			board2 = commMapper.modifyBoard( to );
		} catch (Exception e) {
			log.error( "[게시판 게시글 수정 에러]" + e.getMessage() );
		}
		
		return board2;
		
	}
	
	// 게시판 게시글 수정 확인
	@Override
	public int modifyOkBoard(BoardTO to) throws Exception {
		
		int flag = 1;
		
		try {
			if( commMapper.modifyOkBoard( to ) == 1 ) {
				// 정상
				flag = 0;
			}
		} catch (Exception e) {
			log.error( "[게시판 게시글 수정 확인 에러]" + e.getMessage() );
		}
		
		return flag;
	}

	// 공지사항 List
	@Override
	public List<BoardTO> noticeList(BoardTO to) throws Exception {
		
		List<BoardTO> list = null;
		
		try {
			list = commMapper.noticeList( to );
		} catch (Exception e) {
			log.error( "[공지사항 리스트 에러]" + e.getMessage() );
		}
		
		return list;
	}

	// 공지사항 글보기
	@Override
	public BoardTO noticeView(BoardTO to) throws Exception {
		
		BoardTO board3 = null;
		
		try {
			board3 = commMapper.noticeView( to );
		} catch (Exception e) {
			log.error( "[공지사항 글보기 에러]" + e.getMessage() );
		}
		return board3;
	}

	// FAQ List
	@Override
	public List<BoardTO> faqList(BoardTO to) throws Exception {
		
		List<BoardTO> list = null;
		
		try {
			list = commMapper.faqList( to );
		} catch (Exception e) {
			log.error( "[문의응답 리스트 에러]" + e.getMessage() );
		}
		
		return list;
	}
}
	
~~~

</div>
</details>
    
</br>
    
<details>
<summary><b>CommController.java 코드 확인</b></summary>

- Controller.java가 필요한 비즈니스 로직( Service )를 호출한다.
- 사용자의 요청을 처리한 후, 지정된 view 모델 객체를 넘겨주는 역할을 수행한다.
- 요청이 들어오는 URL과 HTTP METHOD 에 대해 정의한다. ( 리턴값을 잘 생각해서 작성 필수 )
<div markdown="1">

~~~java

package com.camper.community.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camper.community.model.BoardTO;
import com.camper.community.model.PagingVO;
import com.camper.community.service.CommService;
import com.camper.model.NboardTO;
import com.camper.model.ReplyTO;
import com.camper.service.ReplyService;
import com.google.gson.JsonObject;

// 캠핑톡톡 Controller
@RestController
public class CommController {
	
	@Autowired
	CommService commService;
	
	@Autowired
	ReplyService replyService;
	

	// 캠핑톡톡 메인 ( main )
	@RequestMapping("/community/main.do")
	public ModelAndView boardMain(BoardTO to) throws Exception {
		
		
		// 현재 페이지 번호
		if(StringUtils.isEmpty(String.valueOf( to.getCpage()))) {
			to.setCpage(1);
		}
		
		// 캠핑로그 List 부분
		to.setType("l");
		List<BoardTO> boardLists5 = commService.boardList( to );
		
		// 캠핑꿀팁 List 부분
		to.setType("t");
		List<BoardTO> boardLists6 = commService.boardList( to );
		
		// 캠핑가자 List 부분
		to.setType("g");
		List<BoardTO> boardLists7 = commService.boardList( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists5", boardLists5 );
		modelAndView.addObject( "boardLists6", boardLists6 );
		modelAndView.addObject( "boardLists7", boardLists7 );
		
		modelAndView.setViewName("community/board_main");
		return modelAndView;
	}
	
	// 캠핑로그 리스트 ( list1 )
	@RequestMapping("/community/camplog.do")
	public ModelAndView boardCamplog(BoardTO to) throws Exception {
		
		// 페이징 정보 설정
		if(to.getCpage() == 0) {
			to.setCpage(1);
		}
		to.setOffset((to.getCpage() - 1) * 5);
		
		// 게시판 조회
		to.setType("l");
		int totalCount = commService.boardListCount( to );
		
		List<BoardTO> boardLists = commService.boardList(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists", boardLists );
		modelAndView.addObject( "paging", new PagingVO( to.getCpage(), totalCount ) ); 
		
		modelAndView.setViewName("community/board_list1");
		return modelAndView;
	}

	// 캠핑꿀팁 리스트 ( list2 )
	@RequestMapping("/community/camptip.do")
	public ModelAndView boardCamptip(BoardTO to) throws Exception {
		
		// 페이징 정보 설정
		if(to.getCpage() == 0) {
			to.setCpage(1);
		}
		to.setOffset((to.getCpage() - 1) * 5);
		
		// 게시판 조회
		to.setType("t");
		int totalCount = commService.boardListCount( to );
		
		List<BoardTO> boardLists2 = commService.boardList(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists2", boardLists2 );
		modelAndView.addObject( "paging", new PagingVO( to.getCpage(), totalCount ) ); 
		
		modelAndView.setViewName("community/board_list2");
		return modelAndView;
	}

	// 캠핑가자 리스트 ( list3 )
	@RequestMapping("/community/campgo.do")
	public ModelAndView boardCampgo(BoardTO to) throws Exception {
		
		// 페이징 정보 설정
		if(to.getCpage() == 0) {
			to.setCpage(1);
		}
		to.setOffset((to.getCpage() - 1) * 5);
				
		// 게시판 조회
		to.setType("g");
		int totalCount = commService.boardListCount( to );
				
		List<BoardTO> boardLists3 = commService.boardList(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists3", boardLists3 );
		modelAndView.addObject( "paging", new PagingVO( to.getCpage(), totalCount ) ); 
		
		modelAndView.setViewName("community/board_list3");
		return modelAndView;
	}

	// 캠핑로그 글쓰기 ( write )
	@RequestMapping("/community/write.do")
	public ModelAndView boardWrite(BoardTO to) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community/board_write");
		
		return modelAndView;
	}
	
	// 캠핑꿀팁 글쓰기 ( write2 )
	@RequestMapping("/community/write2.do")
	public ModelAndView boardWrite2(BoardTO to) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community/board_write2");
		
		return modelAndView;
	}
	
	// 캠핑가자 글쓰기 ( write3 )
	@RequestMapping("/community/write3.do")
	public ModelAndView boardWrite3(BoardTO to) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community/board_write3");
		
		return modelAndView;
	}
	
	// 캠핑로그 글쓰기 ( writeOK )
	@RequestMapping("/community/writeOk.do")
	public ModelAndView boardWriteOk(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		BoardTO to = new BoardTO();
		
		to.setTitle( request.getParameter( "title" ) );
		to.setContent( request.getParameter( "content" ) );
		to.setPwd( request.getParameter( "pwd" ) );
		
		// 로그인 세션에서 조회
		to.setNick( request.getSession().getAttribute("nick").toString() );
		// to.setType( request.getParameter( "type" ) );
		// 타입 지정
		to.setType( "l" );
		
		int flag = commService.writeBoard( to );
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "flag", flag );
		
		modelAndView.setViewName("community/board_write_ok");
		return modelAndView;
	}
	
	// 캠핑꿀팁 글쓰기 ( writeOK2 )
	@RequestMapping("/community/writeOk2.do")
	public ModelAndView boardWriteOk2(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		BoardTO to = new BoardTO();
		
		to.setTitle( request.getParameter( "title" ) );
		to.setContent( request.getParameter( "content" ) );
		to.setPwd( request.getParameter( "pwd" ) );
		
		// 로그인 세션에서 조회
		to.setNick( request.getSession().getAttribute("nick").toString() );
		// to.setType( request.getParameter( "type" ) );
		// 타입 지정
		to.setType( "t" );
		
		int flag = commService.writeBoard( to );
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community/board_write_ok2");
		modelAndView.addObject( "flag", flag );
			
		return modelAndView;
	}
	
	// 캠핑가자 글쓰기 ( writeOK3 )
	@RequestMapping("/community/writeOk3.do")
	public ModelAndView boardWriteOk3(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		BoardTO to = new BoardTO();
		
		to.setTitle( request.getParameter( "title" ) );
		to.setContent( request.getParameter( "content" ) );
		to.setPwd( request.getParameter( "pwd" ) );
		
		// 로그인 세션에서 조회
		to.setNick( request.getSession().getAttribute("nick").toString() );
		// 타입 지정
		to.setType( "g" );
		
		int flag = commService.writeBoard( to );
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community/board_write_ok3");
		modelAndView.addObject( "flag", flag );
			
		return modelAndView;
	}

	// 캠핑톡톡 글보기  ( view )
	@RequestMapping("/community/view.do")
	public ModelAndView boardView(HttpServletRequest request) throws Exception {
		
		BoardTO to = new BoardTO();
		
		to.setPseq( Integer.parseInt(request.getParameter( "pseq" )) );
		to.setType( request.getParameter( "type" ) );
		
		// Param값과 상세 리턴값 구별
		BoardTO board = commService.viewBoard( to );
		
		// 모댓글 카운트
		ReplyTO reply = new ReplyTO();
		reply.setBno(to.getPseq());
		int totalCount = replyService.selectReplyCount(reply);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "board", board );
		modelAndView.addObject( "totalCount", totalCount );
		
		modelAndView.setViewName("community/board_view");
		return modelAndView;
	}
	
	// 캠핑톡톡 글수정 ( modify )
	@RequestMapping("/community/modify.do")
	public ModelAndView boardModify(HttpServletRequest request) throws Exception {
		
		BoardTO to = new BoardTO();
		
		to.setPseq( Integer.parseInt(request.getParameter( "pseq" )) );
		to.setType( request.getParameter( "type" ) );
		
		// Param값과 상세 리턴값 구별
		BoardTO board2 = commService.modifyBoard( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "board2", board2 );
		
		modelAndView.setViewName("community/board_modify");
		return modelAndView;
	}
	
	// 캠핑톡톡 글수정( modifyOk )
	@RequestMapping("/community/modifyOk.do")
	public ModelAndView boardModifyOk(HttpServletRequest request) throws Exception {
		
		BoardTO to = new BoardTO();
		
		to.setPseq( Integer.parseInt(request.getParameter( "pseq" )) );
		to.setNick( request.getSession().getAttribute("nick").toString() );
		to.setTitle( request.getParameter( "title" ) );
		to.setType( request.getParameter( "type" ) );
		to.setContent( request.getParameter( "content" ) );
		
		int flag = commService.modifyOkBoard( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "pseq", to.getPseq() );
		
		modelAndView.setViewName("community/board_modify_ok");
		return modelAndView;
	}
	
	/*
	// 캠핑톡톡 글삭제 ( delete )
	@RequestMapping("/community/delete.do")
	public ModelAndView boardDelete(HttpServletRequest request) throws Exception {
		
		BoardTO to = new BoardTO();
		
		to.setPseq( Integer.parseInt(request.getParameter( "pseq" )) );
		to.setType( request.getParameter( "type" ) );
		
		BoardTO board2 = commService.deleteBoard( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "board2", board2 );
		
		modelAndView.setViewName("community/board_delete");
		return modelAndView;
	}
	*/
	
	// 캠핑톡톡 글삭제 ( deleteOk )
	@RequestMapping("/community/deleteOk.do")
	public ModelAndView boardDeleteOk(HttpServletRequest request) throws Exception {
		
		BoardTO to = new BoardTO();
		
		to.setPseq( Integer.parseInt(request.getParameter( "pseq" )) );
		to.setPwd( request.getParameter( "pwd" ) );
		
		int flag = commService.deleteOkBoard( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "boardType", request.getParameter( "boardType" ) );
		
		modelAndView.setViewName("community/board_delete_ok");
		return modelAndView;
	}

	// 자주 묻는 질문 ( FAQ )
	@RequestMapping("/ask/faq.do")
	public ModelAndView boardFaq( BoardTO to ) throws Exception {
		
		to.setType( "f" );
		List<BoardTO> boardLists = commService.faqList( to );
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists", boardLists );
		
		modelAndView.setViewName("community/board_faq");
		return modelAndView;
	}

	// 공지사항 List
	@RequestMapping("/ask/notice.do")
	public ModelAndView boardNotice(BoardTO to) throws Exception {
		
		// 페이징 정보 설정
		if(to.getCpage() == 0) {
			to.setCpage(1);
		}
		to.setOffset((to.getCpage() - 1) * 5);
				
		// 게시판 조회
		to.setType("n");
		int totalCount = commService.boardListCount( to );
				
		List<BoardTO> boardLists4 = commService.noticeList(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "boardLists4", boardLists4 );
		modelAndView.addObject( "paging", new PagingVO( to.getCpage(), totalCount ) );

		modelAndView.setViewName("community/board_notice");
		return modelAndView;
	}
	
	// 공지사항 글보기  ( view2 )
	@RequestMapping("/community/view2.do")
	public ModelAndView boardView2(HttpServletRequest request) throws Exception {
			
		BoardTO to = new BoardTO();
		
		to.setNseq( request.getParameter( "nseq" ) );
		to.setType( request.getParameter( "type" ) );
			
		BoardTO board3 = commService.noticeView( to );
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject( "board3", board3 );
		
		modelAndView.setViewName("community/board_view2");
		return modelAndView;
	}
	
	//------------------------------- ck에디터
	// 파일업로드
	@PostMapping("/admin/resources/ckUpload")
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		 
		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
		System.out.println("uploadPath  : "+uploadPath);
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		 
		OutputStream out = null;
		PrintWriter printWriter = null;
		   
		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		 
		try {
			
			// 파일 이름 가져오기
			String fileName =  upload.getOriginalFilename(); 
			byte[] bytes = upload.getBytes();
		  
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" +fileName;
		  
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
		  
			//String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" +fileName; // 작성화면
		  
			// 업로드시 메시지 출력
			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			printWriter.println(json);
		  
			printWriter.flush();
			
			System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
			System.out.println("url : "+fileUrl);
			System.out.println("ckUploadPath : "+ckUploadPath);
			
		} catch (IOException e) { e.printStackTrace();
		} finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 return; 
	}
	
	
	// ------------------------------ 댓글관련
	
	// 모댓글 작성
	@ResponseBody
	@RequestMapping(value = "/community/camp_write_reply.do", method = { RequestMethod.POST })
	public ReplyTO write_reply(@RequestParam int bno, @RequestParam String content, HttpSession session) throws Exception {
		
		ReplyTO to = new ReplyTO();
		// 게시물 번호 세팅
		to.setBno(bno);
		
		// 댓글 내용 세팅
		to.setContent(content);

		// 댓글작성자 nick을 writer로 세팅
		to.setNick((String) session.getAttribute("nick"));
		
		//	값이 잘 넘어오는지 확인
		/*
		  System.out.println("controller bno: " + to.getBno());
		  System.out.println("controller content: " + to.getContent());
		  System.out.println("controller writer: " + to.getWriter());
		 */
		
		// +1된 댓글 갯수를 담아오기 위함
		ReplyTO result = replyService.writeReply(to);
		
		// 모댓글 카운트
		int totalCount = replyService.selectReplyCount(to);
		result.setTotalCount(totalCount);
		
		return result;
	}

	// 답글작성
	@ResponseBody
	@RequestMapping(value = "/community/camp_write_rereply.do", method = { RequestMethod.POST })
	public ReplyTO write_rereply(@RequestParam int bno, @RequestParam int rno, @RequestParam String content, HttpSession session) throws Exception {
		
		ReplyTO to = new ReplyTO();
		// 게시물 번호 세팅
		to.setBno(bno);
		
		// 댓글번호
		to.setRno(rno);
		
		// 댓글 내용 세팅
		to.setContent(content);

		// 댓글작성자 nick을 writer로 세팅
		to.setNick((String) session.getAttribute("nick"));
		
		// 답글 작성
		replyService.writeRereply(to);
		
		// 모댓글 카운트
		ReplyTO result = new ReplyTO();
		int totalCount = replyService.selectReplyCount(to);
		result.setTotalCount(totalCount);
		
		return result;
	}
		
	// 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/community/camp_replyList.do", method = { RequestMethod.GET })
	public List<ReplyTO> replyList(@RequestParam int bno, HttpSession session) throws Exception {
		
		ReplyTO to = new ReplyTO();
		// 게시물 번호 세팅
		to.setBno(bno);

		// 댓글 리스트 조회
		List<ReplyTO> result = replyService.replyList(to);
		
		return result;
	}
	
	// 모댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/community/camp_delete_reply.do", method = { RequestMethod.POST })
	public ReplyTO delete_reply(@RequestParam int bno, @RequestParam int rno,HttpSession session) throws Exception {
		
		ReplyTO to = new ReplyTO();
		// 게시물 번호 세팅
		to.setBno(bno);
		
		// 댓글 번호 셋팅
		to.setRno(rno);

		// 모댓글 삭제
		replyService.deleteReply(to);
		
		// 모댓글 카운트
		ReplyTO result = new ReplyTO();
		int totalCount = replyService.selectReplyCount(to);
		result.setTotalCount(totalCount);
		
		return result;
	}
	
	// 답글 삭제
	@ResponseBody
	@RequestMapping(value = "/community/camp_delete_rereply.do", method = { RequestMethod.POST })
	public ReplyTO delete_rereply(@RequestParam int bno, @RequestParam int rno, HttpSession session) throws Exception {
		
		ReplyTO to = new ReplyTO();
		// 게시물 번호 세팅
		to.setBno(bno);
				
		// 댓글 번호 셋팅
		to.setRno(rno);
		
		// 답글 삭제
		replyService.deleteRereply(to);
		
		// 댓글 카운트
		ReplyTO result = new ReplyTO();
		int totalCount = replyService.selectReplyCount(to);
		result.setTotalCount(totalCount);
		
		return result;
	}
}	
	
~~~

</div>
</details>
    
</br>
  
### 5-2 커뮤니티 게시판 View 담당 .jsp 파일 JSTL의 사용
  팀 프로젝트를 진행하면서 수업내용을 참고하여 HTML 코드 내에 Java 코드인 스크립틀릿을 사용하였지만  
  현재는 가독성이 떨어지고 View와 비즈니스 로직의 분리  JSTL을 많이 사용하므로 추세에 맞게   
  JSTL로 변경하는 작업을 진행하였습니다.
    
<details>
<summary><b>JSTL 적용 EX 1) </b></summary>

- 게시판 List 화면 출력을 위한 JSTL 사용
- 목록을 가진 List를 출력하기 위해 반복문인 <c:forEach>  
var=변수명 , items=List객체명 , varStatus=반복상태를알수있는 변수를 사용
- EL을 사용하여 리턴값 표현
<div markdown="1">

```html
<c:forEach var="board" items="${boardLists}" varStatus="status">
   <article>
	<div>
	   <a href="/community/view.do?cpage=${board.cpage}&pseq=${board.pseq}&type=${board.type}">${board.title}</a>
	</div>
	   <ul class="list-inline">
		<li class="list-inline-item">by <a href="" data-toggle="modal" data-target="#userprofile" onclick="userProfile('${board.nick}')">${board.nick}</a></li>
		<li class="list-inline-item">${board.wdate}</li>
	   </ul>
     </article>
  </c:forEach>
    
```

</div>
</details>
  
</br>
    
<details>
<summary><b>JSTL 적용 EX 2) </b></summary>

- 글쓰기 버튼 part에 JSTL 사용
- <c:choose> , <c:when> , <C:otherwise>를 사용하여 조건문 형태로 사용한다. 
- session 객체의 nick 값이 비어있는(= 로그인 X ) 상태에선 글쓰기 버튼을 누르면  
로그인을 하라는 알람창이 뜬다.
- 로그인된 상태라면, 글쓰기 버튼을 누르면 글쓰기창이 띄워지게 된다.
<div markdown="1">

```html
<!--  버튼 Part -->
<c:choose>
	<c:when test="${empty sessionScope.nick}">
		<input type="button" value="글쓰기" class="btn btn-transparent" style="float: right;" onclick="javascript:alert('로그인을 하셔야합니다.')" >
	</c:when>
	<c:otherwise>
		<input type="button" value="글쓰기" class="btn btn-transparent" style="float: right;" onclick="location.href='/community/write.do'" >
	</c:otherwise>
</c:choose>
	
```
	
</div>
</details>
  
</br>
    
<details>
<summary><b>JSTL 적용 EX 3) </b></summary>

- 게시글 상세보기 페이지 수정 / 삭제 버튼 JSTL 사용
- <c:if> 내 test속성이 참값이면 실행된다.
- Session 객체의 nick 값과 리턴 nick 값이 같으면 즉 자신이 쓴 글 상세보기 페이지안에서는  
수정/삭제 버튼이 생긴다.
<div markdown="1">

```html
<div style="float: right;">
	<c:if test="${board.nick eq sessionScope.nick }">
		<input type="button" value="수정" class="btn btn-transparent" onclick="location.href='/community/modify.do?pseq=${board.pseq}&type=${board.type}'" />
		<input type="button" value="삭제" id="dbtn" class="btn btn-transparent" onclick="location.href='/community/delete.do?pseq=${board.pseq}&type=${board.type}'" />
	</c:if>
</div>	
```

</div>
</details>

<div>
</details>
  
</br></br>

## 6. 트러블 슈팅
> 프로젝트를 진행하면서 겪었던 몇가지 문제점들과 해결방안을 기록하였습니다.

</br>

<details>
<summary><b>스프링 빈 객체 생성 중 특정 예외 발생 </b></summary>
<div markdown="1">
  
- 스프링 실행 중 아래 에러 메시지 발생  
`org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name ~`
  
- 해결    
해결방안으로는 보통 2가지를 확인해야 한다.
	- 어노테이션을 확인
	- Mapper.xml 쿼리문에 문제가 없는지 확인  
	
저의 경우에는 단순히 mapper.xml 안의 쿼리문 오타였기 때문에 수정해서 문제를 해결하였습니다.
  
</div>
</details>
    
</br>
    
<details>
<summary><b>게시판 상세보기 데이터 반환값 null </b></summary>
<div markdown="1">
    
  
  - 해결  
    - pseq 파라미터값 부분 브레이킹 포인트 만든 후, 디버그 모드로 실행하고  
      데이터값이 잘 나오는지 확인  
      => 리턴값이 다 Null로 나온다.  
  
    - 왜 리턴값이 Null인지 확인하기 위해서, DBMS 툴(하이디SQL)을 통해서 쿼리문을 확인
      => 정상 작동 확인  
  
    - CommServiceImpl.java에서 비즈니스 로직이 리턴을 해주는지 확인  
      => 파라미터값을 리턴하고 있는 로직을 수정해서 문제를 해결하였습니다.
  
</div>
</details>

</br>
    
<details>
<summary><b>MariaDB 외래키, 메인키 컬럼 설정 오류 발생</b></summary>
<div markdown="1">
  
- 에러 메시지 발생  
`errno: 150 "Foreign Key constraint incorrectly formed`
  
- 해결  
이 에러메시지를 본다면 몇 가지를 확인해야 한다.
	- 데이터의 타입이 같은지?  
	=> Main 키가 INT이면 외래키도 INT 이여야 한다.
	
	- Main 키와 외래키 모두 NOT NULL 체크되어있는지 확인한다.
	
	- 참조하는 키(Reference Key)가 메인키 혹은 유니크 키인지 확인한다.
  
</div>
</details>

</br>
    
<details>
<summary><b>쿼리문은 정상으로 실행되지만, 리턴값이 안뜰 때</b></summary>
<div markdown="1">
  	
- 해결  
	- resultType 속성은 Mybatis에서 select 된 데이터를 어떤 자바 객체에 매핑할지  지정해주는 것이다.	
	- parameterType은 생략이 가능하나 resultType의 select 엘리먼트에서 생략될 수 없는 속성이다.
  
</div>
</details>

</br></br>

## 7. 회고 / 느낀점
    
> 책과 온라인을 통해서 이미 동작하는 코드들로 구성된 예제들을 반복 학습하는 것과 스스로 생각하고 코딩하며 서비스를 만드는 것은  
> 정말 큰 차이가 있다는 것을 이번 기회를 통해 깨달았고 또한, 이러한 방법은 자기 개발 측면에서 한계가 있다는 것을 절감하였습니다.
> 한편으로는, 내가 생각한 코드와 구글링을 통한 코드를 함께 사용하면서 문제들과 마주했지만  
> 문제들을 해결하는 과정에서 새로운 개념에 대해 알게 되고 밤낮으로 끊임없는 고민을 통해 해결했을 때는  
> 성취감과 개발의 재미를 느끼게 되는 순간이었고 팀원과의 회의를 통해서 문제 해결에 대한 실마리를 알았을 때에는  
> 다시 한번 동료와의 커뮤니케이션의 필요성과 협업의 중요성 또한 알게 되는 순간이었습니다.
> 제가 생각하는 개발자는 끊임없이 문제들과 직면하고 끝끝내 해결해야 하는 일이기에  
> 결국은 역량을 발전시키는 것이 정답이란 생각을 하고 이를 위해서 어떻게 학습을 해야 하는지  
> 매 순간 시간을 허투루 쓰지 않겠다는 각오를 다시금 다지게 되는 좋은 기회였습니다.
    
</br></br>
