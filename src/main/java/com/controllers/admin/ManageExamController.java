package com.controllers.admin;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.constant.AuthenManager;
import com.constant.Constant;
import com.constant.StatusEnum;
import com.model.entities.Account;
import com.model.entities.AccountExam;
import com.model.entities.Answer;
import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.model.entities.StudentAnswer;
import com.model.viewModels.ExamSubmitModel;
import com.services.IAccountExamService;
import com.services.IExamService;
import com.services.IQuestionService;
import com.services.IStudentAnswerService;

@Controller
public class ManageExamController extends AdminBaseController {

	private @Autowired IQuestionService _iQuestionService;
	private @Autowired IExamService _iExamService;
	private @Autowired IAccountExamService _iAccountExamService;
	private @Autowired IStudentAnswerService _iStudentAnswerService;

	@RequestMapping(value = { "student/exam" }, method = RequestMethod.GET)
	public String Student_Exam(ModelMap modelmap, @RequestParam("level_id") int levelId,
			@RequestParam("subject_id") int subjectId) {
		Account account = AuthenManager.Current_Account;
		Exam exam = _iExamService.GetExamForUser(levelId, subjectId, account.getId());
		List<Question> questions = _iQuestionService.FindAllQuestionByExam(exam.getId());
		modelmap.put("exam", exam);
		modelmap.put("lstQuestion", questions);
		modelmap.put("timer", Constant.TIMER);
		return "student/Exam";
	}

	@RequestMapping(value = { "student/exam" }, method = RequestMethod.POST)
	public String Student_SubmitExam(HttpServletRequest request, @RequestParam("examId") int examId,
			ModelMap modelmap) {

		List<StudentAnswer> studentAnswers = new ArrayList<StudentAnswer>();

		Exam exam = _iExamService.FindById(examId);
		List<ExamQuestion> examQuestions = new ArrayList<ExamQuestion>(exam.getExamQuestions());
		float scoreTotal = 0;
		int ans_correct = 0;
		int ans_uncorrect = 0;
		for (ExamQuestion exq : examQuestions) {
			Question question = exq.getQuestion();
			String[] requestData = request.getParameterValues("questions_" + question.getId());
			if(requestData!=null && requestData.length>0) {
				int[] asIdSelected = Stream.of(requestData)
						.mapToInt(Integer::parseInt).toArray();

				float score = Calculator(question, asIdSelected);
				if (score < 0) {
					ans_uncorrect++;
				} else {
					ans_correct++;
					scoreTotal += score;
				}

//				Tạo danh sách câu trả lời user chọn
				StudentAnswer studentAnswer = new StudentAnswer();
				studentAnswer.setAccount(AuthenManager.Current_Account);
				studentAnswer.setAnswer(getAnswerById(question, asIdSelected[0]));
				studentAnswer.setAnswerIds(StringUtils.join(ArrayUtils.toObject(asIdSelected), ","));
				studentAnswer.setCreatedBy(AuthenManager.Current_Account.getId());
				studentAnswer.setCreatedDate(new Date());
				studentAnswer.setExamQuestion(exq);
				studentAnswers.add(studentAnswer);
			}
		}
		if(studentAnswers!=null && studentAnswers.size()>0) {
//			Lưu danh sách câu trả lời mà User chọn
			studentAnswers = _iStudentAnswerService.CreateRange(studentAnswers);

//			Lưu kết quả thi
			AccountExam accountExam = new AccountExam();
			accountExam.setAccount(AuthenManager.Current_Account);
			accountExam.setAnswer_correct(ans_correct);
			accountExam.setAnswer_uncorrect(ans_uncorrect);
			accountExam.setCreatedDate(new Date());
			accountExam.setScore(new BigDecimal(scoreTotal));
			accountExam.setExam(exam);
			accountExam.setStatus(StatusEnum.VISIBLE.getKey());
			accountExam = _iAccountExamService.Create(accountExam);
		}

		return "student/Exam";
	}

	private Answer getAnswerById(Question question, int answerId) {
		for (Answer answer : question.getAnswers()) {
			if (answer.getId() == answerId) {
				return answer;
			}
		}
		return null;
	}

	private float Calculator(Question question, int[] ansIds) {
		List<Integer> ansIdSelected = Arrays.stream(ansIds).boxed().collect(Collectors.toList());
		List<Integer> ansIsCorrect = new ArrayList<Integer>();
		for (Answer ans : question.getAnswers()) {
			if (ans.isIscorrect()) {
				ansIsCorrect.add(ans.getId());
			}
		}
		if (ansIsCorrect.equals(ansIdSelected)) {
			return question.getScore().floatValue();
		}
		return -1;
	}

}
