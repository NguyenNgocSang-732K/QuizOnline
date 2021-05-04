package com.validation;

import com.model.entityModels.LevelInputModel;
import com.model.entityModels.SubjectInputModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("levelInputValidator")
public class LevelInputModelValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(LevelInputModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        LevelInputModel levelInputModel = (LevelInputModel) target;

        ValidateName(levelInputModel, errors);
    }

    private void ValidateName(LevelInputModel model, Errors errors) {
        if (model.getName().trim().isEmpty()) {
            errors.rejectValue("name", "LevelName_NOTEMPTY");
        }
    }
}
