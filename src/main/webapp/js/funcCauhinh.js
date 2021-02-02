$("body").on("click", ".btn-accept", function () {
    var id = $(this).closest("tr").find('td:eq(0)').text().replaceAll("\n", "").trim();
    var productCode = $(this).closest("tr").find('td:eq(1) input').val().trim();
    var productName = $(this).closest("tr").find('td:eq(2) input').val().trim();
    var productRate = $(this).closest("tr").find('td:eq(3) input').val().replaceAll("%", "").trim();
    var productMin = $(this).closest("tr").find('td:eq(4) input').val().replaceAll(",", "").replaceAll("đ", "").trim();
    var productDetail = $(this).closest("tr").find('td:eq(7) input').val().trim();
    var limitCount = $(this).closest("tr").find('td:eq(6) input').val().trim();
    let data = {
        id: id,
        productCode: productCode,
        productDetail: productDetail,
        productName: productName,
        productRate: productRate,
        productMin: productMin,
        limitCount: limitCount
    };
    var result = sendOrder(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 100000
        });
    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 100000
        });
    }
});

function sendOrder(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "changeProduct",
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