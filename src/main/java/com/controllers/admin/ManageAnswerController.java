package com.controllers.admin;

import com.constant.ResponseStatusEnum;
import com.model.entityModels.AjaxResponse;
import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.QuestionModel;
import com.services.IAnswerService;
import com.services.IQuestionService;
import com.validation.AnswerInputModelValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ManageAnswerController extends AdminBaseController {

    // Service
    private @Autowired
    IAnswerService _answerService;
    private @Autowired
    IQuestionService _questionService;

    // Validation
    private @Autowired
    AnswerInputModelValidation _answerInputValidator;


    @RequestMapping(value = {"/question/{id}/answers"}, method = RequestMethod.GET)
    public String IndexAnswer(ModelMap modelmap, @PathVariable("id") int questionId, @RequestParam(required = false) String op) {
        QuestionModel questionModel = _questionService.findById(questionId);

        modelmap.put("question", questionModel);
        modelmap.put("answers", _answerService.GetAll(questionId));
        return "admin/ManageAnswer";
    }

    @RequestMapping(value = "/question/create-answer", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse CreateAnswer(@RequestBody AnswerInputModel answerInput, BindingResult bindingResult) {
        _answerInputValidator.validate(answerInput, bindingResult);

        AjaxResponse response = new AjaxResponse();
        if (bindingResult.hasErrors()) {
            response.setStatus(ResponseStatusEnum.FAIL.getKey());

            response.setDataResponse(_answerInputValidator.MessageErrors().get(0));
            return response;
        }
        response.setStatus(ResponseStatusEnum.SUCCESS.getKey());
        response.setDataResponse("Create Answer Success");

        return response;
    }
}
