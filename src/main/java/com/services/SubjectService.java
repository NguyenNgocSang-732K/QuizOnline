package com.services;

import com.constant.StatusEnum;
import com.model.entities.Question;
import com.model.entities.Subject;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.SubjectInputModel;
import com.model.entityModels.SubjectModel;
import com.model.mapper.SubjectMapper;
import com.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("subjectService")
public class SubjectService implements ISubjectService {

    @Qualifier("subjectRepository")
    private @Autowired
    SubjectRepository _subjectRepository;

    @Override
    public Subject FindById(int id) {
        Optional<Subject> subject = _subjectRepository.findById(id);
        if (!subject.isPresent())
            return null;
        return subject.get();
    }

    @Override
    public Subject Update(SubjectInputModel editing) {
        Subject subject = this.FindById(editing.getId());
        if (subject == null) {
            return null;
        }
        // --
        subject.setName(editing.getName());
        subject.setImage(editing.getImage());
        // --
        Subject subjectSaved = _subjectRepository.save(subject);
        return subjectSaved;
    }

    @Override
    public int Create(SubjectInputModel subjectModel, int userId) {
        Subject subject = new Subject();

        subject.setName(subjectModel.getName());
        subject.setCreatedDate(new Date());
        subject.setImage(subjectModel.getImage());
        subject.setCreatedBy(userId);
        subject.setStatus(StatusEnum.VISIBLE.getKey());

        subject = _subjectRepository.save(subject);

        return subject.getId();
    }

    @Override
    public boolean UpdateStatus(int subjectId, boolean status) {
        Subject subject = this.FindById(subjectId);

        if (status)
            subject.setStatus(StatusEnum.VISIBLE.getKey());
        else
            subject.setStatus(StatusEnum.INVISIBLE.getKey());

        Subject subjectUpdated = _subjectRepository.save(subject);
        return subjectUpdated != null ? true : false;
    }

    @Override
    public PaginationModel<SubjectModel> GetAll(int page, int pageSize, String searchText) {
        // Declare pageable with page and pageSize
        Pageable paging = PageRequest.of(page - 1, pageSize);
        Page<Subject> pageTuts;

        // Find data with paging and searchText parameter
        if (searchText.isEmpty()) {
            pageTuts = _subjectRepository.findAll(paging);
        } else {
            pageTuts = _subjectRepository.findByNameContaining(searchText, paging);
        }

        List<SubjectModel> subjectModels = pageTuts.getContent().stream().map(SubjectMapper::ToSubjectModel)
                .collect(Collectors.toList());

        PaginationModel<SubjectModel> paginationModel = new PaginationModel<SubjectModel>();
        paginationModel.setCurrentPage(pageTuts.getNumber() + 1);
        paginationModel.setData(subjectModels);
        paginationModel.setTotalPages(pageTuts.getTotalPages());
        paginationModel.setTotalItems(pageTuts.getTotalElements());

        return paginationModel;
    }

    @Override
    public List<Subject> FindAllValid() {
        // TODO Auto-generated method stub
        return _subjectRepository.findByStatus(StatusEnum.VISIBLE.getKey());
    }

}
