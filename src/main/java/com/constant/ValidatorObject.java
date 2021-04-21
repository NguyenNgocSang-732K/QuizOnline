package com.constant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.validation.ObjectError;

import java.util.ArrayList;
import java.util.List;

public class ValidatorObject {

    private @Autowired
    MessageSource messageSource;

    protected List<ObjectError> listError;

    private List<String> SetMessageErrors(){
        List<String> messages = new ArrayList<>();

        this.listError.forEach(p -> {
            String message = messageSource.getMessage(p, null);
            messages.add(message);
        });

        return messages;
    }

    public List<String> MessageErrors() {
        return SetMessageErrors();
    }
}
