package com.services;

import com.model.entities.StudentAnswer;
import com.model.entities.Subject;
import com.model.entityModels.PaginationModel;
import com.repository.StudentAnswerRepository;
import com.repository.SubjectRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service("studentAnswerService")
public class StudentAnswerService implements IStudentAnswerService {

	@Qualifier("studentAnswerRepository")
	private @Autowired StudentAnswerRepository _studentAnswerRepository;

	@Override
	public List<StudentAnswer> FetAll(int page, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentAnswer FindById(int id) {
		// TODO Auto-generated method stub
		Optional<StudentAnswer> studentAnswer = _studentAnswerRepository.findById(id);
		if (studentAnswer.isEmpty())
			return null;
		return studentAnswer.get();
	}

	@Override
	public StudentAnswer Update(StudentAnswer editing) {
		StudentAnswer studentAnswer = this.FindById(editing.getId());
		if (studentAnswer == null) {
			return null;
		}
		// --

		// --
		StudentAnswer studentAnswerSaved = _studentAnswerRepository.save(studentAnswer);
		return studentAnswerSaved;
	}

	@Override
	public StudentAnswer Create(StudentAnswer studentAnswer) {
		// TODO Auto-generated method stub
		return _studentAnswerRepository.save(studentAnswer);
	}

	@Override
	public List<StudentAnswer> CreateRange(List<StudentAnswer> studentAnswers) {
		try {
			for (int i = 0; i < studentAnswers.size(); i++) {
				StudentAnswer item = studentAnswers.get(i);
				if (FindStudentAnswerByAccountExamQuestion(item.getAccount().getId(),item.getExamQuestion().getId()) != null) {
					studentAnswers.remove(i);
				}
			}
			return _studentAnswerRepository.saveAll(studentAnswers);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public StudentAnswer FindStudentAnswerByAccountExamQuestion(int accountId, int examQuestionId) {
		// TODO Auto-generated method stub
		return _studentAnswerRepository.FindStudentAnswerByAccountExamQuestion(accountId, examQuestionId);
	}

}
