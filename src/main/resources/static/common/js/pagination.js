function pagination(targetElement, data, itemsOnPage, currentPage, searchTextObj) {
    targetElement.pagination({
        items: data,
        itemsOnPage: itemsOnPage,
        currentPage: currentPage,
        onPageClick: function (pgNumber) {
            var searchText = searchTextObj.val().trim();
            var newurl = window.location.protocol + '//' + window.location.hostname
                + ':' + window.location.port + window.location.pathname;

            if (searchText === undefined || searchText === "") {
                window.location.assign(newurl + '?page=' + pgNumber);
            } else {
                window.location.assign(newurl + '?page=' + pgNumber + '&searchText=' + searchText);
            }
        }
    })
}

function searchPaginationWithButton(btnSearch, searchTextObj) {
    btnSearch.on('click', function () {
        var searchText = searchTextObj.val().trim();
        var newurl = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + window.location.pathname;

        if (searchText !== undefined || searchText !== "") {
            window.location.assign(newurl + '?page=' + 1 + '&searchText=' + searchText);
        }
    })
}

$(document).ready(function () {
    if (typeof (data) !== "undefined" && typeof (itemsOnPage) !== "undefined" && typeof (currentPage) !== "undefined") {
        pagination($('#pagination'), data, itemsOnPage, currentPage, $("#searchText"))
        searchPaginationWithButton($('#btnSearchQuestion'), $('#searchText'))

    }
})