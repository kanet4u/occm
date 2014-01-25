$(document).ready(function () {
    $("#btn_login").on("click", function () {
        return login();
    });
});

function login() {
    $.ajax({
        dataType:"json",
        url:'/REST/account/login',
        data:$("#login_form").serialize(),
        success:function (response) {
            if (response.result == 'SUCCESS') {
                document.location.reload();
            } else {
                $("#message_login").text(response.message);
            }
        }
    });
}

function runSolution() {
    $('#modal_run_solution').modal('hide');
    var data = {
        code:editor.getValue(),
        input:$('#run_input').val(),
        key:key
    }
    $.ajax({
        dataType:"json",
        url:'submissions/test',
        data:data,
        success:function (response) {
            //process response here
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
        $("#language_group label").removeClass('active');
        $("#language_" + language).attr('checked', 'checked').parent().addClass('active');
    }
}