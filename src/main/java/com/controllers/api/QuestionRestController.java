package com.controllers.api;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
import com.model.entities.AccountExam;
import com.model.entities.Answer;
import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.entities.Level;
import com.model.entities.Question;
import com.model.entities.StudentAnswer;
import com.model.entities.Subject;
import com.model.models.ApiAnswerModel;
import com.model.models.ApiExamModel;
import com.model.models.ApiGetResultByAccountModel;
import com.model.models.ApiLevelModel;
import com.model.models.ApiQuestionModel;
import com.model.models.ApiQuestionParams;
import com.model.models.ApiReturnResult;
import com.model.models.ApiSubjectModel;
import com.services.apiService.IApiAccountExamService;
import com.services.apiService.IApiAccountService;
import com.services.apiService.IApiAnswerService;
import com.services.apiService.IApiExamService;
import com.services.apiService.IApiQuestionExamService;
import com.services.apiService.IApiQuestionService;
import com.services.apiService.IApiStudentAnswerService;

@RestController
public class QuestionRestController extends ApiBaseController {

	// lấy danh sách question
	private @Autowired IApiQuestionExamService iApiQuestionExamService;
	// lấy danh sách câu trả lời
	private @Autowired IApiAnswerService iApiAnswerService;

	private @Autowired IApiExamService iApiExamService;

	private @Autowired IApiQuestionService iApiQuestionService;

	private @Autowired IApiAccountService iApiAccountService;

	private @Autowired IApiAccountExamService iApiAccountExamService;

	private @Autowired IApiStudentAnswerService iApiStudentAnswerService;

	public static int findIndex(List<Integer> arr, int t) {
		if (arr == null) {
			return -1;
		}
		int len = arr.size();
		int i = 0;

		while (i < len) {

			if (arr.get(i) == t) {
				return i;
			} else {
				i = i + 1;
			}
		}
		return -1;
	}

	// search danh sách exam của môn học đó
	@RequestMapping(value = "getQuestion/byLevel", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> examSearchBySeach(@RequestBody ApiQuestionParams apiQuestionParams,
			@RequestHeader String token) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			// kiểm tra có user id hay không
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			// kiểm tra nếu chưa có exam thì khởi tạo

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));

			if (checkAccount > 0) {
				Exam examNew = new Exam();

				Exam checkExam = iApiExamService.checkExam(apiQuestionParams.getLevel_id(),
						apiQuestionParams.getSubject_id(), Integer.parseInt(decodedString));

				if (checkExam == null) {
					// create exam
					Exam exam = new Exam();

					Level level = new Level();
					level.setId(apiQuestionParams.getLevel_id());

					Subject subject = new Subject();
					subject.setId(apiQuestionParams.getSubject_id());

					Random random = new Random();
					String code = String.format("%04d", random.nextInt(10000));

					exam.setCode(code);
					exam.setName(code);
					exam.setStatus(1);
					exam.setCreatedDate(new Date());
					exam.setCreatedBy(Integer.parseInt(decodedString));
					exam.setLevel(level);
					exam.setSubject(subject);

					examNew = iApiExamService.creatExam(exam);
					// the end
				}

				List<Question> questions = iApiQuestionService.getQuestion(apiQuestionParams.getLevel_id(),
						apiQuestionParams.getSubject_id());
				List<ApiQuestionModel> apiQuestionModels = new ArrayList<ApiQuestionModel>();

				List<Integer> integers = new ArrayList<Integer>();

				int count = questions.size();
				count = count + 10;

				int exam_id;
				if (checkExam == null) {
					exam_id = examNew.getId();
				} else {
					exam_id = checkExam.getId();
				}

				for (int i = 0; i < count; i++) {
					if (integers.size() < 40) {
						Random rand = new Random();
						int z = rand.nextInt(questions.size());
						Question question = questions.get(z);

						int inx = findIndex(integers, question.getId());
						if (inx == -1) {
							integers.add(question.getId());

							Integer id = question.getId();
							String content = question.getContent();
							Integer answer_Type = question.getAnswerType();
							String image = question.getImage();
							Date createdDate = question.getCreatedDate();
							Integer createdBy = question.getCreatedBy();
							Integer status = question.getStatus();

							BigDecimal score = question.getScore();
							Integer totalAnswer = iApiAnswerService.countTotalAnswer(id);
							List<ApiAnswerModel> anwers = iApiAnswerService.getAnswer(id);

							ApiQuestionModel apiQuestionModel = new ApiQuestionModel(id, exam_id, content, answer_Type,
									image, createdDate, createdBy, status, score, totalAnswer, anwers);
							apiQuestionModels.add(apiQuestionModel);
						}
					}
				}

				if (checkExam == null) {

					// insert vao trong bang account_exam luon
					AccountExam accountExam = new AccountExam();

					Account account = new Account();
					account.setId(Integer.parseInt(decodedString));

					accountExam.setAccount(account);

					Exam exam3 = new Exam();
					exam3.setId(examNew.getId());

					accountExam.setExam(exam3);
					accountExam.setCreatedDate(new Date());
					accountExam.setStatus(1);
					accountExam.setScore(BigDecimal.valueOf(100));
					iApiAccountExamService.createAccountExam(accountExam);
					// the end

					// cập nhật exam_question
					for (int i = 0; i < apiQuestionModels.size(); i++) {
						ExamQuestion examQuestion = new ExamQuestion();

						Exam exam2 = new Exam();
						exam2.setId(examNew.getId());
						examQuestion.setExam(exam2);

						Question question = new Question();
						question.setId(apiQuestionModels.get(i).getId());
						examQuestion.setQuestion(question);

						examQuestion.setCreatedDate(new Date());
						examQuestion.setCreatedBy(Integer.parseInt(decodedString));
						examQuestion.setStatus(1);

						iApiQuestionExamService.createExamQuestion(examQuestion);
					}

					apiReturnResult.setStatucCode(0);
					apiReturnResult.setStatusMessage("success");
					apiReturnResult.setData(apiQuestionModels);
					return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
				}

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(apiQuestionModels);
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không thể lấy danh sách câu hỏi");
			apiReturnResult.setData(new ArrayList<>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "getAccount/result", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> resultExamByAccount(@RequestHeader String token) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			// kiểm tra có user id hay không
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			// kiểm tra nếu chưa có exam thì khởi tạo

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));

			if (checkAccount > 0) {

				List<ApiGetResultByAccountModel> accountModels = new ArrayList<ApiGetResultByAccountModel>();
				ApiGetResultByAccountModel apiGetResultByAccountModel = new ApiGetResultByAccountModel();
				accountModels.add(apiGetResultByAccountModel);

				List<AccountExam> accountExams = iApiAccountExamService
						.getExamByAccount(Integer.parseInt(decodedString));

				List<ApiExamModel> apiExamModels = new ArrayList<ApiExamModel>();

				List<ApiSubjectModel> apiSubjectModels = new ArrayList<ApiSubjectModel>();

				for (int i = 0; i < accountExams.size(); i++) {
					ApiSubjectModel apiSubjectModel = new ApiSubjectModel();

					ApiExamModel apiExamModel = new ApiExamModel();
					apiExamModel.setId(accountExams.get(i).getExam().getId());
					apiExamModel.setCode(accountExams.get(i).getExam().getCode());
					apiExamModel.setCreatedBy(accountExams.get(i).getExam().getCreatedBy());
					apiExamModel.setCreatedDate(accountExams.get(i).getExam().getCreatedDate());
					apiExamModel.setExamDone(true);

					ApiLevelModel level = new ApiLevelModel();
					level.setId(accountExams.get(i).getExam().getLevel().getId());
					level.setName(accountExams.get(i).getExam().getLevel().getName());
					apiExamModel.setLevel(level);

					apiExamModel.setName(accountExams.get(i).getExam().getName());
					apiExamModel.setStatus(1);

					// get all total question by exam id
					int totalQuestion = iApiQuestionExamService
							.countTotalQuestion(accountExams.get(i).getExam().getId());
					apiExamModel.setTotalQuestion(totalQuestion);
					//total question true
					List<ExamQuestion> examQuestions = iApiQuestionExamService.getQuestion(accountExams.get(i).getExam().getId());
					
					apiExamModel.setTotalQuestionTrue(1);
					//-------------------
					apiExamModel.setTimeExam(45);
					apiExamModel.setScoreExam(100);

					apiExamModel.setSubject_id(accountExams.get(i).getExam().getSubject().getId());

					apiExamModels.add(apiExamModel);
					// ---------------------------------------------
					List<Integer> integers = new ArrayList<Integer>();
					//----------------------------------------------
					if (apiSubjectModels.size() > 0) {
						for (int j = 0; j < apiSubjectModels.size(); j++) {
							integers.add(apiSubjectModels.get(j).getId());
						}
						int inx = findIndex(integers,accountExams.get(i).getExam().getSubject().getId());
						if(inx == -1) {
							apiSubjectModel.setId(accountExams.get(i).getExam().getSubject().getId());
							apiSubjectModel.setName(accountExams.get(i).getExam().getSubject().getName());
							apiSubjectModels.add(apiSubjectModel);
						}
					} else {
						apiSubjectModel.setId(accountExams.get(i).getExam().getSubject().getId());
						apiSubjectModel.setName(accountExams.get(i).getExam().getSubject().getName());
						apiSubjectModels.add(apiSubjectModel);
					}
				}

				apiGetResultByAccountModel.setExams(apiExamModels);
				apiGetResultByAccountModel.setSubjects(apiSubjectModels);

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(accountModels);
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không thể lấy danh sách câu hỏi");
			apiReturnResult.setData(new ArrayList<>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "getQuestion/byAccount", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<ApiReturnResult> getQuestionByAccount(@RequestHeader String token, @RequestBody Exam exam) {
		try {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			// kiểm tra có user id hay không
			byte[] decodedBytes = Base64.getDecoder().decode(token);
			String decodedString = new String(decodedBytes);

			// kiểm tra nếu chưa có exam thì khởi tạo

			int checkAccount = iApiAccountService.checkAccount(Integer.parseInt(decodedString));

			if (checkAccount > 0) {
				// lấy tất cả những
				List<ExamQuestion> examQuestions = iApiQuestionExamService.getQuestion(exam.getId());
				List<ApiQuestionModel> apiQuestionModels = new ArrayList<ApiQuestionModel>();

				for (int i = 0; i < examQuestions.size(); i++) {
					Integer id = examQuestions.get(i).getQuestion().getId();
					String content = examQuestions.get(i).getQuestion().getContent();
					Integer answer_Type = examQuestions.get(i).getQuestion().getAnswerType();
					String image = examQuestions.get(i).getQuestion().getImage();
					Date createdDate = examQuestions.get(i).getQuestion().getCreatedDate();
					Integer createdBy = examQuestions.get(i).getQuestion().getCreatedBy();
					Integer status = examQuestions.get(i).getQuestion().getStatus();

					BigDecimal score = examQuestions.get(i).getQuestion().getScore();
					Integer totalAnswer = iApiAnswerService.countTotalAnswer(id);

					List<StudentAnswer> studentAnswers = iApiStudentAnswerService
							.getStudentAnswer(Integer.parseInt(decodedString), examQuestions.get(i).getId());

					List<ApiAnswerModel> anwers = iApiAnswerService.getAnswer(id);

					List<Integer> integers = new ArrayList<Integer>();
					for (int j = 0; j < studentAnswers.size(); j++) {
						integers.add(studentAnswers.get(j).getAnswer().getId());
					}
					//
					for (int j = 0; j < anwers.size(); j++) {
						int inx = findIndex(integers, anwers.get(j).getId());
						if (inx > -1) {
							anwers.get(j).setIsSelected(true);
						} else {
							anwers.get(j).setIsSelected(false);
						}
					}

					ApiQuestionModel apiQuestionModel = new ApiQuestionModel(id, exam.getId(), content, answer_Type,
							image, createdDate, createdBy, status, score, totalAnswer, anwers);
					apiQuestionModels.add(apiQuestionModel);
				}

				apiReturnResult.setStatucCode(0);
				apiReturnResult.setStatusMessage("success");
				apiReturnResult.setData(apiQuestionModels);
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.OK);
			} else {
				apiReturnResult.setStatucCode(1);
				apiReturnResult.setStatusMessage("Tài khoản không hợp lệ");
				apiReturnResult.setData(new ArrayList<>(0));
				return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			ApiReturnResult apiReturnResult = new ApiReturnResult();
			apiReturnResult.setStatucCode(1);
			apiReturnResult.setStatusMessage("lỗi không thể lấy danh sách câu hỏi");
			apiReturnResult.setData(new ArrayList<>(0));
			return new ResponseEntity<ApiReturnResult>(apiReturnResult, HttpStatus.BAD_REQUEST);
		}
	}

}
