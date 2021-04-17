package com.controllers.admin;

import com.constant.AuthenManager;
import com.constant.GeneralTypeEnum;
import com.model.entityModels.AjaxResponse;
import com.model.entityModels.QuestionCreateModel;
import com.model.entityModels.QuestionModel;
import com.model.entityModels.QuestionUpdateModel;
import com.model.mapper.QuestionMapper;
import com.services.ILevelService;
import com.services.IQuestionService;
import com.validation.QuestionCreateModelValidation;
import com.validation.QuestionModelValidation;
import com.validation.QuestionUpdateModelValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class ManageQuestionController extends AdminBaseController {

    // Service
    private @Autowired
    IQuestionService _questionService;

    private @Autowired
    ILevelService _levelService;

    // Validator
    private @Autowired
    QuestionCreateModelValidation _questionCreateValidator;

    private @Autowired
    QuestionUpdateModelValidation _questionUpdateValidator;

    private @Autowired
    QuestionModelValidation _questionModelValidator;

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
    // op: status when question updated
    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    public String EditQuestion(ModelMap modelMap, @PathVariable("id") int id, @RequestParam(required =
            false) String op) {
        QuestionUpdateModel questionUpdate = QuestionMapper.ToQuestionUpdateModel(_questionService.findById(id));

        if (op != null && op.equalsIgnoreCase("success"))
            modelMap.put("updateStatus", "Update question success!!");

        modelMap.put("question", questionUpdate);
        modelMap.put("levels", _levelService.GetAll());
        return "admin/EditQuestion";
    }

    // Update data for question
    // questionUpdate: data was submited by form
    // bindingResult: Using for validation model
    @RequestMapping(value = "/question/update-Question", method = RequestMethod.POST)
    public String EditQuestion(@ModelAttribute("question") @Valid QuestionUpdateModel questionUpdate,
                               BindingResult bindingResult) {

        _questionUpdateValidator.validate(questionUpdate, bindingResult);
        if (bindingResult.hasErrors()) {
            return "admin/EditQuestion";
        }

        int id = _questionService.UpdateQuestion(questionUpdate);
        return Redirect("question/" + id, "success");
    }

    // Update question's status
    // questionModel: Include question's id and question's status
    // bindingResult: Using for validation model
    @RequestMapping(value = "/question/update-status", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse UpdateStatus(@RequestBody QuestionModel questionModel) {
        QuestionModel questionValidator = _questionService.findById(questionModel.getId());

        AjaxResponse ajaxResponse = new AjaxResponse();
        if (questionValidator == null) {
            ajaxResponse.setStatus(404);
            return ajaxResponse;
        }

        _questionService.UpdateStatus(questionModel.getId(), questionModel.isStatus());
        ajaxResponse.setStatus(200);
        ajaxResponse.setDataResponse("Update question's status success");

        return ajaxResponse;
    }

    // Load and initial data form create question
    // modelMap: initial data to page
    @RequestMapping(value = "/question/create-question", method = RequestMethod.GET)
    public String CreateQuestion(ModelMap modelMap) {
        QuestionCreateModel questionCreate = new QuestionCreateModel();
        questionCreate.setContent("");

        modelMap.put("question", questionCreate);
        modelMap.put("levels", _levelService.GetAll());
        return "admin/CreateQuestion";
    }

    // Create new Question
    // modelMap: initial data to page
    // questionCreate: Model submited by form
    // bindingResult: Using for validation
    @RequestMapping(value = "/question/create-question", method = RequestMethod.POST)
    public String CreateQuestion(ModelMap modelMap,
                                 @ModelAttribute("question") @Valid QuestionCreateModel questionCreate,
                                 BindingResult bindingResult) {

        _questionCreateValidator.validate(questionCreate, bindingResult);
        if (bindingResult.hasErrors()) {
            modelMap.put("levels", _levelService.GetAll());
            return "admin/CreateQuestion";
        }

        int questionId = _questionService.CreateQuestion(questionCreate, AuthenManager.Current_User.getId());

        return Redirect("question/" + questionId, null);
    }
}
