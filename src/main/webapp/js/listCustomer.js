//function xảy ra khi nhấn vào tìm kiếm gọi đến data ajax , thực hiện thành công hiển thị danh sách nhân viên ra table
$("body").on("click", ".btn-outline", function () {
    $("#loading").show();
    var customerName = $("#customerName").val();
    var customerPhone = $("#customerPhone").val();
    var customerId = $("#customerId").val();
    var data = {customerName: customerName, customerPhone: customerPhone, customerId: customerId};
    var dataobject = ajaxPost(data);
    console.log(dataobject)
    //todo parse dataobject => json object

    var obj = JSON.parse(dataobject);
    console.log(obj)
    var body = $("#tbodytable");
    body.empty();
    if (obj.length != 0) {
        Object.keys(obj).forEach((key) => {
            var e = obj[key];
            var rowElement = $('<tr></tr>');
            rowElement.append('<td><h5>' + e.company.companyCode + '</h5></td>');
            rowElement.append('<td ><b>' + e.customer.customerName + '</b><br>' +
                'Ngày sinh :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerBirthday.day + '/' + e.customer.customerBirthday.month + '/' + e.customer.customerBirthday.year + '</span><br>' +
                'Số điện thoại :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerPhone + '</span></td>');
            rowElement.append('<td>' + 'Thường trú :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerAddress + '</span><br>' +
                'Tạm trú :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerAddressTemp + '</span></td>');
            if (e.customer.customerPosition === undefined) {
                rowElement.append('<td>' + 'Vị trí :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + 'Không có thông tin' + '</span><br>' +
                    'Mức lương :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerSalary.toLocaleString("vi-VN") + ' ' + 'đ</span></td>');
            } else {
                rowElement.append('<td>' + 'Vị trí :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerPosition + '</span><br>' +
                    'Mức lương :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerSalary.toLocaleString("vi-VN") + ' ' + 'đ</span></td>');
            }
            if (e.customer.customerIdLocation === undefined) {
                rowElement.append('<td>' +
                    'Số CMND :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerId + '</span><br>' +
                    'Nơi cấp :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + 'Không có thông tin' +
                    '</span></td>');
            } else {
                rowElement.append('<td>' +
                    'Số CMND :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerId + '</span><br>' +
                    'Nơi cấp :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerIdLocation +
                    '</span></td>');
            }

            rowElement.append('<td xmlns="http://www.w3.org/1999/html">' +
                'Tên ngân hàng :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerBankName + '</span><br>' +
                'Chủ tài khoản :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerBank + '</span><br>' +
                'Số tài khoản :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerBankAcc + '</span></td>');
            if (obj[key].customer.status == "wait") {
                rowElement.append('<td>' +
                    'Loại HĐLĐ :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerContract + '</span><br>' +
                    'Trạng thái HĐLĐ :' + ' ' + '<b style=" font-weight: 300 bold;color: forestgreen">' + 'đang chờ' + '</b></td>');
            } else if (obj[key].customer.status == "expried") {
                rowElement.append('<td>' +
                    'Loại HĐLĐ :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerContract + '</span><br>' +
                    'Trạng thái HĐLĐ :' + ' ' + '<b style=" font-weight: 300 bold;color: forestgreen">' + 'hết thời hạn' + '</b></td>');
            } else if (obj[key].customer.status == "active") {
                rowElement.append('<td>' +
                    'Loại HĐLĐ :' + ' ' + '<span style=" font-weight: 300 bold;color: grey">' + e.customer.customerContract + '</span><br>' +
                    'Trạng thái HĐLĐ :' + ' ' + '<b style=" font-weight: 300 bold;color: forestgreen">' + 'đang hoạt động' + '</b></td>');
            }
            body.append(rowElement);
            $("#loading").hide();
        })
    } else {
        $("#loading").hide();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Không tìm thấy kết quả',
        })
    }
    // the array is defined and has at least one element

});

//function ajax gọi đến value trong CustomerController thực hiện truy vấn trả về danh sách nhân viên theo số đth,tên nhân viên,số cmnd
function ajaxPost(data) {
    let result = "";
    try {
        $.ajax({
            type: "POST",
            timeout: 100000,
            data: data,
            async: false,
            url: "searchByInfoCustomer",
            success: function (data, status, xhr) {
                result = data
                console.log(data)
                return result;
            },
            error: function (jqXhr, textStatus, errorMessage) {
                console.log(textStatus);
                console.log(errorMessage);
            }
        })
    } catch (error) {
        return "Không thể kết nối tới server";
    }
    return result;
}

