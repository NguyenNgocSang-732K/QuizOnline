package com.mytags;

import com.model.entityModels.AnswerInputModel;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import javax.servlet.http.HttpServletRequest;

public class AnswerTag extends RequestContextAwareTag {

    private String button;

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }

    @Override
    protected int doStartTagInternal() throws Exception {
        return 0;
    }

    @Override
    public void doFinally() {
        try {
            HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
            String viewPath = "";

            if (button.equalsIgnoreCase("Add")) {
                viewPath = "../mytags/Answer/AddAnswer.jsp";
                request.setAttribute("title", "Create Answer");
                request.getRequestDispatcher(viewPath);
                request.setAttribute("answerInput", new AnswerInputModel());
            } else if (button.equalsIgnoreCase("Edit")) {
                viewPath = "../mytags/Answer/EditAnswer.jsp";
                request.setAttribute("title", "Edit Answer");
                request.getRequestDispatcher(viewPath);
            }

            // Data
            pageContext.include(viewPath);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
