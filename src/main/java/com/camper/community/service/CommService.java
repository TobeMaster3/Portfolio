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
