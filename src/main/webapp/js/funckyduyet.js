$("body").on("click", ".btn-accept", function () {
    var dataRequest = $("#saRequestID").text();
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
    var dataRequest = $("#saRequestID").text();
    let data = {datarequest: dataRequest, status: 'deni', step: '2'};
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
        rowElement.append('<td><h5>' + time.date.day + '/' + time.date.month + '/' + time.date.year + ' ' + time.time.hour + ':' + time.time.minute + ':' + time.time.second + '</h5></td>');
        $("#tbodytable").append(rowElement);
    })

});

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

function viewInfoCompany(params) {
    result.forEach((company) => {
        if (company.company.companyCode == params) {
            let c = company.company;
            Object.keys(c).forEach((key, _) => {
                let id = key;
                $('#' + id).text(c[key]);
            })
        }
    })
    console.log(result);
    // var index =
    $('#modal-center').modal('show');
}

function viewInfoOrder(params) {
    list.forEach((order) => {
        if (order.id == params) {
            let sa = order.status
            console.log(sa)
            if (sa == 'done' || sa == 'act') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + order.createdDate.date.day + '/' + order.createdDate.date.month + '/' + order.createdDate.date.year + '  ' + order.createdDate.time.hour + ':' + order.createdDate.time.minute + ':' + order.createdDate.time.second + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + order.status + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + order.employeeThamdinhDate.date.day + '/' + order.employeeThamdinhDate.date.month + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + order.employeeThamdinhDate.time.hour + ':' + order.employeeThamdinhDate.time.minute + ':' + order.employeeThamdinhDate.time.second + '</p>');
                $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
                $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + order.employeeDuyetDate.date.day + '/' + order.employeeDuyetDate.date.month + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + order.employeeDuyetDate.time.hour + ':' + order.employeeDuyetDate.time.minute + ':' + order.employeeDuyetDate.time.second + '</p>');
                $('#modal-left').modal('show');
            } else if (sa == 'wfs') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + order.createdDate.date.day + '/' + order.createdDate.date.month + '/' + order.createdDate.date.year + '  ' + order.createdDate.time.hour + ':' + order.createdDate.time.minute + ':' + order.createdDate.time.second + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + order.status + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + order.employeeThamdinhDate.date.day + '/' + order.employeeThamdinhDate.date.month + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + order.employeeThamdinhDate.time.hour + ':' + order.employeeThamdinhDate.time.minute + ':' + order.employeeThamdinhDate.time.second + '</p>');
                $('#modal-left').modal('show');
            } else if (sa == 'wait') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + order.createdDate.date.day + '/' + order.createdDate.date.month + '/' + order.createdDate.date.year + ' ' + ' ' + order.createdDate.time.hour + ':' + order.createdDate.time.minute + ':' + order.createdDate.time.second + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: darkorange">' + order.status + '</b></p>');
                $('#modal-left').modal('show');
            } else if (sa == 'deni') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + order.createdDate.date.day + '/' + order.createdDate.date.month + '/' + order.createdDate.date.year + ' ' + ' ' + order.createdDate.time.hour + ':' + order.createdDate.time.minute + ':' + order.createdDate.time.second + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: red">' + order.status + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + order.employeeThamdinhDate.date.day + '/' + order.employeeThamdinhDate.date.month + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + order.employeeThamdinhDate.time.hour + ':' + order.employeeThamdinhDate.time.minute + ':' + order.employeeThamdinhDate.time.second + '</p>');
                $("#listView").append('<p>Nhận xét :' + ' ' + order.description + '</p>');
                $('#modal-left').modal('show');
            }

        }
    })
}

function viewInfoCustomer(params) {
    let username = "sgfintech";
    let password = "k6mzMtPJLPMi5crF";
    result.forEach((customer) => {
        if (customer.customer.customerPhone == params) {
            $.ajax({
                url: 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                headers: {
                    "Access-Control-Allow-Origin": 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                    "Access-Control-Allow-Credentials": true,
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Basic " + btoa(username + ":" + password));
                },
                crossDomain: true,
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log(data)
                    const imgCMND = JSON.parse(data.cmnd);
                    $('#imgCMND').empty();
                    Object.keys(imgCMND).forEach((key) => {
                        if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgCMND').append('Bổ sung hình ảnh');
                        } else {
                            $('#imgCMND').append('<img style="width: 100%" src="' + imgCMND[key] + '"/>');
                        }
                    });
                    const payslipObj = JSON.parse(data.payslip);
                    $('#imgPayslip').empty()
                    Object.keys(payslipObj).forEach((key) => {
                        if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgPayslip').append('<img style="width: 100%" src="' + payslipObj[key] + '"/>');
                        }
                    });
                    const salaryObj = JSON.parse(data.salary);
                    $('#imgSalary').empty()
                    Object.keys(salaryObj).forEach((key) => {
                        console.log(salaryObj[key]);
                        if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSalary').append('<img style="width: 100%" src="' + salaryObj[key] + '"/>');
                        }
                    });
                    const healthObj = JSON.parse(data.health);
                    $('#imgHealth').empty()
                    Object.keys(healthObj).forEach((key) => {
                        console.log(healthObj[key]);
                        if (healthObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgHealth').append('<img style="width: 100%"  src="' + healthObj[key] + '"/>');
                        }
                    });
                    const appendixObj = JSON.parse(data.appendix);
                    $('#imgAppendix').empty()
                    Object.keys(appendixObj).forEach((key) => {
                        console.log(appendixObj[key]);
                        if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgAppendix').append('<img style="width: 100%" src="' + appendixObj[key] + '"/>');
                        }
                    });
                    const socialObj = JSON.parse(data.social);
                    $('#imgSocial').empty()
                    Object.keys(socialObj).forEach((key) => {
                        console.log(socialObj[key]);
                        if (socialObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSocial').append('<img style="width: 100%" src="' + socialObj[key] + '"/>');
                        }
                    });
                    const contractObj = JSON.parse(data.contract);
                    $('#imgContract').empty()
                    Object.keys(contractObj).forEach((key) => {
                        console.log(contractObj[key]);
                        if (contractObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgContract').append('<img style="width: 100%" src="' + contractObj[key] + '"/>');
                        }
                    });
                },
            });
            let c = customer.customer;
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
        }
    })
    console.log(result);
    $('#modal-right').modal('show');
}

$('#example').DataTable({
    dom: 'Bfrtip',
    pageLength: 10,
    columnDefs: [
        {
            visible: false,
            targets: [2, 3, 4, 9, 10]
        },
    ],
    buttons: [
        {
            title: 'Danh sách ký duyệt',
            extend: 'excelHtml5',
            exportOptions: {
                format: {
                    customizeData: function (header, footer, body) {
                        return body;
                    }
                },
                columns: [0, 2, 3, 4, 5, 6, 7, 9, 10]
            }
        },
    ]
})