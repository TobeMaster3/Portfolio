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
