package com.validation;

import com.constant.ValidatorObject;
import com.model.entityModels.AnswerInputModel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;

import java.util.List;

@Component("answerInputValidator")
public class AnswerInputModelValidation extends ValidatorObject implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(AnswerInputModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        AnswerInputModel answerInput = (AnswerInputModel) target;

        ValidateContent(answerInput, errors);

        listError = errors.getAllErrors();
    }

    private void ValidateContent(AnswerInputModel answerInput, Errors errors) {
        if (answerInput.getContent().isEmpty()) {
            errors.rejectValue("content", "AnswerContent_NOTEMPTY");
        }
    }

}
