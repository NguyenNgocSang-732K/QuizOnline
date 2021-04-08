$(document).ready(function () {
    $('#pagination').pagination({
        items: data,
        itemsOnPage: itemsOnPage,
        currentPage: currentPage,
        onPageClick: function (pgNumber) {
            var searchText = $("#searchText").val().trim();

            var newurl = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + window.location.pathname;

            if (searchText === undefined || searchText === "") {
                window.location.assign(newurl + '?page=' + pgNumber);
            } else {
                window.location.assign(newurl + '?page=' + pgNumber + '&searchText=' + searchText);
            }
        }
    })

    $('.btnSearchQuestion').on('click', function () {
        var searchText = $("#searchText").val().trim();
        var newurl = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + window.location.pathname;
        console.log(searchText)
        if (searchText !== undefined || searchText !== "") {
            window.location.assign(newurl + '?page=' + 1 + '&searchText=' + searchText);
        }

    })
})