package com.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import com.model.entityModels.CurrentUserProfile;
import com.model.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.constant.AccountTypeEnum;
import com.constant.AuthenManager;
import com.helper.ImageHelper;
import com.model.entities.Account;
import com.services.IAccountService;

@Controller
public class ManageAccountController extends AdminBaseController {

	private @Autowired IAccountService iAccountService;

	@RequestMapping(value = { "profile/{id}" }, method = RequestMethod.GET)
	public String Profile(@PathVariable("id") int id, ModelMap modelMap) {
		Account account = iAccountService.FindById(id);
		if (account != null) {
			modelMap.put("profile", account);
			return "shared/account/Profile";
		}
		return null;
	}

	@RequestMapping(value = { "profile" }, method = RequestMethod.POST)
	public String Profile(@ModelAttribute("profile") Account account, @RequestParam("file_upload") MultipartFile file,
			ModelMap modelMap, HttpServletRequest request) {
		String photo = ImageHelper.saveImage(request, file, "uploads/images/");
		account.setPhoto(photo);
		//account.setAccountType(AccountTypeEnum.STUDENT.ordinal());
		Account accountUpdated = iAccountService.Save(account);

		AuthenManager.Current_User = AccountMapper.ToCurrentUserProfile(accountUpdated);

		Authentication authentication = new UsernamePasswordAuthenticationToken(AuthenManager.Current_User, AuthenManager.Current_User.getPassword(),
				AuthenManager.Current_User.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);

//		AuthenManager.Current_User = (CurrentUserProfile) SecurityContextHolder.getContext().getAuthentication()
//				.getPrincipal();
//		AuthenManager.Current_Account = iAccountService.FindById(AuthenManager.Current_User.getId());

		return Redirect("profile/" + account.getId(), null);
	}

}
