package com.controllers.admin;

import com.constant.AuthenManager;
import com.constant.GeneralTypeEnum;
import com.helper.ImageHelper;
import com.model.entityModels.AjaxResponse;
import com.model.entityModels.SubjectInputModel;
import com.model.entityModels.SubjectModel;
import com.model.mapper.SubjectMapper;
import com.services.ISubjectService;
import com.validation.SubjectInputModelValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class ManageSubjectController extends AdminBaseController {

    // Service
    private @Autowired
    ISubjectService iSubjectService;

    // Validator
    private @Autowired
    SubjectInputModelValidation _subjectInputValidator;

    @RequestMapping(value = {"admin/subjects"}, method = RequestMethod.GET)
    public String IndexSubject(ModelMap modelmap, @RequestParam(required = false, defaultValue = "1") String page,
                               @RequestParam(required = false, defaultValue = "") String searchText) {

        modelmap.put("subjectModels",
                iSubjectService.GetAll(Integer.parseInt(page), GeneralTypeEnum.PAGESIZE, searchText));
        modelmap.put("searchText", searchText);

        return "admin/IndexSubject";
    }

    @RequestMapping(value = "admin/subject/create-subject", method = RequestMethod.GET)
    public String CreateSubject(ModelMap modelMap) {
        SubjectInputModel subjectInput = new SubjectInputModel();
        subjectInput.setName("");

        modelMap.put("breadCrumb", "Create Subject");
        modelMap.put("subjectInput", subjectInput);
        return "admin/Create_EditSubject";
    }

    @RequestMapping(value = "admin/subject/{id}", method = RequestMethod.GET)
    public String EditSubject(ModelMap modelMap, @PathVariable("id") int id,
                              @RequestParam(required = false) String op) {
        SubjectInputModel subjectUpdate = SubjectMapper.ToSubjectInputModel(iSubjectService.FindById(id));

        if (op != null && op.equalsIgnoreCase("success"))
            modelMap.put("updateStatus", "Update subject success!!");

        modelMap.put("subjectInput", subjectUpdate);
        modelMap.put("breadCrumb", "Edit Subject");
        return "admin/Create_EditSubject";
    }

    @RequestMapping(value = "admin/subject/process", method = RequestMethod.POST)
    public String Process(ModelMap modelMap,
                          @ModelAttribute("subject") @Valid SubjectInputModel subjectInput,
                          BindingResult bindingResult, @RequestParam("file_upload") MultipartFile file,
                          HttpServletRequest request) {
        _subjectInputValidator.validate(subjectInput, bindingResult);

        String photo = ImageHelper.saveImage(request, file, "uploads/images/");
        subjectInput.setImage(photo);

        if (subjectInput.getId() == null) {
            int id = iSubjectService.Create(subjectInput, AuthenManager.Current_User.getId());
            return Redirect("admin/subject/" + id, null);
        } else {
            iSubjectService.Update(subjectInput);
            return Redirect("admin/subject/" + subjectInput.getId(), "success");
        }
    }

    @RequestMapping(value = "admin/subject/update-status", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse UpdateStatus(@RequestBody SubjectModel subjectModel) {
        SubjectModel subjectValidator = SubjectMapper.ToSubjectModel(iSubjectService.FindById(subjectModel.getId()));

        AjaxResponse ajaxResponse = new AjaxResponse();
        if (subjectValidator == null) {
            ajaxResponse.setStatus(404);
            return ajaxResponse;
        }

        boolean result = iSubjectService.UpdateStatus(subjectModel.getId(), subjectModel.isStatus());
        if (result) {
            ajaxResponse.setStatus(200);
            ajaxResponse.setDataResponse("Update subject's status success");
        } else {
            ajaxResponse.setStatus(404);
        }

        return ajaxResponse;
    }
}
