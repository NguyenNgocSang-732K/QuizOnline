package com.controllers.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.services.apiService.IApiAccountExamService;
import com.services.apiService.IApiExamService;
import com.services.apiService.IApiQuestionExamService;

@RestController
public class ExamRestController extends ApiBaseController {

	// lấy danh sách exam
	private @Autowired IApiExamService iApiExamService;
	// lấy danh sách account exam
	private @Autowired IApiAccountExamService iApiAccountExamService;
	// lấy QuustionExam
	private @Autowired IApiQuestionExamService iApiQuestionExamService;

//	// search danh sách exam của môn học đó
//	@RequestMapping(value = "/exam/search/bySubject", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
//	public ResponseEntity<ApiReturnResult> examSearchBySeach(@RequestBody Subject subject,
//			@RequestHeader String token) {
//		try {
//			ApiReturnResult apiReturnResult = new ApiReturnResult();
//
//			// parse token
//			byte[] decodedBytes = Base64.getDecoder().decode(token);
//			String decodedString = new String(decodedBytes);
//			// lấy danh sách Exam
//			List<ApiExamModel> apiExams = new ArrayList<ApiExamModel>();
//
//			List<Exam> exams = iApiExamService.getListExams(subject.getId());
//			for (int i = 0; i < exams.size(); i++) {
//				AccountExam accountExam = iApiAccountExamService.fetchAllExamOfAccount(Integer.parseInt(decodedString),
//						exams.get(i).getId());
//				if (accountExam != null) {
//					ApiLevelModel apiLevelModel = new ApiLevelModel(accountExam.getExam().getLevel().getId(),
//							accountExam.getExam().getLevel().getName());
//
//					Integer totalQuestion = iApiQuestionExamService.countTotalQuestion(accountExam.getExam().getId());
//					// phần này cần thảo luận lại
//					Integer totalQuestionTrue = 0;
//
//					boolean examDone;
//					if (i == 0) {
//						examDone = true;
//					} else {
//						examDone = false;
//					}
//
//					double scoreExam = 15;
//					double timeExam = 40;
//
//					ApiExamModel apiExamModel = new ApiExamModel(accountExam.getExam().getId(),
//							accountExam.getExam().getCode(), accountExam.getExam().getName(),
//							accountExam.getExam().getStatus(), accountExam.getExam().getCreatedDate(),
//							accountExam.getExam().getCreatedBy(), apiLevelModel, examDone, totalQuestion,
//							totalQuestionTrue, scoreExam, timeExam);
//
//					apiExams.add(apiExamModel);
//				}
//			}
//			apiReturnResult.setStatucCode(0);
//			apiReturnResult.setStatusMessage("success");
//			apiReturnResult.setData(apiExams);
//			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
//		} catch (Exception e) {
//			return new ResponseEntity<ApiReturnResult>(HttpStatus.BAD_REQUEST);
//		}
//	}

}
