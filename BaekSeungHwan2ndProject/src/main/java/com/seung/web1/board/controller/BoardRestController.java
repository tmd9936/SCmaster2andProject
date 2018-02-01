package com.seung.web1.board.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.seung.web1.board.dao.BoardDAO;
import com.seung.web1.board.vo.Board;
import com.seung.web1.board.vo.Reply;
import com.seung.web1.common.util.FileService;

@Controller
@RequestMapping(value="board")
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	final String uploadPath = "/boardfile";
	
	@Autowired
	BoardDAO dao;
	
	@ResponseBody
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public String fileupload(MultipartHttpServletRequest request) {
        Iterator<String> itr =  request.getFileNames();
        String fullpath = "";
        if(itr.hasNext()) {
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(request.getServletContext().getRealPath("/resource/image/"));
            try {
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
        		if (!mpf.isEmpty()) {
        			String savedfile = FileService.saveFile(mpf, request.getServletContext().getRealPath("/resources/image/"));
        			fullpath =  "../resources/image/" +savedfile;
        		}
            } catch (IOException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
            logger.info("확인");
            return fullpath;
        } else {
            return fullpath;
        }
    }
	
	@RequestMapping(value="insertBoard", method=RequestMethod.POST)
	public String insertBoard(Board board,MultipartFile upload,Model model) {
		logger.info("글쓰기 시작");
		this.uploadFile(upload,board);
		System.out.println(dao.insertBoard(board));
		
		model.addAttribute("groupnum", board.getGroupnum());
		logger.info("글쓰기 종료");
		return "redirect:../group/groupForm";
	}
	
	@RequestMapping(value="download",method=RequestMethod.GET)
	public void downloadFile(int boardnum,HttpServletResponse resoponse){
		Board board = dao.selectBoard(boardnum);
		//서버에 있는 서버경로의 파일이름을 사용자가 저장한 파일이름으로 바꿔서 보내줘야됨
		//원본파일명
		String originalFileName = board.getOriginalfile();
		
		//response의 Header영역에 원본 파일 이름을 인코딩해서 등록, 이거 안하면 오픈만 되고 다운로드가 안됨
		try {
			//setHeader 설정추가 ,attachment 전달, 그리고 한글로도 잘 전달 할 수 있게 인코딩
			resoponse.setHeader("Content-Disposition", "attachment;filename="
		+URLEncoder.encode(originalFileName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//파일이 저장된 전체 경로
		String fullPath = uploadPath+"/"+board.getSavedfile();
		//서버에 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력 스트림이 필요함
		//내 pc에있는거를 가져오는 활동이니까 file스트림으로 가능 
		FileInputStream fis = null;
		//다른 pc로 보낼 때는 위치가 어딘지 모르니까 서블릿으로 출력을 함
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(fullPath);
			sos = resoponse.getOutputStream();
			
			//스프링 전용 함수인데 앞에 input스트림의 파일을 읽어서 뒤에 output스트림을 타고 보내줌
			//FileCopyUtils.copy(fis, sos);
			
			byte[] b = new byte[fis.available()];
			int count = 0;
			while((count = fis.read(b)) != -1){
				sos.write(b, 0, count);
			}
				
			fis.close();
			sos.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String deleteBoard(Model model,int boardnum,int groupnum,HttpSession session) {
		logger.info("보드 지우기 시작");
		String id = (String)session.getAttribute("id");
		Board board = new Board();
		board.setBoardnum(boardnum);
		board.setId(id);
		System.out.println(dao.deleteBoard(board));
		
		model.addAttribute("groupnum", groupnum);
		logger.info("보드 지우기 종료");
		return "redirect:../group/groupForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Model model, MultipartFile upload, Board aftboard) {
		logger.info("보드 수정 시작");
		Board preboard = dao.selectBoard(aftboard.getBoardnum());
		if((preboard.getOriginalfile() !=null && preboard.getSavedfile() !=null)) {
			if(!upload.isEmpty()) {
				String fullpath = uploadPath+"/"+preboard.getSavedfile();
				FileService.deleteFile(fullpath);
				this.uploadFile(upload, aftboard);
			}
		}else{
			this.uploadFile(upload, aftboard);
		}
		
		model.addAttribute("groupnum", preboard.getGroupnum());
		System.out.println(dao.updateBoard(aftboard));
		logger.info("보드 수정 종료");
		return "redirect:../group/groupForm";
	}
	
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReply(Model model,Reply reply,int groupnum) {
		logger.info("리플 입력 시작");
		System.out.println(dao.insertReply(reply));
		
		model.addAttribute("groupnum",groupnum);
		logger.info("리플 입력 종료");
		return "redirect:../group/groupForm";
	}
	
	@RequestMapping(value="deleteReply", method=RequestMethod.GET)
	public String deleteReply(Model model,HttpSession session, Reply reply,int groupnum) {
		logger.info("리플 삭제 시작");
		String id = (String)session.getAttribute("id");
		reply.setId(id);
		System.out.println(dao.deleteReply(reply));
		
		model.addAttribute("groupnum", groupnum);
		logger.info("리플 삭제 종료");
		return "redirect:../group/groupForm";
	}
	
	
	@RequestMapping(value="updateReply",method=RequestMethod.POST)
	public String updateReply(Model model,HttpSession session, Reply reply,int groupnum) {
		logger.info("리플 업데이트 시작");
		String id = (String)session.getAttribute("id");
		reply.setId(id);
		System.out.println(dao.updateReply(reply));
		
		model.addAttribute("groupnum", groupnum);
		logger.info("리플 업데이트 종료"); 
		return "redirect:../group/groupForm";
		
	}
	
	//scrollBoard
	//List<HashMap<String, Object>> boardList =  boardDAO.boardList(groupnum);
	
	@ResponseBody
	@RequestMapping(value="scrollBoard", method=RequestMethod.GET)
	public List<HashMap<String, Object>> scrollBoard(int page, int groupnum){
		logger.info("스크롤링 시작");

		List<HashMap<String, Object>> allBoardList =  dao.boardList(groupnum);
		int mincount = (page-1)*4;
		int maxcount = page*4;
		if(allBoardList.size()-1 < maxcount) {
			maxcount = allBoardList.size()-1;
		}
		List<HashMap<String, Object>> boardList = allBoardList.subList(mincount, maxcount);
		
		logger.info("스크롤링 종료");
		return boardList;
	}
	
	public void uploadFile(MultipartFile upload,Board board){
		if(!upload.isEmpty()){
			//실제로 파일을 저장할 경로에 파일 저장
			String savedfile = FileService.saveFile(upload, uploadPath);
			//boardVO에 originalfile명과 savedfile명을 셋팅!!
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savedfile);
		}
	}
	
}




