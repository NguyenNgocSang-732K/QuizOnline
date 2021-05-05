package com.controllers.student;

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
public class StudentSubjectController {

	private @Autowired IAccountService iAccountService;
	private @Autowired ISubjectService iSubjectService;
	private @Autowired ILevelService iLevelService;

	@RequestMapping(value = { "student/TakeAQuiz" }, method = RequestMethod.GET)
	public String Student_Subject(ModelMap modelmap, @RequestParam(required = false, name = "account_id", defaultValue = "0") int accountId) {
		int accId = AuthenManager.Current_Account.getId();
		if (accountId > 0) {
			accId = accountId;
		}
		Account student = iAccountService.FindById(accId);
		List<Subject> subjects = iSubjectService.GetAll(1, Integer.MAX_VALUE, "");
		List<LevelModel> levels = iLevelService.FindAllModelValid();

		for (LevelModel item : levels) {
			if (item.getStt() == 1) {
				item.setColor("btn-primary");
			}
			if (item.getStt() == 2) {
				item.setColor("btn-info");
			}
			if (item.getStt() == 3) {
				item.setColor("btn-secondary");
			}
		}

		modelmap.put("levels", levels);
		if (student != null) {
			modelmap.put("subjects", subjects);
		}

		// Không có môn học dành cho bạn
		modelmap.put("message", "Không có môn học dành cho bạn");
		modelmap.put("title", "Take a Quiz");
		return "student/TakeAQuiz";
	}
}
