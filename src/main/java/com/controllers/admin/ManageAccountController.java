package com.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.constant.AccountTypeEnum;
import com.helper.ImageHelper;
import com.model.entities.Account;

@Controller
public class ManageAccountController extends AdminBaseController {

	@RequestMapping(value = { "profile/{id}" }, method = RequestMethod.GET)
	public String Profile(@PathVariable("id") int id, ModelMap modelMap) {
		System.out.println(Current_User.getEmail());
		Account account = iAccountService.FindById(id);
		if (account != null) {
			modelMap.put("profile", account);
			return View("Profile", modelMap);
		}
		return null;
	}

	@RequestMapping(value = { "profile" }, method = RequestMethod.POST)
	public String Profile(@ModelAttribute("profile") Account account, @RequestParam("file_upload") MultipartFile file,
			ModelMap modelMap, HttpServletRequest request) {

		String photo = ImageHelper.saveImage(request, file, RootPathImage+"account/");
		account.setPhoto(photo);
		account.setAccountType(AccountTypeEnum.STUDENT.ordinal());
		iAccountService.Save(account);
		return Redirect("profile/" + account.getId());
	}

}
