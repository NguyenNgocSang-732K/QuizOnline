package com.validation;

import com.google.common.primitives.Ints;
import com.helper.ParseHtmlTag;
import com.model.entityModels.QuestionCreateModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.text.DecimalFormat;

@Component("questionCreateValidator")
public class QuestionCreateModelValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(QuestionCreateModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        QuestionCreateModel questionCreate = (QuestionCreateModel) target;

        ValidateContent(questionCreate, errors);
        ValdateScore(questionCreate, errors);
    }

    private void ValidateContent(QuestionCreateModel questionCreate, Errors errors) {
        String parseContent = ParseHtmlTag.Parse(questionCreate.getContent().trim());

        if (parseContent.isEmpty())
            errors.rejectValue("content", "QuestionContent_NOTEMPTY");
    }

    private void ValdateScore(QuestionCreateModel questionCreate, Errors errors) {
        try {
            if (questionCreate.getScore() == null || Double.parseDouble(questionCreate.getScore().toString()) < 0) {
                errors.rejectValue("score", "QuestionScore_INVALID");
            }
        } catch (Exception ex) {
        }
    }
}
