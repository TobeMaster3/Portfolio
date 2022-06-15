# :pushpin: CAMPER
> 캠핑족을 위한 웹 커뮤니티 사이트 구축  
> url : 

</br>

## :bookmark: 목차
1. [제작기간 & 참여인원](#1-제작기간--참여인원)
2. [맡은 역할](#2-맡은-역할)
3. [사용 기술](#3-사용-기술)
4. [ERD 설계](#4-ERD-설계)
5. [핵심 기능](#5-핵심-기능)
6. [추가 변경사항](#6-추가-변경사항)
7. [트러블 슈팅](#7-트러블-슈팅)
8. [회고 / 느낀점](#8-회고--느낀점)

</br></br>

## 1. 제작기간 & 참여인원
- 2022 02월 15일 ~ 03월 15일
- 팀 프로젝트 ( 4인 )

</br></br>

## 2. 맡은 역할
1. 프로젝트 세부 기획
  - 시퀀스 다이어그램 작성
  - 유스케이스 다이어그램 작성
  - 테이블 명세서 작성
  - 물리적 ERD 작성

</br>

2. 커뮤니티 페이지 개발
  - 글 리스트 / 등록 / 수정 / 삭제 기능 구현
  - 웹 에디터인 CK Editor 적용 
  - 글쓴이 닉네임 클릭시 프로필 모달창

</br>

3. 고객센터 페이지 개발
  - 부트스트랩 아코디언 형식
  - 관리자인 사용자만 글 등록 가능

</br></br>

## 3. 사용 기술
#### `Back-end`
  - Java 11
  - Spring Boot 5.3.2

#### `Front-end`
  - HTML
  - css
  - JavaScript

#### `Develpment Environment`
<p align="center">
<img src="https://user-images.githubusercontent.com/107043926/173319952-bf310141-537e-4820-88dc-05bb27d17615.png"
     width="1000" height="400">
</p>

</br></br>

## 4. ERD 설계
<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/107043926/173349847-2f931a2d-9fdb-49c1-907f-73e442e0a997.png">
</p>

</br></br>

## 5. 핵심 기능
> 팀 프로젝트를 끝낸 후, 완성하지 못한 기능이나  
> 미흡한 점을 보완하고자 홀로 진행하게 되었습니다.

</br>

<details>
<summary><b>핵심 기능 설명 보기</b></summary>
<div markdown="1">
  
<div>
</details>
  
</br></br>


## 6. 추가 변경사항
> 팀 프로젝트를 끝낸 후, 완성하지 못한 기능이나  
> 미흡한 점을 보완하고자 홀로 진행하게 되었습니다.

</br>

   <details>
<summary><b>추가 변경사항 보기</b></summary>
<div markdown="1">

### 6-1 커뮤니티 게시판 MyBatis 프레임워크로 변경
  SQL문이 프로그래밍 소스 코드로부터 완전히 분리되어 아래 3가지 기능이 향상되므로  
  변경이 필수라고 생각했고 추가 진행사항으로 결정하고 실행에 옮겼습니다.
  - 코드의 간결성
  - 유지보수성 향상
  - 이식성 향상
  
  </br>
  
  기존 프로젝트의 디렉터리구조를 Mybatis를 적용시켜 아래와 같은 디렉터리 구조로 만들었습니다.
  
  </br>
  
  <p align="center">
  <img src="https://user-images.githubusercontent.com/107043926/173869875-78432eca-94d9-4c96-88d4-de3a37f387d8.png">
  </p>
  
  </br>
  
  <p align="center">
  <img src="https://user-images.githubusercontent.com/107043926/173869968-3ba6bafc-bd90-4927-b508-43c9d492c635.png">
  </p>
    
  </br>
  
  Mybatis 프레임워크를 적용하기 위해서 4개의 파일을 작성하고 Controller을 수정했습니다.
  <details>
  <summary><b>CommMapper.xml 코드 확인 📍 </b></summary>
  <div markdown="1">
  
     - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

  ```html
  /**
   * CommMapper.xml
   */
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE mapper 
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  <mapper namespace="com.camper.mapper.CommMapper">
      <!-- 게시판 Mapper.xml -->

      <!-- 커뮤니티 메인페이지 3개 List -->
      <select id="boardMain" parameterType="com.camper.model.BoardTO" resultType="com.camper.model.BoardTO">
          SELECT pseq
                  , title
                  , nick
                  , type
                  , date_format( wdate, '%y-%m-%d' ) wdate
          FROM p_table
          WHERE type="#{type}"
          ORDER BY pseq desc limit 0,5
      </select>


      <!-- 커뮤니티 캠핑로그 List -->
      <select id="camplogList" parameterType="com.camper.model.BoardTO" resultType="com.camper.model.BoardTO">
          SELECT pseq
                  , title
                  , nick
                  , type
                  , date_format( wdate, '%y-%m-%d' ) wdate
          FROM p_table
          WHERE type="l"
          ORDER BY pseq desc


      <!-- 커뮤니티 캠핑꿀팁 List -->
      <select id="camplogList" parameterType="com.camper.model.BoardTO" resultType="com.camper.model.BoardTO">
          SELECT pseq
                  , title
                  , nick
                  , type
                  , date_format( wdate, '%y-%m-%d' ) wdate
          FROM p_table
          WHERE type="t"
          ORDER BY pseq desc
      </select>


      <!-- 커뮤니티 캠핑가자 List -->
      <select id="camplogList" parameterType="com.camper.model.BoardTO" resultType="com.camper.model.BoardTO">
          SELECT pseq
                  , title
                  , nick
                  , type
                  , date_format( wdate, '%y-%m-%d' ) wdate
          FROM p_table
          WHERE type="g"
          ORDER BY pseq desc


      <!-- 커뮤니티 게시물 보기 -->
      <select id="viewBoard" pparameterType="com.camper.model.BoardTO">
          SELECT title
                  , nick
                  , date_format( wdate, '%y-%m-%d' ) wdate
                  , content
                  , type 
          FROM p_table 
          WHERE pseq = #{pseq}
      </select>   


      <!-- 커뮤니티 게시물 등록 -->
      <insert id="writeBoard" parameterType="com.camper.model.BoardTO">
          INSERT INTO p_table 
          VALUES( 0, #{title}, #{nick}, #{pwd}, #{content}, #{type}, now(), #{heart}, #{preply} )


      <!-- 커뮤니티 게시물 삭제 -->
      <delete id="deleteBoard" parameterType="com.camper.model.BoardTO">
          DELETE FROM p_table 
          WHERE pseq = #{pseq} AND pwd = #{pwd}
      </delete>


      <!-- 게시물 수정 -->
      <update id="modifyBoard" parameterType="com.camper.model.BoardTO">
          UPDATE p_table SET title = #{title}, content = #{content} 
          WHERE pseq = #{pseq}
      </update>


      <!-- 공지사항 List -->
      <select id="noticeList" parameterType="com.camper.model.BoardTO" resultType="com.camper.model.BoardTO">
          SELECT nseq
                  , title
                  , nick
                  , type
                  , date_format( wdate, '%y-%m-%d' ) wdate 
          FROM n_board 
          WHERE type = 'n'
          ORDER BY nseq desc
      </select>


      <!-- 공지사항 게시물 보기 -->
      <select id="noticeView" parameterType="com.camper.model.BoardTO">
          SELECT title
                  , nick
                  , date_format( wdate, '%y-%m-%d' ) wdate
                  , content
                  , type
          FROM n_board 
          WHERE nseq = #{nseq}
      </select>  


      <!-- FAQ List -->
      <select id="faqList" parameterType="com.camper.model.NboardTO" resultType="com.camper.model.NboardTO">
          SELECT nseq
                  , title
                  , nick
                  , content
                  , date_format(wdate, '%Y-%m-%d' ) wdate
          FROM n_board 
          WHERE type = 'f' 
          ORDER BY nseq desc
      </select>
  </mapper>
  ```

  </div>
  </details>
    
  </br>
  
  <details>
  <summary><b>CommMapper.java 코드 확인 📍 </b></summary>
  <div markdown="1">

  ~~~java
  /**
   * CommMapper.java 
   */
  package com.camper.mapper;

  import java.util.ArrayList;

  import org.apache.ibatis.annotations.Mapper;

  import com.camper.model.BoardTO;
  import com.camper.model.NboardTO;


  @Mapper
  public interface CommMapper {

    // 커뮤니티 메인페이지 3개 List
    public List<BoardTO> boardMain( BoardTO to );

    // 커뮤니티 캠핑로그 List
    public List<BoardTO> camplogList( BoardTO to );

    // 커뮤니티 캠핑꿀팁 List
    public List<BoardTO> camptipList( BoardTO to );

    // 커뮤니티 캠핑가자 List
    public List<BoardTO> campgoList( BoardTO to );

    // 커뮤니티 게시글 보기
    public void viewBoard( BoardTO to );

    // 커뮤니티 게시글 등록
    public void writeBoard( BoardTO to );

    // 커뮤니티 게시글 삭제
    public void deleteBoard( BoardTO to );

    // 커뮤니티 게시글 수정
    public void modifyBoard( BoardTO to );

    // 공지사항 게시글 List
    public List<BoardTO> noticeList( BoardTO to );

    // 공지사항 게시글 보기
    public void noticeView( BoardTO to );

    // FAQ 게시글 List
    public List<NboardTO> faqList( NboardTO to );
  }
  ~~~

  </div>
  </details>
  
  </br>
   
  <details>
  <summary><b>CommService.java 코드 확인 📍 </b></summary>
  <div markdown="1">

  ~~~java
  /**
   * CommService.java
   */
  package com.camper.service;

  import java.util.ArrayList;

  import com.camper.model.BoardTO;
  import com.camper.model.NboardTO;

  public interface CommService {

      // 커뮤니티 메인페이지 3개 List
      public List<BoardTO> boardMain( BoardTO to ) throws Exception;

      // 커뮤니티 캠핑로그 List
      public List<BoardTO> camplogList( BoardTO to ) throws Exception;

      // 커뮤니티 캠핑꿀팁 List
      public List<BoardTO> camptipList( BoardTO to ) throws Exception;

      // 커뮤니티 캠핑가자 List
      public List<BoardTO> campgoList( BoardTO to ) throws Exception;

      // 커뮤니티 게시글 보기
      public void viewBoard( BoardTO to ) throws Exception;

      // 커뮤니티 게시글 등록
      public void writeBoard( BoardTO to ) throws Exception;

      // 커뮤니티 게시글 삭제
      public void deleteBoard( BoardTO to ) throws Exception;

      // 커뮤니티 게시글 수정
      public void modifyBoard( BoardTO to ) throws Exception;

      // 공지사항 게시글 List
      public List<BoardTO> noticeList( BoardTO to ) throws Exception;

      // 공지사항 게시글 보기
      public void noticeView( BoardTO to ) throws Exception;

      // FAQ 게시글 List
      public List<NboardTO> faqList( NboardTO to ) throws Exception;
    }
  ~~~

  </div>
  </details>
    
  </br>

  <details>
  <summary><b>CommServiceImpl 코드 확인 📍 </b></summary>
  <div markdown="1">

  ~~~java
  /**
   * 게시물 필터 (Tag Name)
   */
  package com.camper.service.impl;

  import java.util.List;

  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.stereotype.Service;

  import com.camper.mapper.CommMapper;
  import com.camper.model.BoardTO;
  import com.camper.model.NboardTO;
  import com.camper.service.CommService;

  import lombok.extern.slf4j.Slf4j;

  @Slf4j
  @Service
  public class CommServiceImpl implements CommService {

    @Autowired
    public CommMapper commMapper;

    @Override
    public List<BoardTO> boardMain(BoardTO to) throws Exception {
      List<BoardTO> list = null;

      try {
        list = commMapper.boardMain( to );
      } catch (Exception e) {
        log.error( "[게시판 메인 에러]" + e.getMessage() );
      }

      return list;
    }


    @Override
    public List<BoardTO> camplogList(BoardTO to) {
      List<BoardTO> list = null;

      try {
        list = commMapper.campgoList( to );
      } catch (Exception e) {
        log.error( "[게시판 리스트 에러]" + e.getMessage() );
      }

      return list;
    }

    @Override
    public List<BoardTO> camptipList(BoardTO to) throws Exception {
      List<BoardTO> list = null;

      try {
        list = commMapper.camptipList( to );
      } catch (Exception e) {
        log.error( "[게시판 리스트 에러]" + e.getMessage() );
      }

      return list;
    }

    @Override
    public List<BoardTO> campgoList(BoardTO to) throws Exception {
      List<BoardTO> list = null;

      try {
        list = commMapper.campgoList( to );
      } catch (Exception e) {
        log.error( "[게시판 리스트 에러]" + e.getMessage() );
      }

      return list;
    }

    @Override
    public void viewBoard(BoardTO to) throws Exception {
      try {
        commMapper.viewBoard( to );
      } catch (Exception e) {
        // TODO Auto-generated catch block
        log.error( "[게시글 보기 에러]" + e.getMessage() );
      }
    }

    @Override
    public void writeBoard(BoardTO to) throws Exception {
      try {
        commMapper.writeBoard( to );
      } catch (Exception e) {
        // TODO Auto-generated catch block
        log.error( "[게시판 글등록 에러]" + e.getMessage() );
      }
    }

    @Override
    public void deleteBoard(BoardTO to) throws Exception {
      try {
        commMapper.deleteBoard( to );
      } catch (Exception e) {
        // TODO Auto-generated catch block
        log.error( "[게시판 글삭제 에러]" + e.getMessage() );
      }
    }

    @Override
    public void modifyBoard(BoardTO to) throws Exception {
      try {
        commMapper.modifyBoard( to );
      } catch (Exception e) {
        // TODO Auto-generated catch block
        log.error( "[게시판 글수정 에러]" + e.getMessage() );
      }
    }

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

    @Override
    public void noticeView(BoardTO to) throws Exception {
      try {
        commMapper.noticeView( to );
      } catch (Exception e) {
        // TODO Auto-generated catch block
        log.error( "[공지사항 글보기 에러]" + e.getMessage() );
      }
    }

    @Override
    public List<NboardTO> faqList(NboardTO to) throws Exception {
      List<NboardTO> list = null;

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
  <summary><b>CommController.java 코드 확인 📍 </b></summary>
  <div markdown="1">

  ~~~java
  /**
   * COmmController.java
   */
  
  ~~~

  </div>
  </details>
    
  </br>
  
#### 6-2 구현하지 못했던 게시물 검색 기능
  프로젝트 구현 당시 다른 팀원이 검색기능을 구현 못했지만, 검색기능은 게시판 있어서  
  필수인 기능이라고 생각했고 추가 진행사항으로 결정하고 실행에 옮겼습니다.
  
  </br>
  
#### 6-3 서버 구축 및 배포
  

<div>
</details>
  
</br></br>

## 7. 트러블 슈팅
> 팀 프로젝트를 진행하면서 겪었던 에러와  
> 어떻게 해결하였는지를 기록하였습니다.

</br>

<details>
<summary><b>기존코드</b></summary>
<div markdown="1">
</div>
</details>

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">
</div>
</details>

</br></br>

## 8. 회고 / 느낀점

</br></br>
