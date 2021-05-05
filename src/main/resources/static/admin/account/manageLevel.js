$(document).ready(function() {
	$('.status-level').on('change', function () {
		var target = $(this);
		var isChecked = target.is(':checked');
		var levelId = target.data('level-id')

		var levelModel = {
			status: isChecked,
			id: levelId
		};

		function processUpdate(){
			$.ajax({
				type: 'POST',
				contentType: 'application/json',
				url: '/admin/level/update-status',
				data: JSON.stringify(levelModel),
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

		if(levelModel.status){
			processUpdate();
		}else{
			var modalConfirm = confirm("Do you want to disable this Level?");

			if (modalConfirm == true){
				processUpdate();
			}else{
				target.prop('checked', true);
			}
		}
	})
});