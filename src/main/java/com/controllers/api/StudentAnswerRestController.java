package com.controllers.api;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model.entities.Account;
import com.model.entities.Answer;
import com.model.entities.ExamQuestion;
import com.model.entities.StudentAnswer;
import com.model.models.ApiAnswersOfStudent;
import com.model.models.ApiQuestionExamModel;
import com.model.models.ApiReturnResult;
import com.services.apiService.IApiAccountService;
import com.services.apiService.IApiQuestionExamService;
import com.services.apiService.IApiStudentAnswerService;

@RestController
public class StudentAnswerRestController extends ApiBaseController {

	private @Autowired IApiQuestionExamService iApiQuestionExamService;
	private @Autowired IApiStudentAnswerService iApiStudentAnswerService;
	private @Autowired IApiAccountService iApiAccountService;

	@RequestMapping(value = "/result", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> getResult(@RequestHeader String token,
			@RequestBody ApiAnswersOfStudent answersOfStudent) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();

			// account_Id
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));
			if (checkAccount > 0) {
				if(answersOfStudent.getAnswer_id() != null) {
					int account_Id = Integer.parseInt(decodedString);

					ApiQuestionExamModel apiQuestionExamModel = iApiQuestionExamService
							.getQuestionExamId(answersOfStudent.getExam_id(), answersOfStudent.getQuestion_id());
					// id của exam_question_id
					int exam_question_Id = apiQuestionExamModel.getId();
					int answer_Id = answersOfStudent.getAnswer_id();

					StudentAnswer studentAnswer = new StudentAnswer();
					studentAnswer.setCreatedDate(new Date());
					studentAnswer.setCreatedBy(account_Id);
					Account account = new Account();
					account.setId(account_Id);
					studentAnswer.setAccount(account);
					ExamQuestion examQuestion = new ExamQuestion();
					examQuestion.setId(exam_question_Id);
					studentAnswer.setExamQuestion(examQuestion);
					Answer answer = new Answer();
					answer.setId(answer_Id);
					studentAnswer.setAnswer(answer);
					
					//check đã có câu trả lời đó chưa nếu rồi thì update
					
					StudentAnswer checkStudentAnswer = iApiStudentAnswerService.checkStudentAnswer(account_Id, exam_question_Id);
					if(checkStudentAnswer != null) {
						studentAnswer.setId(checkStudentAnswer.getId());
					}
					
					iApiStudentAnswerService.createStudentAnswer(studentAnswer);
				}

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(new ArrayList<Object>(0));
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
			apiReturnResult.setStatusMessage("lỗi không trả về kết quả của người dùng muốn");
			apiReturnResult.setData(new ArrayList<Object>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}
}
