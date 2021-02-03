$("body").on("click", ".updateUser", function () {
    let id = $(this).closest("tr").find('td:eq(0)').text()
    let userLogin = $(this).closest("tr").find('td:eq(1) input').val();
    console.log(userLogin)
    console.log(id)
    let data = {
        id: id,
        userlogin: userLogin
    };
    var result = updateUserAjax(data);
    console.log(result)
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Cập nhật tên tàì khoản thành công.',
            showConfirmButton: false,
            timer: 100000
        });
        $('#' + id).empty()
        $('#' + id).append('<input type="text" value="' + userLogin + '" class="form-control"/>');
    } else if (result === "emptyError") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Không được để trống!',
            showConfirmButton: false,
            timer: 100000
        });
    }
});

function updateUserAjax(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "changeUserLogin",
            data: data,
            dataType: 'text',
            async: false,
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

$("#pass").validate({
    rules: {
        oldpassword: {
            required: true,
        },
        password: {
            required: true,
            minlength: 10,
        },
        repassword: {
            equalTo: "#password"
        }
    },
    messages: {
        oldpassword: {
            required: "Yêu cầu nhập mật khẩu hiện tại",
        },
        password: {
            required: "Yêu cầu nhập mật khẩu mới",
            minlength: "Hãy nhập ít nhất 8 ký tự",
        },
        repassword: {
            equalTo: "Mật khẩu không khớp"
        }
    }
});

jQuery.validator.addMethod("emailExt", function (value, element, param) {
    return value.match(/^[a-zA-Z0-9_\.%\+\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z]{3,}$/);
}, 'Xin vui lòng nhập đúng định dạng email');
$("#demoForm").validate({
    rules: {
        login: {
            emailExt: true
        },
        pass: {
            required: true,
            minlength: 4,
            maxlength: 30
        },
    },
    messages: {
        pass: {
            required: "Bắt buộc nhập mật khẩu.",
            minlength: "Hãy nhập ít nhất 4 ký tự",
            maxlength: "Hãy nhập tối đa 30 ký tự"
        },
    }

});


function createUser() {
    if ($("#demoForm").valid()) {
        var userLogin = $("#user_login").val();
        console.log(userLogin)
        var userPass = $("#user_pass").val();
        console.log(userPass)
        var userRole = $("#user_role").val();
        console.log(userRole)

        let data = {
            userLogin: userLogin,
            userPass: userPass,
            userRole: userRole,

        };
        var result = createUserAjax(data);
        if (result === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Dữ liệu được cập nhật thành công.',
                showConfirmButton: false,
                timer: 100000
            });
        } else if (result === "errorRoot") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Không thể tạo role root',
                showConfirmButton: false,
                timer: 100000
            });
        } else if (result === "errorExist") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Tên đăng nhập đã tồn tại',
                showConfirmButton: false,
                timer: 100000
            });
        } else {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Không được để trống',
                showConfirmButton: false,
                timer: 100000
            });
        }
    }
};


function createUserAjax(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "changeUserAdmin",
            data: data,
            dataType: 'text',
            async: false,
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function showResetModal(id, name) {
    console.log(id)
    console.log(name)
    $("#modalresetPass").modal('show');
    $("#userName").text(name);
    $("#idReset").text(id)
}

function resetPass() {
    var _id = $('#idReset').text();
    console.log('id 1: ', _id)
    let data = {
        idata: _id,
    };
    var result = ajaxresetPass(data);
    console.log(result)
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 100000
        });
    } else if (result === "errorRoot") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Không có quyền đặt lại mật khẩu',
            showConfirmButton: false,
            timer: 100000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi không thể thực thi',
            showConfirmButton: false,
            timer: 100000
        });
    }
};

function ajaxresetPass(data) {
    try {
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "resetPassAdmin",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function unlockUser(id) {
    let data = {
        idlock: id,
    };
    var result = ajaxunlockUser(data);
    console.log(result)
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Đã mở khóa tài khoản.',
            showConfirmButton: false,
            timer: 100000
        });
        $('#td-' + id).empty()
        $('#td-' + id).append(' <b style="color: forestgreen">Đang hoạt động</b>')
    } else if (result === "errorlockRole") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Không có quyền mở khóa tài khoản',
            showConfirmButton: false,
            timer: 100000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi không thể thực thi',
            showConfirmButton: false,
            timer: 100000
        });
    }
};

function ajaxunlockUser(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "unlockuserAdmin",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function lockUser(id) {
    let data = {
        idlock: id,
    };
    var result = ajaxlockUser(data);
    console.log(result)
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Đã khóa tài khoản.',
            showConfirmButton: false,
            timer: 100000
        });
        $('#td-' + id).empty()
        $('#td-' + id).append('<b style="color: red">Đã khóa tài khoản</b>')

    } else if (result === "errorlockRole") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Không có quyền khóa tài khoản',
            showConfirmButton: false,
            timer: 100000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi không thể thực thi',
            showConfirmButton: false,
            timer: 100000
        });
    }
};

function ajaxlockUser(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "lockuserAdmin",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
        console.log(text);
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}