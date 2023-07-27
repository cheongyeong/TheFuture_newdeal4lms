package kr.happyjob.study.admhrd.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.admhrd.dao.AdmHrdDao;
import kr.happyjob.study.admhrd.model.TeacherModel;
import kr.happyjob.study.common.comnUtils.FileUtilCho;


@Service
public class AdmHrdServiceImpl implements AdmHrdService {

	// Set logger // 로그를 남기기 위해 logger 객체 생성. 현재 클래스의 logger를 가져옴
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger //현재 클래스의 이름을 가져와 문자열로 정렬
	private final String className = this.getClass().toString();
	
	// 의존성 주입을 위해 MngNotDao 인터페이스의 구현체를 자동으로 주입
	@Autowired
	AdmHrdDao admHrdDao;
	
	
	/** 목록 조회 */
	// admHrdDao 객체의 teacherlit 메서드를 호출하여TeacherModel 리스트를 가져옴
	public List<TeacherModel> teacherlist(Map<String, Object> paramMap) throws Exception {
		//teacherlist메서드는 admHrdDao.teacherlist(paramMap)의 결과인 Lit를 반환
		//즉, 데이터베이스에서 조회한 강사 리스트를 호출한 쪽에서 받아서 사용할 수 있게됨
		return admHrdDao.teacherlist(paramMap);
	}
	
	/** 목록 카운트 조회 */
	public int countteacherlist(Map<String, Object> paramMap) throws Exception {
		return admHrdDao.countteacherlist(paramMap);
	}
	
	/** 회원정보(비고) 수정 */
	public void userEtc(Map<String, Object> paramMap) throws Exception {
		admHrdDao.userEtc(paramMap);
	}
	
	/** 승인여부 */
	public void approval(String loginID) throws Exception {
		admHrdDao.approval(loginID);
	}	
	
	/** 탈퇴 */
	public void teacherWithdrawal(String loginID)  throws Exception {
		admHrdDao.teacherWithdrawal(loginID);
	}
	
	/* 한건 조회 */
	public TeacherModel teacherselectone(Map<String, Object> paramMap) throws Exception {
		return admHrdDao.teacherselectone(paramMap);
	}
	
	/* 한건 조회 강의 */
	public List<TeacherModel> teacherselectonelec(Map<String, Object> paramMap) throws Exception {
		return admHrdDao.teacherselectonelec(paramMap);
	}
}
