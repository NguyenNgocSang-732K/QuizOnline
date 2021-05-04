package com.controllers.admin;

import com.constant.AnswerTypeEnum;
import com.constant.AuthenManager;
import com.constant.ResponseStatusEnum;
import com.model.entityModels.AjaxResponse;
import com.model.entityModels.AnswerInputModel;
import com.model.entityModels.AnswerModel;
import com.model.entityModels.QuestionModel;
import com.model.mapper.AnswerMapper;
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
import java.util.Map;

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


    @RequestMapping(value = {"admin/question/{id}/answers"}, method = RequestMethod.GET)
    public String IndexAnswer(ModelMap modelmap, @PathVariable("id") int questionId, @RequestParam(required = false) String op) {
        QuestionModel questionModel = _questionService.findById(questionId);
        List<AnswerModel> answers = _answerService.GetAll(questionId);

        if(questionModel.getAnswerType() == AnswerTypeEnum.CHECKBOX.getKey()){
            modelmap.put("note", "Choose correct answers");
        }else if(questionModel.getAnswerType() == AnswerTypeEnum.RADIO.getKey()){
            modelmap.put("note", "Choose a correct answer");
        }

        modelmap.put("question", questionModel);
        modelmap.put("answers", answers);
        return "admin/ManageAnswer";
    }

    @RequestMapping(value = "admin/question/create-answer", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse CreateAnswer(@RequestBody AnswerInputModel answerInput, BindingResult bindingResult) {
        _answerInputValidator.validate(answerInput, bindingResult);

        AjaxResponse response = new AjaxResponse();
        if (bindingResult.hasErrors()) {
            response.setStatus(ResponseStatusEnum.FAIL.getKey());
            response.setDataResponse(_answerInputValidator.MessageErrors());

            return response;
        }
        _answerService.Save(answerInput.getQuestionId(), answerInput, AuthenManager.Current_User.getId());

        response.setStatus(ResponseStatusEnum.SUCCESS.getKey());

        return response;
    }

    @RequestMapping(value = "admin/question/answer/{answerId}", method = RequestMethod.GET)
    public @ResponseBody AjaxResponse GetById(ModelMap modelMap, @PathVariable int answerId){
        AnswerInputModel answerInput = AnswerMapper.ToAnswerInputModel(_answerService.GetById(answerId));

        AjaxResponse ajaxResponse = new AjaxResponse();
        ajaxResponse.setStatus(200);
        ajaxResponse.setDataResponse(answerInput);

        return ajaxResponse;
    }

    @RequestMapping(value = "admin/question/update-answer", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse UpdateAnswer(@RequestBody AnswerInputModel answerInput, BindingResult bindingResult) {
        _answerInputValidator.validate(answerInput, bindingResult);

        AjaxResponse response = new AjaxResponse();
        if (bindingResult.hasErrors()) {
            response.setStatus(ResponseStatusEnum.FAIL.getKey());
            response.setDataResponse(_answerInputValidator.MessageErrors());

            return response;
        }
        _answerService.Save(answerInput.getQuestionId(), answerInput, AuthenManager.Current_User.getId());

        response.setStatus(ResponseStatusEnum.SUCCESS.getKey());
        return response;
    }
}
