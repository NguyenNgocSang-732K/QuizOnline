package com.validation;

import com.model.entityModels.QuestionModel;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("questionModelValidator")
public class QuestionModelValidation implements Validator {

    private @Autowired
    IQuestionService _questionService;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(QuestionModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        QuestionModel questionModel = (QuestionModel) target;
        QuestionModel question = _questionService.findById(questionModel.getId());

        if (question == null) {
            errors.rejectValue("QuestionModel", "Question_NOTEXIST");
        }
    }

}
