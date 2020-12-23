$("body").on("click", ".btn-accept", function () {
    var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
    dataRequest = dataRequest.substring(0, dataRequest.length - 4);
    let data = {datarequest: dataRequest, status: 'act', step: '2'};
    var result = sendOrder(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $(this).parents("tr").remove();
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
});

function sendOrder(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "kyduyet",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

$("body").on("click", ".btn-refuse", function () {
    var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
    dataRequest = dataRequest.substring(0, dataRequest.length - 4);
    let data = {datarequest: dataRequest, status: 'act', step: '2'};
    var result = sendOrder(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $(this).parents("tr").remove();
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
    }
});
