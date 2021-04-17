package com.validation;

import com.helper.ParseHtmlTag;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("questionUpdateValidator")
public class QuestionUpdateModelValidation implements Validator {

    private @Autowired
    IQuestionService _questionService;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(QuestionUpdateModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        QuestionUpdateModel questionUpdate = (QuestionUpdateModel) target;
        QuestionModel question = _questionService.findById(questionUpdate.getId());

        if (question == null) {
            errors.rejectValue("QuestionUpdateModel.id", "Question_NOTEXIST");
        }

        ValidateContent(questionUpdate, errors);
    }

    private void ValidateContent(QuestionUpdateModel questionUpdate, Errors errors) {
        String parseContent = ParseHtmlTag.Parse(questionUpdate.getContent().trim());

        if (parseContent.isEmpty())
            errors.rejectValue("QuestionUpdateModel.content", "QuestionContent_NOTEMPTY");
    }
}
