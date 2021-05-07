package com.validation;

import com.constant.AnswerTypeEnum;
import com.constant.ValidatorObject;
import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.AnswerModel;
import com.model.entityModels.QuestionModel;
import com.services.IAnswerService;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;

import java.util.List;
import java.util.stream.Collectors;

@Component("answerInputValidator")
public class AnswerInputModelValidation extends ValidatorObject implements Validator {

    private @Autowired
    IQuestionService _questionService;

    private @Autowired
    IAnswerService _answerService;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(AnswerInputModel.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        AnswerInputModel answerInput = (AnswerInputModel) target;


        ValidateContent(answerInput, errors);
        ValidateQuestion(answerInput, errors);
        ValidateAnswers(answerInput, errors);

        listError = errors.getAllErrors();
    }

    private void ValidateContent(AnswerInputModel answerInput, Errors errors) {
        if (answerInput.getContent().trim().isEmpty()) {
            errors.rejectValue("content", "AnswerContent_NOTEMPTY");
        }
    }

    private void ValidateQuestion(AnswerInputModel answerInput, Errors errors){
        if (_questionService.findById(answerInput.getQuestionId()) == null){
            errors.rejectValue("questionId", "Question_NOTEXIST");
        }
    }

    private void ValidateAnswers(AnswerInputModel answerInput, Errors errors){
        QuestionModel questionModel = _questionService.findById(answerInput.getQuestionId());
        List<AnswerModel> answers = _answerService.GetAll(questionModel.getId());

        // Create Answer
        if(answers.size() == 0)
            return;

        // Update Answer
        if(answerInput.getAnswerId() > 0){
            AnswerModel answerModel = answers.stream().filter(p -> p.getId() == answerInput.getAnswerId()).findFirst().get();
            long answerIsCorrect = answers.stream().filter(p -> p.isIscorrect()).count();

            if (answerModel.isIscorrect() && !answerInput.isCorrect() && answerIsCorrect == 1){
                errors.rejectValue("correct", "AnswerCorrect_SINGULAR");
            }

//            if(answerInput.isCorrect()
//                    && answerIsCorrect == answers.size() - 1
//                    && questionModel.getAnswerType() == AnswerTypeEnum.CHECKBOX.getKey()){
//                errors.rejectValue("correct", "AnswerCorrect_PLURAL");
//            }

        }
    }
}
