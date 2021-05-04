package com.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.constant.AuthenManager;
import com.model.entities.Account;
import com.model.entities.Level;
import com.model.entities.Subject;
import com.model.entityModels.LevelModel;
import com.services.IAccountService;
import com.services.ILevelService;
import com.services.ISubjectService;

@Controller
public class ManageSubjectController extends AdminBaseController {

	private @Autowired IAccountService iAccountService;
	private @Autowired ISubjectService iSubjectService;
	private @Autowired ILevelService iLevelService;

	@RequestMapping(value = { "student/subject" }, method = RequestMethod.GET)
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
		return "student/Subject";
	}
}
