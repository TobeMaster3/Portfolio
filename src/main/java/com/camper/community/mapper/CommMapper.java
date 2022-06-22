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
