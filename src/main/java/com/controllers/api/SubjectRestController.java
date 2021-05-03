package com.controllers.api;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model.entities.AccountExam;
import com.model.entities.Exam;
import com.model.entities.Subject;
import com.model.models.ApiReturnResult;
import com.model.models.ApiSubjectModel;
import com.services.IApiAccountExamService;
import com.services.IApiAccountService;
import com.services.IApiExamService;
import com.services.IApiLevelService;
import com.services.IApiSubjectService;

@RestController
public class SubjectRestController extends ApiBaseController {

	// lấy danh sách subject
	private @Autowired IApiSubjectService iApiSubjectService;
	// lấy danh sách exam
	private @Autowired IApiExamService iApiExamService;
	// lấy danh sách account exam
	private @Autowired IApiAccountExamService iApiAccountExamService;
	private @Autowired IApiAccountService iApiAccountService;
	// lấy đối tượng Level
	private @Autowired IApiLevelService iApiLevelService;

	// lấy tất cả những môn và số bài kiểm tra cho từng môn
	@RequestMapping(value = "/subject/search", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> fetchAllSubject(@RequestHeader String token) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			// kiểm tra có user id hay không
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));
			if (checkAccount > 0) {
				List<ApiSubjectModel> modelSubjects = iApiSubjectService.fetchAllSubject();
				List<Subject> subjects = iApiSubjectService.getAllSubjectInEntities();

				for (int i = 0; i < subjects.size(); i++) {
					// lấy danh sách những bài thi của môn học đó
					List<Exam> exams = iApiExamService.getListExams(subjects.get(i).getId());
					Integer count = 0;
					for (int j = 0; j < exams.size(); j++) {
						// tìm xem có phải thuộc của danh sách đó không
						AccountExam accountExam = iApiAccountExamService
								.fetchAllExamOfAccount(Integer.parseInt(decodedString), exams.get(j).getId());
						if (accountExam != null) {
							// lấy đối tượng Level thuộc bài kiểm tra đó
							count += 1;
						} else {
							count += 0;
						}
					}
					modelSubjects.get(i).setTotalExam(count);
//					// đếm số bài thi của account đã làm
//					Integer totalExamUserDone = iApiAccountExamService
//							.countTotalExamUserDone(Integer.parseInt(decodedString));
//					modelSubjects.get(i).setTotalExamUserDone(totalExamUserDone);
				}
				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(modelSubjects);

				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<Object>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không lấy được thông tin môn học");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}
}
