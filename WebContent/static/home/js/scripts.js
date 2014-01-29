$(document).ready(function() {
	$("#btn_login").on("click", function() {
		return login();
	});
});

function login() {
	$.ajax({
		type : "POST",
		dataType : "json",
		url : $("#login_form").attr('action'),
		data : $("#login_form").serialize(),
		success : function(response) {
			if (response.result == 'SUCCESS') {
				document.location.reload();
			} else {
				$("#message_login").text(response.message).fadeIn();
			}
		}
	});
	return false;
}

function runSolution() {
	$('#modal_run_solution').modal('hide');
	var data = {
		code : editor.getValue(),
		input : $('#run_input').val(),
		key : key
	};

	$.ajax({
		dataType : "json",
		url : 'submissions/test',
		data : data,
		success : function(response) {
			// process response here
		}
	});
}

function createNewSolution(l) {
	language = (l) ? l : $("#new_solution_form input:checked").val();
	if (code[language] != undefined) {
		editor.getSession().setMode("ace/mode/" + language);
		editor.setValue(code[language]);
		$('#modal_new_solution').modal('hide');
		editor.gotoLine(1);
		checkLanguage(language);
	}
}
function checkLanguage(language) {
	$("#language_group label").removeClass('active');
	$("#language_" + language).attr('checked', 'checked').parent().addClass(
			'active');
}
function ticker(id) {
	var left;
	var h, m, s;
	var c = $(id);
	if (c != null) {
		left = parseInt($(id).attr('left'));
		tick();
	}
	function tick() {
		left--;
		h = Math.ceil(left / 3600);
		m = Math.ceil((left % 3600) / 60);
		s = (left % 3600) % 60;

		$(id).text(
				((h < 10) ? "0" : "") + h + ":" + ((m < 10) ? "0" : "") + m
						+ ":" + ((s < 10) ? "0" : "") + s);
		setTimeout(function() {
			tick();
		}, 1000);
	}
}

function setEditor() {
	if ($('#last_submission').attr('last_submission')!="") {
		checkLanguage($('#last_submission').attr('last_submission'));
	}else{
		createNewSolution(language);
	}
	$('#submit_solution_form').submit(function(){
		$('#submit_language').val($('input[name="language"]:checked').attr('lang_id'));
		$('#submit_code').val(editor.getValue());
	});
	
	editor.setTheme("ace/theme/" + $("#theme_group input[checked='checked']").val().toString());

	$("#language_group input").on('change', function() {
		editor.getSession().setMode("ace/mode/" + this.value);
	});
	$("#theme_group input").on('change', function() {
		editor.setTheme("ace/theme/" + this.value);
	});
	$("#btn_full_screen").on('change', function() {
		if (this.checked) {
			$("#editor_area").addClass('full_screen');
			$("body").addClass('full_screen_open');
		} else {
			$("#editor_area").removeClass('full_screen');
			$("body").removeClass('full_screen_open');
		}
	})
	$("#btn_terminal").on('change', function() {
		if (this.checked)
			$("#terminal").show();
		else
			$("#terminal").hide();
	});
	$("#btn_undo").on('click', function() {
		editor.undo();
	});
	$("#btn_redo").on('click', function() {
		editor.redo();
		editor.gotoLine(editor.selection.getCursor().row + 1);
	});
	$("#btn_font_size").on('click', function() {
		fontSize += 2;
		if (fontSize > 24)
			fontSize = 12;
		document.getElementById('editor').style.fontSize = fontSize + 'px';
	});
}