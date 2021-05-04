package com.services;

import com.model.entities.ExamQuestion;
import com.model.entities.Question;
import com.repository.ExamQuestionRepository;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("examQuestionService")
public class ExamQuestionService implements IExamQuestionService {

	@Qualifier("examQuestionRepository")
	private @Autowired ExamQuestionRepository _examQuestionRepository;

	@Override
	public List<Question> FindAllByExam(int examId) {
		// TODO Auto-generated method stub
		return _examQuestionRepository.findQuestionByExamId(examId);
	}

	@Override
	public ExamQuestion FindById(int id) {
		Optional<ExamQuestion> examQuestion = _examQuestionRepository.findById(id);
		if (examQuestion.isEmpty())
			return null;
		return examQuestion.get();
	}

	@Override
	public ExamQuestion Update(ExamQuestion editing) {
		ExamQuestion examQuestion = this.FindById(editing.getId());
		if (examQuestion == null) {
			return null;
		}
		//--
		
		
		//--
		ExamQuestion examQuestionSaved = _examQuestionRepository.save(examQuestion);
		return examQuestionSaved;
	}

	@Override
	public ExamQuestion Create(ExamQuestion entity) {
		return _examQuestionRepository.save(entity);
	}

	@Override
	public List<ExamQuestion> CreateRange(List<ExamQuestion> entities) {
		// TODO Auto-generated method stub
		try {
			return _examQuestionRepository.saveAll(entities);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
