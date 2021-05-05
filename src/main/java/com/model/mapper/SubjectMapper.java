package com.model.mapper;

import com.constant.StatusEnum;
import com.model.entities.Subject;
import com.model.entityModels.SubjectInputModel;
import com.model.entityModels.SubjectModel;

public class SubjectMapper {
    public static SubjectModel ToSubjectModel(Subject subjectEntity) {
        SubjectModel subjectModel = new SubjectModel();

        subjectModel.setId(subjectEntity.getId());
        subjectModel.setName(subjectEntity.getName());
        subjectModel.setCreatedDate(subjectEntity.getCreatedDate());
        subjectModel.setImage(subjectEntity.getImage());
        subjectModel.setCreatedBy(subjectEntity.getCreatedBy());

        if (StatusEnum.VISIBLE.getKey() == subjectEntity.getStatus()) {
            subjectModel.setStatus(true);
        } else if (StatusEnum.INVISIBLE.getKey() == subjectEntity.getStatus()) {
            subjectModel.setStatus(false);
        }

        return subjectModel;
    }

    public static SubjectInputModel ToSubjectInputModel(Subject subjectEntity) {
        SubjectInputModel subjectModel = new SubjectInputModel();

        subjectModel.setId(subjectEntity.getId());
        subjectModel.setName(subjectEntity.getName());
        subjectModel.setImage(subjectEntity.getImage());
        subjectModel.setCreatedBy(subjectEntity.getCreatedBy());

        return subjectModel;
    }
}
