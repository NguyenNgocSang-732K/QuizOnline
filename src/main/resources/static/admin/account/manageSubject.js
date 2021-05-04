$(document).ready(function() {
	$(".btn-start-exam").on("click", function() {
		var $this = $(this);
		var subject_id = $this.attr("data-subject-id");
		var $btn_select_level = $(".btn-select-level");
		var currentHref = $btn_select_level.attr("href");
		currentHref = currentHref.replace("&subject_id=", "&subject_id=" + subject_id);
		$btn_select_level.attr("href", currentHref);
	})
});