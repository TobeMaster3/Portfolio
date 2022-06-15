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
  
  Mybatis 프레임워크를 적용하기 위해서는 4개의 파일을 작성하고 Controller을 수정했습니다.
  - Mapper.xml :check: 코드확인
  - Mapper.java :check: 코드확인
  - Service.java :check: 코드확인
  - ServiceImpl.java :check: 코드확인
  - Controller.java :check: 코드확인
  
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
