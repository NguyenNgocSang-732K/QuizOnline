package com.controllers.admin;

import com.model.entityModels.QuestionModel;
import com.services.IAnswerService;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageAnswerController extends AdminBaseController{

    private @Autowired
    IAnswerService _answerService;
    private @Autowired
    IQuestionService _questionService;

    @RequestMapping(value = {"/question/{id}/answers"}, method = RequestMethod.GET)
    public String IndexAnswer(ModelMap modelmap, @PathVariable("id") int questionId) {
        QuestionModel questionModel = _questionService.findById(questionId);

        modelmap.put("question", questionModel);
        modelmap.put("answers", _answerService.GetAll(questionId));
        return "admin/ManageAnswer";
    }

}
