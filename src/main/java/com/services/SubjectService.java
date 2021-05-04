package com.services;

import com.model.entities.Subject;
import com.model.entityModels.PaginationModel;
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

@Service("subjectService")
public class SubjectService implements ISubjectService {

	@Qualifier("subjectRepository")
	private @Autowired SubjectRepository _subjectRepository;

	@Override
	public List<Subject> GetAll(int page, int pageSize, String searchText) {
		Pageable paging = PageRequest.of(page - 1, pageSize);
		Page<Subject> pageTuts = _subjectRepository.findByNameContaining(searchText, paging);
		List<Subject> subjects = pageTuts.getContent().stream().collect(Collectors.toList());

		PaginationModel<Subject> paginationModel = new PaginationModel<Subject>();
		paginationModel.setCurrentPage(pageTuts.getNumber() + 1);
		paginationModel.setData(subjects);
		paginationModel.setTotalPages(pageTuts.getTotalPages());
		paginationModel.setTotalItems(pageTuts.getTotalElements());

		return paginationModel.getData();
	}

	@Override
	public Subject FindById(int id) {
		Optional<Subject> subject = _subjectRepository.findById(id);
		if (subject.isEmpty())
			return null;
		return subject.get();
	}

	@Override
	public Subject Update(Subject editing) {
		Subject subject = this.FindById(editing.getId());
		if (subject == null) {
			return null;
		}
		//--
		
		
		//--
		Subject subjectSaved = _subjectRepository.save(subject);
		return subjectSaved;
	}

	@Override
	public Subject Create(Subject subject) {
		return _subjectRepository.save(subject);
	}

}
