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
