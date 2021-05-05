package com.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.constant.Constant;
import com.constant.StatusEnum;
import com.model.entities.Exam;
import com.model.entities.ExamQuestion;
import com.model.entities.Level;
import com.model.entities.Question;
import com.model.entities.Subject;
import com.repository.ExamRepository;

@Service("examService")
public class ExamService implements IExamService {

	private @Autowired ExamRepository _examRepository;

	// --Service
	private @Autowired IQuestionService _iQuestionService;
	private @Autowired ISubjectService _iSubjectService;
	private @Autowired ILevelService _iLevelService;
	private @Autowired IExamQuestionService _iExamQuestionService;

	private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

	@Override
	public List<Exam> FindExamsByLevelSubjectAccount(int levelId, int subjectId, int accountId) {
		return _examRepository.FindAllExamByLevelSubjectAccount(levelId, subjectId, accountId);
	}

	@Override
	public Exam FindById(int id) {
		Optional<Exam> exam = _examRepository.findById(id);
		if (!exam.isPresent())
			return null;
		return exam.get();
	}

	@Override
	public Exam Update(Exam editing) {
		Exam exam = this.FindById(editing.getId());
		if (exam == null) {
			return null;
		}
		// --

		// --
		Exam examSaved = _examRepository.save(exam);
		return examSaved;
	}

	@Override
	public Exam Create(Exam exam) {
		return _examRepository.save(exam);
	}

	@Override
	public Exam GetExamForUser(int levelId, int subjectId, int accountId) {
		Exam result = null;
		List<Exam> exams = FindExamsByLevelSubjectAccount(levelId, subjectId, accountId);
		// Get danh sách exams cùng Subject và Level mà User này chưa thi,
		// - Nếu có thì lấy First cho thi. Chưa thì Create 1 Exam mới.
		if (exams != null && !exams.isEmpty()) {
			result = exams.get(0);
		} else {
			result = CreateExamForUser(levelId, subjectId, accountId, Constant.QUENTIONS_IN_EXAM);
		}
		return result;
	}

	@Override
	public Exam CreateExamForUser(int levelId, int subjectId, int accountId, int quantityQuestion) {
		List<ExamQuestion> examQuestions = new ArrayList<ExamQuestion>();
		Level level = _iLevelService.FindById(levelId);
		Subject subject = _iSubjectService.FindById(subjectId);
		List<Question> radomQuestions = _iQuestionService.FindRandomQuestionbySubjectLevel(subjectId, levelId,
				quantityQuestion);
		if (radomQuestions == null || radomQuestions.size() == 0) {
			return null;
		}
		Exam exam = new Exam();
		exam.setCode("");
		exam.setCreatedBy(1);
		exam.setCreatedDate(new Date());
		exam.setLevel(level);
		exam.setSubject(subject);
		exam.setStatus(StatusEnum.VISIBLE.getKey());
		exam.setName("Exam " + format.format(new Date()));
		Exam examSaved = _examRepository.save(exam);

		UpdateExamCode(examSaved);

		for (Question question : radomQuestions) {
			examQuestions.add(new ExamQuestion(examSaved, question, new Date(), 1, StatusEnum.VISIBLE.getKey()));
		}

		List<ExamQuestion> examQuestionSaved = _iExamQuestionService.CreateRange(examQuestions);

		return examQuestionSaved != null && !examQuestionSaved.isEmpty() ? examSaved : null;
	}

	private void UpdateExamCode(Exam exam) {
		String code = exam.getId().toString();
		while (exam.getId() < 10000 && code.length() < 5) {
			code = "0" + code;
		}
		code = "EX" + code;
		exam.setCode(code);
		_examRepository.save(exam);
	}

}
