$(document).ready(function() {
	$(".btn-start-exam").on("click", function() {
		var $this = $(this);
		var subject_id = $this.attr("data-subject-id");
		var $btn_select_level = $(".btn-select-level");
		var currentHref = $btn_select_level.attr("href");
		currentHref = currentHref.replace("&subject_id=", "&subject_id=" + subject_id);
		$btn_select_level.attr("href", currentHref);
	})

	$('.status-subject').on('change', function () {
		var target = $(this);
		var isChecked = target.is(':checked');
		var subjectId = target.data('subject-id')

		var subjectModel = {
			status: isChecked,
			id: subjectId
		};

		function processUpdate(){
			$.ajax({
				type: 'POST',
				contentType: 'application/json',
				url: '/admin/subject/update-status',
				data: JSON.stringify(subjectModel),
				dataType: 'json',
				success: function (data) {
					if (data.status == 200) {
						alert(data.dataResponse)
					} else if (data.status == 404) {
						var url = window.location.protocol + '//' + window.location.host + '/notfound'
						window.location.assign(url);
					}
				}
			})
		}

		if(subjectModel.status){
			processUpdate();
		}else{
			var modalConfirm = confirm("Do you want to disable this Subject?");

			if (modalConfirm == true){
				processUpdate();
			}else{
				target.prop('checked', true);
			}
		}
	})
});