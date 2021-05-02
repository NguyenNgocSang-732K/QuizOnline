$(document).ready(function() {
    $("body").on("change", 'input[name="file_upload"]', function() {
        if (this.files && this.files[0]) {
            var $image = $('.display-image');
            $image.empty();
            $image.css({ "background-image": "url(" + URL.createObjectURL(this.files[0]) + ")", "background-size": "cover" });
        }
    })
})