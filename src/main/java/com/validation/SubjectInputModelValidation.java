package com.validation;

import com.model.entityModels.SubjectInputModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("subjectInputValidator")
public class SubjectInputModelValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(SubjectInputModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        SubjectInputModel subjectInputModel = (SubjectInputModel) target;

        ValidateName(subjectInputModel, errors);
    }

    private void ValidateName(SubjectInputModel model, Errors errors) {
        if (model.getName().trim().isEmpty()) {
            errors.rejectValue("name", "SubjectName_NOTEMPTY");
        }
    }
}
