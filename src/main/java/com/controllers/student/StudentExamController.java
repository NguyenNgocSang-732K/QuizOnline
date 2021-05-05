package com.controllers.student;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
public class StudentExamController {

	private @Autowired IQuestionService _iQuestionService;
	private @Autowired IExamService _iExamService;
	private @Autowired IAccountExamService _iAccountExamService;
	private @Autowired IStudentAnswerService _iStudentAnswerService;

	@RequestMapping(value = { "student/executeexam" }, method = RequestMethod.GET)
	public String Student_Exam(ModelMap modelmap,
			@RequestParam(required = false, defaultValue = "0", value = "level_id") int levelId,
			@RequestParam(required = false, defaultValue = "0", value = "subject_id") int subjectId,
			RedirectAttributes dataRedirect) {
		if (levelId == 0 || subjectId == 0) {
			return "redirect:student/takeaquiz";
		}
		Account account = AuthenManager.Current_Account;
		Exam exam = _iExamService.GetExamForUser(levelId, subjectId, account.getId());
		if(exam==null) {
			dataRedirect.addFlashAttribute("error", true);
			dataRedirect.addFlashAttribute("msg", "Không có câu hỏi phù hợp cho bài thi");
			return "redirect:/student/takeaquiz";
		}
		List<Question> questions = _iQuestionService.FindAllQuestionByExam(exam.getId());
		modelmap.put("exam", exam);
		modelmap.put("lstQuestion", questions);
		modelmap.put("timer", Constant.TIMER);

		return "student/ExecuteExam";
	}

	@RequestMapping(value = { "student/historyexam" }, method = RequestMethod.GET)
	public String Student_HistoryExam(ModelMap modelmap) {
		List<AccountExam> historyexams = _iAccountExamService.FindExamByAccount(AuthenManager.Current_Account.getId());
		modelmap.put("title", "History Quiz");
		modelmap.put("historyAccountExams", historyexams);
		return "student/HistoryExam";
	}

	@RequestMapping(value = { "student/historyexamdetail" }, method = RequestMethod.GET)
	public String Student_HistoryExamDetail(ModelMap modelmap,
			@RequestParam(required = false, value = "accountExamId", defaultValue = "0") int accountExamId) {
		AccountExam examDetailHistory = _iAccountExamService.FindById(accountExamId);
		if (examDetailHistory == null) {
			return "redirect:/student/historyexam";
		}

		Exam exam = examDetailHistory.getExam();

		List<Question> questions = new ArrayList<Question>();

		for (ExamQuestion item : exam.getExamQuestions()) {
			questions.add(item.getQuestion());
			Set<Answer> answers = item.getQuestion().getAnswers();
			for (Answer answer : answers) {
				if (_iStudentAnswerService.CheckStudentAnswerByAccountExamQuestionAnswer(
						examDetailHistory.getAccount().getId(), item.getId(), answer.getId()).size() > 0) {
					answer.setStatus(1);
				} else {
					answer.setStatus(0);
				}
			}
		}
		questions = questions.stream().sorted((q1, q2) -> q1.getId().compareTo(q2.getId()))
				.collect(Collectors.toList());
		modelmap.put("title", "Detail Exam");
		modelmap.put("exam", examDetailHistory);
		modelmap.put("lstQuestion", questions);
		modelmap.put("result", examDetailHistory);
		return "student/HistoryExamDetail";
	}

	@RequestMapping(value = { "student/executeexam" }, method = RequestMethod.POST)
	public String Student_SubmitExam(HttpServletRequest request, @RequestParam("examId") int examId,
			ModelMap modelmap) {

		List<StudentAnswer> studentAnswers = new ArrayList<StudentAnswer>();

		Exam exam = _iExamService.FindById(examId);
		List<ExamQuestion> examQuestions = new ArrayList<ExamQuestion>(exam.getExamQuestions());
		float scoreTotal = 0;
		float scoreQuestion = 0;
		int ans_correct = 0;
		int ans_uncorrect = 0;
		for (ExamQuestion exq : examQuestions) {
			Question question = exq.getQuestion();
			scoreQuestion += question.getScore().floatValue();
			String[] requestData = request.getParameterValues("questions_" + question.getId());
			if (requestData != null && requestData.length > 0) {
				int[] asIdSelected = Stream.of(requestData).mapToInt(Integer::parseInt).toArray();

				float score = Calculator(question, asIdSelected);
				if (score < 0) {
					ans_uncorrect++;
				} else {
					ans_correct++;
					scoreTotal += score;
				}

				// Tạo danh sách câu trả lời user chọn
				for (int itemSelected : asIdSelected) {
					Answer ansSelected = getAnswerById(question, itemSelected);
					if (ansSelected != null) {
						StudentAnswer studentAnswer = new StudentAnswer();
						studentAnswer.setAccount(AuthenManager.Current_Account);
						studentAnswer.setAnswer(ansSelected);
						studentAnswer.setAnswerIds("");
						studentAnswer.setCreatedBy(AuthenManager.Current_Account.getId());
						studentAnswer.setCreatedDate(new Date());
						studentAnswer.setExamQuestion(exq);
						studentAnswers.add(studentAnswer);
					}
				}
			}
		}
		if (studentAnswers != null && studentAnswers.size() > 0) {
//			Lưu danh sách câu trả lời mà User chọn
			studentAnswers = _iStudentAnswerService.CreateRange(studentAnswers);

//			Lưu kết quả thi
			AccountExam accountExam = new AccountExam();
			accountExam.setAccount(AuthenManager.Current_Account);
			accountExam.setAnswer_correct(ans_correct);
			accountExam.setAnswer_uncorrect(ans_uncorrect);
			accountExam.setCreatedDate(new Date());
			accountExam.setScore(new BigDecimal(scoreTotal / scoreQuestion * 100));
			accountExam.setExam(exam);
			accountExam.setStatus(StatusEnum.VISIBLE.getKey());
			accountExam = _iAccountExamService.Create(accountExam);
		}

		return "redirect:/student/takeaquiz";
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

	private long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
		long diffInMillies = date2.getTime() - date1.getTime();
		return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
	}

}
