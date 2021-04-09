package com.controllers.admin;

import com.constant.GeneralTypeEnum;
import com.services.ILevelService;
import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManageQuestionController extends AdminBaseController {

    private @Autowired
    IQuestionService _questionService;
    private @Autowired
    ILevelService _levelService;

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

    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    public String EditQuestion(ModelMap modelMap, @PathVariable("id") int id) {
        modelMap.put("question", _questionService.findById(id));
        modelMap.put("levels", _levelService.GetAll());
        return "admin/EditQuestion";
    }
}
