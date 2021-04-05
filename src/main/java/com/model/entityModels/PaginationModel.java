package com.model.entityModels;

import java.util.List;

public class PaginationModel<T> {
    private long totalItems;
    private List<T> data;
    private int totalPages;
    private int currentPage;

    public PaginationModel(int totalItems, List<T> data, int totalPages, int currentPage) {
        this.totalItems = totalItems;
        this.data = data;
        this.totalPages = totalPages;
        this.currentPage = currentPage;
    }

    public PaginationModel() {
    }

    public long getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(long totalItems) {
        this.totalItems = totalItems;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
}
