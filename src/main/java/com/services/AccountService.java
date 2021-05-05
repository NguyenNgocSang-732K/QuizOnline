package com.services;

import com.constant.AccountTypeEnum;
import com.constant.StatusEnum;
import com.model.entities.Account;
import com.model.entities.Question;
import com.model.entityModels.AccountModel;
import com.model.entityModels.CurrentUserProfile;
import com.model.entityModels.PaginationModel;
import com.model.entityModels.SubjectModel;
import com.model.mapper.AccountMapper;
import com.model.mapper.SubjectMapper;
import com.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service("accountService")
public class AccountService implements IAccountService {

    private @Autowired
    @Qualifier("accountRepository")
    AccountRepository accountRepository;

    @Override
    public CurrentUserProfile loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = accountRepository.findByUsername(username);

        if (account == null) {
            return null;
        }

        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        AccountTypeEnum role = AccountTypeEnum.getValue(account.getAccountType());
        String role_name = "AnonymousUser";
        if (role != null) {
            role_name = role.toString();
        }
        roles.add(new SimpleGrantedAuthority(role_name));

        CurrentUserProfile currentUser = new CurrentUserProfile();

        currentUser.setAuthorities(roles);
        currentUser.setId(account.getId());
        currentUser.setEmail(account.getEmail());
        currentUser.setPhone(account.getPhone());
        currentUser.setPhoto((account.getPhoto() == null || account.getPhoto().isEmpty()) ? "profile.png" : account.getPhoto());
        currentUser.setUsername(account.getUsername());
        currentUser.setPassword(account.getPassword());
        currentUser.setStatus(StatusEnum.VISIBLE == StatusEnum.getKey(account.getStatus()));
        return currentUser;
    }

    @Override
    public Account FindById(int id) {
        // TODO Auto-generated method stub
        Optional<Account> account = accountRepository.findById(id);
        if (!account.isPresent()) {
            return null;
        }
        return account.get();
    }

    @Override
    public Account Save(Account edit) {
        // TODO Auto-generated method stub
        Account account = null;
        if (edit.getId() == 0) {
            edit.setCreatedDate(new Date());
            edit.setStatus(1);
            account = edit;
        } else {
            account = accountRepository.findById(edit.getId()).get();
            // --
            account.setUsername(account.getUsername());
            // --
            account.setAccountType(edit.getAccountType());
            account.setAddress(edit.getAddress());
            account.setCreatedBy(edit.getCreatedBy());
            account.setEmail(edit.getEmail());
            account.setFullname(edit.getFullname());
            account.setIsActive(edit.getIsActive());
            account.setPhone(edit.getPhone());

            if (edit.getPhoto() != null && !edit.getPhoto().isEmpty()) {
                account.setPhoto(edit.getPhoto());
            }
            account.setStatus(edit.getStatus());
        }

        return accountRepository.save(account);
    }

    @Override
    public PaginationModel<AccountModel> GetAll(int page, int pageSize, String searchText) {
        // Declare pageable with page and pageSize
        Pageable paging = PageRequest.of(page - 1, pageSize);
        Page<Account> pageTuts;

        // Find data with paging and searchText parameter
        if (searchText.isEmpty()) {
            pageTuts = accountRepository.findAll(paging);
        } else {
            pageTuts = accountRepository.findByUsernameContainingOrFullnameContainingOrEmailContainingOrPhoneContaining(searchText,
                    searchText, searchText, searchText, paging);
        }

        List<AccountModel> accountModels = pageTuts.getContent().stream().map(AccountMapper::ToAccountModel)
                .collect(Collectors.toList());

        PaginationModel<AccountModel> paginationModel = new PaginationModel<AccountModel>();
        paginationModel.setCurrentPage(pageTuts.getNumber() + 1);
        paginationModel.setData(accountModels);
        paginationModel.setTotalPages(pageTuts.getTotalPages());
        paginationModel.setTotalItems(pageTuts.getTotalElements());

        return paginationModel;
    }

    @Override
    public boolean UpdateStatus(int accountId, boolean status) {
        Account account = accountRepository.findById(accountId).get();

        if (status)
            account.setStatus(StatusEnum.VISIBLE.getKey());
        else
            account.setStatus(StatusEnum.INVISIBLE.getKey());

        Account accountUpdated = accountRepository.save(account);
        return false;
    }
}
