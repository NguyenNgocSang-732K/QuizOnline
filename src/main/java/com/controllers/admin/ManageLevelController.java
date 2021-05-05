package com.controllers.admin;

import com.constant.AuthenManager;
import com.model.entityModels.AjaxResponse;
import com.model.entityModels.LevelInputModel;
import com.model.entityModels.LevelModel;
import com.model.mapper.LevelMapper;
import com.services.ILevelService;
import com.validation.LevelInputModelValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class ManageLevelController extends AdminBaseController {
    // Service
    private @Autowired
    ILevelService ilevelService;

    // Validator
    private @Autowired
    LevelInputModelValidation _levelInputValidator;

    @RequestMapping(value = {"admin/levels"}, method = RequestMethod.GET)
    public String IndexLevels(ModelMap modelmap) {

        modelmap.put("levelModels",
                ilevelService.GetAll());

        return "admin/IndexLevel";
    }

    @RequestMapping(value = "admin/level/create-level", method = RequestMethod.GET)
    public String CreateLevel(ModelMap modelMap) {
        LevelInputModel levelInput = new LevelInputModel();
        levelInput.setName("");

        modelMap.put("breadCrumb", "Create Level");
        modelMap.put("levelInput", levelInput);
        return "admin/Create_EditLevel";
    }

    @RequestMapping(value = "admin/level/{id}", method = RequestMethod.GET)
    public String EditLevel(ModelMap modelMap, @PathVariable("id") int id,
                            @RequestParam(required = false) String op) {
        LevelInputModel levelUpdate = LevelMapper.ToLevelInputModel(ilevelService.FindById(id));

        if (op != null && op.equalsIgnoreCase("update"))
            modelMap.put("updateLevel", "Update Level success!!");

        if (op != null && op.equalsIgnoreCase("create"))
            modelMap.put("updateLevel", "Create Level success!!");

        modelMap.put("levelInput", levelUpdate);
        modelMap.put("breadCrumb", "Edit Level");
        return "admin/Create_EditLevel";
    }

    @RequestMapping(value = "admin/level/process", method = RequestMethod.POST)
    public String Process(ModelMap modelMap,
                          @ModelAttribute("levelInput") @Valid LevelInputModel levelInput,
                          BindingResult bindingResult) {
        _levelInputValidator.validate(levelInput, bindingResult);

        if (levelInput.getId() == null) {
            int id = ilevelService.Create(levelInput, AuthenManager.Current_User.getId());
            return Redirect("admin/level/" + id, "create");
        } else {
            ilevelService.Update(levelInput);
            return Redirect("admin/level/" + levelInput.getId(), "update");
        }
    }

    @RequestMapping(value = "admin/level/update-status", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponse UpdateStatus(@RequestBody LevelModel levelModel) {
        LevelModel levelValidator = LevelMapper.ToLevelModel(ilevelService.FindById(levelModel.getId()));

        AjaxResponse ajaxResponse = new AjaxResponse();
        if (levelValidator == null) {
            ajaxResponse.setStatus(404);
            return ajaxResponse;
        }

        boolean result = ilevelService.UpdateStatus(levelModel.getId(), levelModel.isStatus());
        if (result) {
            ajaxResponse.setStatus(200);
            ajaxResponse.setDataResponse("Update level's status success");
        } else {
            ajaxResponse.setStatus(404);
        }

        return ajaxResponse;
    }
}
