package com.controllers.admin;

import com.constant.AuthenManager;
import com.constant.GeneralTypeEnum;
import com.constant.StatusEnum;
import com.helper.ImageHelper;
import com.model.entities.Account;
import com.model.entityModels.*;
import com.model.mapper.QuestionMapper;
import com.services.IAccountService;
import com.services.ILevelService;
import com.services.IQuestionService;
import com.services.ISubjectService;
import com.validation.QuestionCreateModelValidation;
import com.validation.QuestionUpdateModelValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class ManageStudentController extends AdminBaseController {

    // Service
    private @Autowired
    IAccountService _accountService;

    // Validator
    private @Autowired
    QuestionCreateModelValidation _questionCreateValidator;

    private @Autowired
    QuestionUpdateModelValidation _questionUpdateValidator;

    // Get All questions from database
    // page: page number
    // searchText: search question by Content column, Level column
    // modelMap: initial data to page
    @RequestMapping(value = {"admin/students"}, method = RequestMethod.GET)
    public String IndexQuestion(ModelMap modelmap, @RequestParam(required = false, defaultValue = "1") String page,
                                @RequestParam(required = false, defaultValue = "") String searchText) {
        modelmap.put("students",
                _accountService.GetAll(Integer.parseInt(page), GeneralTypeEnum.PAGESIZE, searchText));
        modelmap.put("searchText", searchText);
        return "admin/IndexStudent";
    }
//
//    // Find question by Id
//    // modelMap: initial data to page
//    // id: Question's Id
//    // op: status when question updated
//    @RequestMapping(value = "admin/question/{id}", method = RequestMethod.GET)
//    public String EditQuestion(ModelMap modelMap, @PathVariable("id") int id,
//                               @RequestParam(required = false) String op) {
//        QuestionUpdateModel questionUpdate = QuestionMapper.ToQuestionUpdateModel(_questionService.findById(id));
//
//        if (op != null && op.equalsIgnoreCase("success"))
//            modelMap.put("updateStatus", "Update question success!!");
//
//        modelMap.put("question", questionUpdate);
//        modelMap.put("levels", _levelService.GetAll());
//        modelMap.put("subjects", _iSubjectService.FindAllValid());
//        return "admin/EditQuestion";
//    }
//
//    // Update data for question
//    // questionUpdate: data was submited by form
//    // bindingResult: Using for validation model
//    @RequestMapping(value = "admin/question/update-Question", method = RequestMethod.POST)
//    public String EditQuestion(@ModelAttribute("question") @Valid QuestionUpdateModel questionUpdate,
//                               @RequestParam("file_upload") MultipartFile file,
//                               BindingResult bindingResult, HttpServletRequest request) {
//
//        _questionUpdateValidator.validate(questionUpdate, bindingResult);
//        if (bindingResult.hasErrors()) {
//            return "admin/EditQuestion";
//        }
//
//        String photo = ImageHelper.saveImage(request, file, "uploads/images/");
//        questionUpdate.setImage(photo);
//        int id = _questionService.UpdateQuestion(questionUpdate);
//        return Redirect("admin/question/" + id, "success");
//    }
//

    @RequestMapping(value = "admin/student/update-status", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse UpdateStatus(@RequestBody AccountModel studentModel) {
        Account accountValidator = _accountService.FindById(studentModel.getId());

        AjaxResponse ajaxResponse = new AjaxResponse();
        if (accountValidator == null) {
            ajaxResponse.setStatus(404);
            return ajaxResponse;
        }

        boolean status = true;

        if (studentModel.getStatus() == StatusEnum.INVISIBLE.getKey()){
            status = false;
        }

        _accountService.UpdateStatus(studentModel.getId(), status);
        ajaxResponse.setStatus(200);
        ajaxResponse.setDataResponse("Update account's status success");

        return ajaxResponse;
    }
//
//    // Load and initial data form create question
//    // modelMap: initial data to page
//    @RequestMapping(value = "admin/question/create-question", method = RequestMethod.GET)
//    public String CreateQuestion(ModelMap modelMap) {
//        QuestionCreateModel questionCreate = new QuestionCreateModel();
//        questionCreate.setContent("");
//
//        modelMap.put("question", questionCreate);
//        modelMap.put("levels", _levelService.GetAll());
//        modelMap.put("subjects", _iSubjectService.FindAllValid());
//        return "admin/CreateQuestion";
//    }

}
