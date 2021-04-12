package com.controllers.admin;

import com.constant.GeneralTypeEnum;
import com.model.entityModels.AnswerModel;
import com.model.entityModels.QuestionUpdateModel;
import com.services.ILevelService;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ManageQuestionController extends AdminBaseController {

    private @Autowired
    IQuestionService _questionService;
    private @Autowired
    ILevelService _levelService;

    // Get All questions from database
    // page: page number
    // searchText: search question by Content column, Level column
    // modelMap: initial data to page
    @RequestMapping(value = {"questions"}, method = RequestMethod.GET)
    public String IndexQuestion(ModelMap modelmap,
                                @RequestParam(required = false, defaultValue = "1") String page,
                                @RequestParam(required = false, defaultValue = "") String searchText) {

        modelmap.put("questionModels", _questionService.GetAll(Integer.parseInt(page),
                GeneralTypeEnum.PAGESIZE,
                searchText));
        modelmap.put("searchText", searchText);
        return "admin/IndexQuestion";
    }

    // Find question by Id
    // modelMap: initial data to page
    // id: Question's Id
    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    public String EditQuestion(ModelMap modelMap, @PathVariable("id") int id) {
        QuestionUpdateModel questionUpdate = _questionService.findById(id);

        modelMap.put("question", questionUpdate);
        modelMap.put("levels", _levelService.GetAll());
        return "admin/EditQuestion";
    }

    // Update data for question
    // questionUpdate: data was submited by form
    @RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
    public String EditQuestion(@ModelAttribute("question") QuestionUpdateModel questionUpdate) {
        int id = _questionService.UpdateQuestion(questionUpdate);
        return Redirect("question/" + id);
    }

//    // Find question by Id
//    // modelMap: initial data to page
//    // id: Question's Id
//    @RequestMapping(value = "/question/{id}/answers", method = RequestMethod.GET)
//    public String (ModelMap modelMap, @PathVariable("id") int id) {
//        QuestionUpdateModel questionUpdate = _questionService.findById(id);
//
//        modelMap.put("question", questionUpdate);
//        modelMap.put("levels", _levelService.GetAll());
//        return "admin/EditQuestion";
//    }
}
