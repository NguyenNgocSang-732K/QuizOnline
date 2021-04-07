package com.controllers.admin;

import com.services.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageQuestionController extends AdminBaseController {

    private @Autowired
    IQuestionService _questionService;

    @RequestMapping(value = {"questions/index"}, method = RequestMethod.GET)
    public String Index(ModelMap modelmap) {

        modelmap.put("questionModels", _questionService.GetAll());
        return "admin/ManageQuestion";
    }
}
