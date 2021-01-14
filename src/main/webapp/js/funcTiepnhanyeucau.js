//function thamdinh xảy ra khi nhấn vào accept gọi đến data ajax , thực hiện thành công hiển thị popup alert thông báo success
$("body").on("click", ".btn-accept", function () {
    var dataRequest = $(this).closest("tr").find('td:eq(0)').text().trim();
    console.log(dataRequest)
    let data = {datarequest: dataRequest, status: 'wfs', step: '1'};
    var result = sendOrderThamdinh(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
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

//function ajax gọi đến value trong ApprovalController thực hiện cập nhật thông tin các đơn đang chờ trong bảng table saRequest
function sendOrderThamdinh(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "changes",
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

//function thamdinh xảy ra khi nhấn vào refuse gọi đến data ajax , thực hiện thành công hiển thị popup alert thông báo lỗi
$("body").on("click", ".btn-refuse", function () {
    var dataRequest = $(this).closest("tr").find('td:eq(0)').text().trim();
    console.log(dataRequest);
    let data = {datarequest: dataRequest, status: 'deni', step: '1'};
    var result = sendOrderThamdinh(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
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
//function xảy ra khi nhấn vào số điện thoại trong column thứ 2 gọi đến data ajax thực hiện thành công hiển thị nội dung các đơn hàng và ngày yêu cầu vào modal
$("body").on("click", ".as", function () {
    var datarequest = $(this).closest("tr").find('td:eq(1)  > h6  > b  > .as').text().trim();
    let data = {dataRequest: datarequest};
    var result = findHistoryModal(data);
    var obj = JSON.parse(result);
    $("#tbodytable").empty();
    Object.keys(obj).forEach((key) => {
        let sa = obj[key]
        let time = obj[key].saRequest.createdDate
        var rowElement = $('<tr></tr>');
        rowElement.append('<td><h5><a  href="#" onclick="viewInfoOrder(' + sa.saRequest.id + ')">' + sa.saRequest.id + '</a></h5></td>');
        rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
        $("#tbodytable").append(rowElement);
    })

});

//function ajax gọi đến value trong ApprovalController thực hiện truy vấn trả về danh sách contract đúng với số điện thoại đó
function findHistoryModal(data) {
    let result = "";
    try {
        $.ajax({
            type: "POST",
            timeout: 100000,
            url: "findHistoryModal",
            data: data,
            async: false,
            success: function (data, status, xhr) {
                result = data;
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

//function view thông tin chi tiết mã đơn khi nhấn vào mã đơn vay trong bảng
function viewInfoOrder(params) {
    list.forEach((order) => {
        if (order.id == params) {
            let sa = order.status
            let kd = order.employeeDuyet
            console.log(sa)
            if (sa == 'done' || sa == 'act') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #ff69b4">' + order.status + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
                $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + ("0" + (order.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeDuyetDate.date.month)).slice(-2) + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (order.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.second)).slice(-2) + '</p>');

                $('#modal-left').modal('show');
            } else if (sa == 'wfs') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + order.status + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $('#modal-left').modal('show');
            } else if (sa == 'wait') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: darkorange">' + order.status + '</b></p>');
                $('#modal-left').modal('show');
            } else if (sa == 'deni' && kd != null) {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #ff0000">' + 'Từ chối' + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
                $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + ("0" + (order.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeDuyetDate.date.month)).slice(-2) + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (order.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Lí do từ chối :' + ' ' + 'Bổ sung thông tin' + '</p>');
                $('#modal-left').modal('show');
            } else if (sa == 'deni' && kd == null) {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #ff0000">' + 'Từ chối' + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Lí do từ chối :' + ' ' + 'Bổ sung thông tin' + '</p>');
                $('#modal-left').modal('show');
            }
        }
    })
}

//function view thông tin công ty khi nhấn vào mã công ty trong bảng
function viewInfoCompany(params) {
    result.forEach((company) => {
        if (company.company.companyCode == params) {
            let c = company.company;
            console.log(c.createdDate.date)
            $("#companyShow").empty();
            $("#companyShow").append('<h3><p>Mã công ty :' + ' ' + c.companyCode + '</p></h3>');
            $("#companyShow").append('<p>Tên công ty :' + ' ' + c.companyName + '</p>');
            $("#companyShow").append('<p>Địa chỉ công ty :' + ' ' + c.companyAddress + '</p>');
            $("#companyShow").append('<p>Mã số thuế :' + ' ' + c.conpanyTax + '</p>');
            $("#companyShow").append('<p>Ngày hoạt động :' + ' ' + ("0" + (c.createdDate.date.day)).slice(-2) + '/' + ("0" + (c.createdDate.date.month)).slice(-2) + '/' + c.createdDate.date.year + ' ' + ' ' + ("0" + (c.createdDate.time.hour)).slice(-2) + ':' + ("0" + (c.createdDate.time.minute)).slice(-2) + ':' + ("0" + (c.createdDate.time.second)).slice(-2) + '</p>');
            $('#modal-center').modal('show');
        }
    })
    $('#modal-center').modal('show');
}

//function view thông tin nhân viên theo số điện thoại
function viewInfoCustomer(phone) {
    let list = result.find(el => el.customer.customerPhone == phone);
    axios({
        method: 'GET',
        url: 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + phone,
        headers: {
            // 'Content-Type': 'application/x-www-form-urlencoded',
            'Access-Control-Allow-Origin': 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + phone,
        },
        auth: {
            username: "sgfintech",
            password: "k6mzMtPJLPMi5crF"
        }
    })
        .then(function (response) {
            const imgCMND = JSON.parse(response.data.cmnd)
            $('#imgCMND').empty();
            Object.keys(imgCMND).forEach((key) => {
                if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgCMND').append('Bổ sung hình ảnh');
                } else {
                    $('#imgCMND').append('<img style="width: 100%" src="' + imgCMND[key] + '"/>');
                }
            });
            const payslipObj = JSON.parse(response.data.payslip);
            $('#imgPayslip').empty()
            Object.keys(payslipObj).forEach((key) => {
                console.log(payslipObj[key]);
                if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgPayslip').append('<img style="width: 100%" src="' + payslipObj[key] + '"/>');
                }
            });
            const salaryObj = JSON.parse(response.data.salary);
            $('#imgSalary').empty()
            Object.keys(salaryObj).forEach((key) => {
                if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSalary').append('<img style="width: 100%" src="' + salaryObj[key] + '"/>');
                }

            });
            const healthObj = JSON.parse(response.data.health);
            $('#imgHealth').empty()
            Object.keys(healthObj).forEach((key) => {
                if (healthObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgHealth').append('<img style="width: 100%"  src="' + healthObj[key] + '"/>');
                }
            });
            const appendixObj = JSON.parse(response.data.appendix);
            $('#imgAppendix').empty()
            Object.keys(appendixObj).forEach((key) => {
                if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgAppendix').append('<img style="width: 100%" src="' + appendixObj[key] + '"/>');
                }
            });
            const socialObj = JSON.parse(response.data.social);
            $('#imgSocial').empty()
            Object.keys(socialObj).forEach((key) => {
                if (socialObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSocial').append('<img style="width: 100%" src="' + socialObj[key] + '"/>');
                }
            });
            const contractObj = JSON.parse(response.data.contract);
            $('#imgContract').empty()
            Object.keys(contractObj).forEach((key) => {
                if (contractObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                    $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgContract').append('<img style="width: 100%" src="' + contractObj[key] + '"/>');
                }
            });
        })
        .catch(function (error) {
            console.log(error);
        });
    let c = list.customer;
    const date = c.customerBirthday;
    Object.keys(c).forEach((key) => {
        if (key == "customerSalary") {
            value = c[key]
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
            Object.keys(date).forEach((key) => {
                $('#' + key).text(date[key]);
            })
        } else {
            $('#' + key).text(c[key]);
        }
    })
    $('#modal-right').modal('show');
}


