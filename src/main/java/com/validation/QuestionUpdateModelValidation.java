package com.validation;

import com.helper.ParseHtmlTag;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionUpdateModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("questionUpdateValidator")
public class QuestionUpdateModelValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(QuestionUpdateModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        QuestionUpdateModel questionUpdate = (QuestionUpdateModel) target;

        ValidateContent(questionUpdate, errors);
    }

    private void ValidateContent(QuestionUpdateModel questionUpdate, Errors errors) {
        String parseContent = ParseHtmlTag.Parse(questionUpdate.getContent().trim());

        if (parseContent.isEmpty())
            errors.rejectValue("content", "QuestionContent_NOTEMPTY");
    }
}
