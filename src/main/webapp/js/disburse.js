function viewInfoCustomer(id) {
    list = result.find(el => el.id == id);
    $("#importFile").val("");
    document.getElementById("imgUpload").src = "";
    $("#id_donhang").text(id);
    $('#modal-giaingan').modal('show');
}

function disburse() {
    var formData = new FormData();
    var iddonhang = $("#id_donhang").text();
    formData.append('file', $('#importFile')[0].files[0]);
    try {
        // This async call may fail.
        let text = $.ajax({
            url: "giaingan?id_donhang=" + iddonhang,
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,  // tell jQuery not to process the data
            contentType: false,  // tell jQuery not to set contentType
            async: false,
        }).responseText;
        console.log(text);
        if (text === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Giải ngân thành công.',
                showConfirmButton: false,
                timer: 3000
            });
            $("#modal-giaingan").modal('hide');
            $("#tr-" + iddonhang).remove();
        } else if (text === "errorNoExistPath") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Cần cập nhật chứng từ chuyển tiền.',
                showConfirmButton: false,
                timer: 3000
            });
        }
        return;
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function showImage(files) {
    if (FileReader && files && files.length) {
        var fr = new FileReader();
        fr.onload = function () {
            document.getElementById('imgUpload').src = fr.result;
        }
        fr.readAsDataURL(files[0]);
    }
}

const fileInput = document.getElementById("importFile");
fileInput.addEventListener("change", function () {
    showImage(this.files);
}, false);
window.addEventListener('paste', e => {
    console.log('event: ', e.clipboardData.files);
    fileInput.files = e.clipboardData.files;
    showImage(fileInput.files);
});

$("#rootcheckbox").click(function () {
    $('input:checkbox').not(this).prop('checked', this.checked);
});