$("body").on("click", ".as", function () {
    var phone = $(this).closest('tr').children('td:eq(4)').text().trim();
    data = {phone: phone};
    var result = findHistoryModal(data);
    var obj = JSON.parse(result);
    $("#tbody").empty();
    Object.keys(obj).forEach((key) => {
        let sa = obj[key]
        let time = obj[key].saRequest.createdDate
        var rowElement = $('<tr></tr>');
        rowElement.append('<td><h5><a  href="#" onclick="viewInfoOrder(' + sa.saRequest.id + ')">' + sa.saRequest.id + '</a></h5></td>');
        rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
        rowElement.append('<td><h5>' + sa.saRequest.borrow.toLocaleString("vi-VN") + ' đ</h5></td>');
        if (sa.saRequest.status == 'wait') {
            rowElement.append('<td><h5 style="color: darkorange">chờ xét duyệt</h5></td>');

        } else if (sa.saRequest.status == 'wfs') {
            rowElement.append('<td><h5 style="color:  #0aa5df">chờ ký duyệt</h5></td>');

        } else if (sa.saRequest.status == 'done') {
            rowElement.append('<td><h5 style="color: hotpink"> đã hoàn thành</h5></td>');

        } else if (sa.saRequest.status == 'act') {
            rowElement.append('<td><h5 style="color: green">đã giải ngân</h5></td>');

        } else if (sa.saRequest.status == 'deni') {
            rowElement.append('<td><h5 style="color: red">từ chối</h5></td>');

        }
        $("#tbody").append(rowElement)
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

function viewInfoOrder(params) {
    list.forEach((order) => {
        if (order.id == params) {
            let sa = order.status
            console.log(sa)
            if (sa == 'done') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + 'Đã hoàn thành' + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
                $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + ("0" + (order.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeDuyetDate.date.month)).slice(-2) + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (order.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.second)).slice(-2) + '</p>');

                $('#modal-left').modal('show');
            } else if (sa == 'act') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: green">' + 'Đã giải ngân' + '</b></p>');
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
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + 'chờ ký' + '</b></p>');
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
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: darkorange">' + 'chờ xét duyệt' + '</b></p>');
                $('#modal-left').modal('show');
            } else if (sa == 'deni') {
                $("#listView").empty();
                $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
                $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
                $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
                $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
                $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: red">' + 'từ chối' + '</b></p>');
                $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
                $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
                $("#listView").append('<p>Nhận xét :' + ' ' + order.description + '</p>');
                $('#modal-left').modal('show');
            }
        }
    })
}

function viewInfoNoaction(phone, id, comId) {
    selectedsaId = id;
    console.log(selectedsaId)
    let list = result.find(el => el.customer.customerPhone == phone);
    axios({
        method: 'GET',
        url: 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
        headers: {
            // 'Content-Type': 'application/x-www-form-urlencoded',
            'Access-Control-Allow-Origin': 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
        },
        auth: {
            username: "sgfintech",
            password: "k6mzMtPJLPMi5crF"
        }
    })
        .then(function (response) {
            console.log(response)
            const imgCMND = JSON.parse(response.data.cmnd)
            $('#imgCMND').empty();
            Object.keys(imgCMND).forEach((key) => {
                if (imgCMND[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgCMND').append('Bổ sung hình ảnh');
                } else {
                    $('#imgCMND').append('<a href="' + imgCMND[key] + '" target="_blank"><img class="img" src="' + imgCMND[key] + '' + '" /></a>');
                }
            });
            const payslipObj = JSON.parse(response.data.payslip);
            $('#imgPayslip').empty()
            Object.keys(payslipObj).forEach((key) => {
                console.log(payslipObj[key]);
                if (payslipObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgPayslip').append('<a href="' + payslipObj[key] + '" target="_blank"><img class="img" src="' + payslipObj[key] + '" /></a>');
                }
            });
            const salaryObj = JSON.parse(response.data.salary);
            $('#imgSalary').empty()
            Object.keys(salaryObj).forEach((key) => {
                if (salaryObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSalary').append('<a href="' + salaryObj[key] + '" target="_blank"><img class="img" src="' + salaryObj[key] + '" /></a>');
                }

            });
            const healthObj = JSON.parse(response.data.health);
            $('#imgHealth').empty()
            Object.keys(healthObj).forEach((key) => {
                if (healthObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgHealth').append('<a href="' + healthObj[key] + '" target="_blank"><img class="img" src="' + healthObj[key] + '" /></a>');
                }
            });
            const appendixObj = JSON.parse(response.data.appendix);
            $('#imgAppendix').empty()
            Object.keys(appendixObj).forEach((key) => {
                if (appendixObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgAppendix').append('<a href="' + appendixObj[key] + '" target="_blank"><img class="img" src="' + appendixObj[key] + '" /></a>');
                }
            });
            const socialObj = JSON.parse(response.data.social);
            $('#imgSocial').empty()
            Object.keys(socialObj).forEach((key) => {
                if (socialObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSocial').append('<a href="' + socialObj[key] + '" target="_blank"><img class="img" src="' + socialObj[key] + '" /></a>');
                }
            });
            const contractObj = JSON.parse(response.data.contract);
            console.log(contractObj)
            $('#imgContract').empty()
            Object.keys(contractObj).forEach((key) => {
                if (contractObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgContract').append('<a href="' + contractObj[key] + '" target="_blank"><img class="img" src="' + contractObj[key] + '" /></a>');
                }
            });
        })
        .catch(function (error) {
            console.log(error);
        });
    let c = list.customer;
    const date = c.customerBirthday;
    const idDate = c.customerIdDate.date;

    $("#relativeInfo").empty();
    $("#relativeInfo").append(' <h4><b>*</b>&nbsp;&nbsp;Thông tin người thân</h4>');
    if (c.customerRelative) {
        $("#relativeInfo").append('<p>Mối quan hệ : <span id="customerRelative" style="color:grey;">' + c.customerRelative + '</span></p>');
    } else {
        $("#relativeInfo").append('<p>Mối quan hệ : <span  style="color:grey;">Không có thông tin</span></p>');

    }
    if (c.customerRelativePhone) {
        $("#relativeInfo").append('<p>Số điện thoại người thân : <span id="customerRelativePhone" style="color:grey;">' + c.customerRelativePhone + '</span></p>')

    } else {
        $("#relativeInfo").append('<p>Số điện thoại người thân : <span  style="color:grey;">Không có thông tin</span></p>')

    }
    ;
    Object.keys(c).forEach((key) => {
        if (key == "customerSalary") {
            value = c[key]
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
            Object.keys(date).forEach((key) => {
                $('#' + key).text(date[key]);
            })
            Object.keys(idDate).forEach((key) => {
                $('#' + key + 'id').text(idDate[key]);
            })
        } else if (key == "customerHealthInsurance") {
            value = c[key]
            if (value) {
                $('#' + key).text(c[key]);
            } else {
                $('#' + key).text('Không có thông tin');
            }
        } else {
            $('#' + key).text(c[key]);
        }
    })

    list = result.find(el => el.saRequest.id == id);
    let sa = list.saRequest;
    $("#ida").empty();
    $("#ida").append(sa.id);
    $("#saId").empty();
    $("#saId").append('<div class="col-4 "><h3>Mã đơn : <span style="color:grey;" id="saID">' + sa.id + '</span></h3></div>');

    if (sa.status == "done") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người ký duyệt : <span style="color:grey;">' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn : <span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người giải ngân : <span style="color:grey;">' + 'ketoan' + '</span></p>');
        $("#saInfo").append('<p>Ngày giải ngân : <span style="color:grey;">' + ' ' + ("0" + (sa.updatedDate.date.day)).slice(-2) + '/' + ("0" + (sa.updatedDate.date.month)).slice(-2) + '/' + sa.updatedDate.date.year + ' ' + ' ' + ("0" + (sa.updatedDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.updatedDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:hotpink;">' + sa.description + '</b></p>');
        }


    } else if (sa.status == "act") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người ký duyệt : <span style="color:grey;">' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn : <span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');

        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:#0aa5df;">' + sa.description + '</b></p>');
        }
    } else if (sa.status === "wait") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:forestgreen;">' + sa.description + '</b></p>');
        }
    } else if (sa.status === "wfs") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:steelblue;">' + sa.description + '</b></p>');
        }
    } else if (sa.status === "deni" && sa.employeeDuyetDate == null) {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Lý do : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Lý do : <b style="color:red;">' + sa.description + '</b></p>');
        }
    } else if (sa.status === "deni" && sa.employeeDuyetDate != null) {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người duyệt đơn : <span style="color:grey;">' + ' ' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn : <span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Lý do : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Lý do : <b style="color:red;">' + sa.description + '</b></p>');
        }
    }
    list = result.find(el => el.company.id == comId);
    let com = list.company;
    $("#job").empty();
    $("#job").append('<h4><b>*</b>&nbsp;&nbsp;&nbsp;Công việc</h4>');
    $("#job").append('<p>Mã công ty : <span style="color:grey;">' + com.companyCode + '</span></p>');
    $("#job").append('<p>Tên công ty : <span style="color:grey;">' + com.companyName + '</span></p>');
    $("#job").append('<span style="display: none" id="employeeTD">' + list.saRequest.employeeThamdinh + '</span>');
    if (typeof (com.companyAddress) === "undefined") {
        $("#job").append('<p>Địa chỉ công ty : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
    } else {
        $("#job").append('<p>Địa chỉ công ty : <span style="color:grey;">' + com.companyAddress + '</span></p>');

    }
    $("#job").append('<p>Mã nhân viên : <span style="color:grey;">' + com.companyCode + '</span></p>');
    if (list.customer.status == 'wait') {
        $("#job").append('<p>Trạng thái HĐLĐ : <span style="color:grey;">' + 'đang chờ' + '</span></p>');
    } else if (list.customer.status == 'expried') {
        $("#job").append('<p>Trạng thái HĐLĐ : <span style="color:grey;">' + 'hết thời hạn' + '</span></p>');
    } else if (list.customer.status == 'active') {
        $("#job").append('<p>Trạng thái HĐLĐ : <span style="color:grey;">' + 'đang hoạt động' + '</span></p>');
    }
    $("#job").append('<p>Vị trí : <span  style="color:grey;">' + list.customer.customerPosition + '</span></p>');
    $("#job").append('<p>Mức lương : <span  style="color:grey;">' + list.customer.customerSalary.toLocaleString("vi-VN") + " đ" + '</span></p>');


    $('#modal-right').modal('show');
}

function viewInfoCustomer(phone, id, comId) {
    selectedsaId = id;
    let list = result.find(el => el.customer.customerPhone == phone);
    axios({
        method: 'GET',
        url: 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
        headers: {
            // 'Content-Type': 'application/x-www-form-urlencoded',
            'Access-Control-Allow-Origin': 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
        },
        auth: {
            username: "sgfintech",
            password: "k6mzMtPJLPMi5crF"
        }
    })
        .then(function (response) {
            console.log(response)
            const imgCMND = JSON.parse(response.data.cmnd)
            $('#imgCMND').empty();
            Object.keys(imgCMND).forEach((key) => {
                if (imgCMND[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgCMND').append('Bổ sung hình ảnh');
                } else {
                    $('#imgCMND').append('<a href="' + imgCMND[key] + '" target="_blank"><img class="img" src="' + imgCMND[key] + '' + '" /></a>');
                }
            });
            const payslipObj = JSON.parse(response.data.payslip);
            $('#imgPayslip').empty()
            Object.keys(payslipObj).forEach((key) => {
                console.log(payslipObj[key]);
                if (payslipObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgPayslip').append('<a href="' + payslipObj[key] + '" target="_blank"><img class="img" src="' + payslipObj[key] + '" /></a>');
                }
            });
            const salaryObj = JSON.parse(response.data.salary);
            $('#imgSalary').empty()
            Object.keys(salaryObj).forEach((key) => {
                if (salaryObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSalary').append('<a href="' + salaryObj[key] + '" target="_blank"><img class="img" src="' + salaryObj[key] + '" /></a>');
                }

            });
            const healthObj = JSON.parse(response.data.health);
            $('#imgHealth').empty()
            Object.keys(healthObj).forEach((key) => {
                if (healthObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgHealth').append('<a href="' + healthObj[key] + '" target="_blank"><img class="img" src="' + healthObj[key] + '" /></a>');
                }
            });
            const appendixObj = JSON.parse(response.data.appendix);
            $('#imgAppendix').empty()
            Object.keys(appendixObj).forEach((key) => {
                if (appendixObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgAppendix').append('<a href="' + appendixObj[key] + '" target="_blank"><img class="img" src="' + appendixObj[key] + '" /></a>');
                }
            });
            const socialObj = JSON.parse(response.data.social);
            $('#imgSocial').empty()
            Object.keys(socialObj).forEach((key) => {
                if (socialObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgSocial').append('<a href="' + socialObj[key] + '" target="_blank"><img class="img" src="' + socialObj[key] + '" /></a>');
                }
            });
            const contractObj = JSON.parse(response.data.contract);
            $('#imgContract').empty()
            Object.keys(contractObj).forEach((key) => {
                if (contractObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                    $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                } else {
                    $('#imgContract').append('<a href="' + contractObj[key] + '" target="_blank"><img class="img" src="' + contractObj[key] + '" /></a>');
                }
            });
        })
        .catch(function (error) {
            console.log(error);
        });
    let c = list.customer;
    const date = c.customerBirthday;
    const idDate = c.customerIdDate.date;

    $("#relativeInfo").empty();
    $("#relativeInfo").append(' <h4><b>*</b>&nbsp;&nbsp;Thông tin người thân</h4>');
    if (c.customerRelative) {
        $("#relativeInfo").append('<p>Mối quan hệ : <span id="customerRelative" style="color:grey;">' + c.customerRelative + '</span></p>');
    } else {
        $("#relativeInfo").append('<p>Mối quan hệ : <span  style="color:grey;">Không có thông tin</span></p>');

    }
    if (c.customerRelativePhone) {
        $("#relativeInfo").append('<p>Số điện thoại người thân : <span id="customerRelativePhone" style="color:grey;">' + c.customerRelativePhone + '</span></p>')

    } else {
        $("#relativeInfo").append('<p>Số điện thoại người thân : <span  style="color:grey;">Không có thông tin</span></p>')

    }
    ;
    Object.keys(c).forEach((key) => {
        if (key == "customerSalary") {
            value = c[key]
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
            Object.keys(date).forEach((key) => {
                $('#' + key).text(date[key]);
            })
            Object.keys(idDate).forEach((key) => {
                $('#' + key + 'id').text(idDate[key]);
            })
        } else if (key == "customerHealthInsurance") {
            value = c[key]
            if (value) {
                $('#' + key).text(c[key]);
            } else {
                $('#' + key).text('Không có thông tin');
            }
        } else {
            $('#' + key).text(c[key]);
        }
    })
    list = result.find(el => el.saRequest.id == id);
    let sa = list.saRequest;
    $("#ids").empty();
    $("#ids").append(sa.id);
    $("#ida").empty();
    $("#ida").append(sa.id);
    $("#saId").empty();
    $("#saId").append('<div class="col-4 "><h3>Mã đơn : <span style="color:grey;" id="saID">' + sa.id + '</span></h3></div>');
    $("#idd").empty();
    $("#idd").append(sa.id);
    if (sa.status == "done") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người ký duyệt : <span style="color:grey;">' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn : <span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người giải ngân : <span style="color:grey;">' + 'ketoan' + '</span></p>');
        $("#saInfo").append('<p>Ngày giải ngân : <span style="color:grey;">' + ' ' + ("0" + (sa.updatedDate.date.day)).slice(-2) + '/' + ("0" + (sa.updatedDate.date.month)).slice(-2) + '/' + sa.updatedDate.date.year + ' ' + ' ' + ("0" + (sa.updatedDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.updatedDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:hotpink;">' + sa.description + '</b></p>');
        }

    } else if (sa.status == "act") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người ký duyệt : <span style="color:grey;">' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn : <span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');

        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:#0aa5df;">' + sa.description + '</b></p>');
        }
        $("#danhgia").empty();
        $("#labelDanhgia").empty();
        $("#labelDanhgia").append('Đánh giá');
        $("#danhgia").append('<div class="col-4"><p>Giải ngân : Thông tin nhận tiền đầy đủ</p><button class="btn btn-rounded btn-info btn-accept" data-toggle="modal" href="#giainganVerify">Hoàn thành chuyển tiền </button> </div>');
    } else if (sa.status === "wait") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:forestgreen;">' + sa.description + '</b></p>');
        }
        $("#danhgia").empty();
        $("#labelDanhgia").empty();
        $("#labelDanhgia").append('Đánh giá');
        $("#danhgia").append('<div class="col-4"><p>Thẩm định hồ sơ : Thông tin đầy đủ</p> <button class="btn btn-rounded btn-info btn-accept" data-toggle="modal" href="#thamdinhVerify">Đồng ý</button> </div>');
        $("#danhgia").append(' <div class="col-4"><p>Thẩm định từ chối :</p><select id = "reason" class = "form-control" > <option selected disabled hidden> --Lí do từ chối-- </option><option value="CMND không hợp lệ">CMND không hợp lệ </option> <option value="Bảo hiểm y tế hết hạn">Bảo hiểm y tế hết hạn </option> <option value="Mã bảo hiểm y tế không có thông tin">Mã bảo hiểm y tế không có thông tin </option> <option value="Mã bảo hiểm y tế không phải  thuộc mã DN(doanh nghiệp)">Mã bảo hiểm y tế không phải thuộc mã DN(doanh nghiệp) </option> <option value="Mức lương trong phiếu lương không trùng khớp với hệ thống"> Mức lương trong phiếu lương không trùng khớp với hệ thống </option> <option value="Sai vị trí công tác/chức vụ">Sai vị trí công tác/chức vụ </option> </select> <button class="btn btn-rounded btn-dark btn-refuse" style="margin-top:4%" onclick="tuchoiQuanlyxetduyet()">Từ chối </button> </div>');
    } else if (sa.status == "deni" && sa.employeeDuyetDate == null) {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Lý do : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Lý do : <b style="color:red;">' + sa.description + '</b></p>');
        }
        $("#labelDanhgia").empty();
        $("#labelDanhgia").append('Đánh giá');
        $("#danhgia").empty();
        $("#danhgia").append('<div class="col-4"><button class="btn btn-rounded btn-info btn-accept" onclick="updateDeclineThamdinh()" >Cập nhật lại</button></div> ');

    } else if (sa.status == "deni" && sa.employeeDuyetDate != null) {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người duyệt đơn :<span style="color:grey;">' + ' ' + sa.employeeDuyet + '</span></p>');
        $("#saInfo").append('<p>Ngày duyệt đơn :<span style="color:grey;">' + ' ' + ("0" + (sa.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeDuyetDate.date.month)).slice(-2) + '/' + sa.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (sa.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeDuyetDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Lý do : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Lý do : <b style="color:red">' + sa.description + '</b></p>');
        }
        $("#labelDanhgia").empty();
        $("#danhgia").empty();
        $("#labelDanhgia").append('Đánh giá');
        $("#danhgia").append('<div class="col-4"><button class="btn btn-rounded btn-info btn-accept" onclick="updateDeclineKyduyet()">Cập nhật lại</button> </div>');
    } else if (sa.status === "wfs") {
        $("#saInfo").empty();
        $("#saInfo").append('<h4><b>*</b>&nbsp;&nbsp;Thông tin yêu cầu</h4>');
        $("#saInfo").append('<p>Tên khách hàng : <span style="color:grey;">' + list.customer.customerName + '</span></p>');
        $("#saInfo").append('<p>Phí dịch vụ : <span style="color:grey;">' + (sa.borrow * 0.02).toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Số tiền tạm ứng : <span style="color:grey;">' + sa.borrow.toLocaleString('vi-VN') + 'đ' + '</span></p>');
        $("#saInfo").append('<p>Ngày yêu cầu :' + '<span style="color:grey;"> ' + ("0" + (sa.createdDate.date.day)).slice(-2) + '/' + ("0" + (sa.createdDate.date.month)).slice(-2) + '/' + sa.createdDate.date.year + ' ' + ' ' + ("0" + (sa.createdDate.time.hour)).slice(-2) + ':' + ("0" + (sa.createdDate.time.minute)).slice(-2) + ':' + ("0" + (sa.createdDate.time.second)).slice(-2) + '</span></p>');
        $("#saInfo").append('<p>Người thẩm định : <span style="color:grey;">' + sa.employeeThamdinh + '</span></p>');
        $("#saInfo").append('<p>Ngày thẩm định :' + ' <span style="color:grey;"> ' + ("0" + (sa.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (sa.employeeThamdinhDate.date.month)).slice(-2) + '/' + sa.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (sa.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (sa.employeeThamdinhDate.time.second)).slice(-2) + '</span></p>');
        if (typeof (sa.description) === "undefined") {
            $("#saInfo").append('<p>Đánh giá : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
        } else {
            $("#saInfo").append('<p>Đánh giá : <b style="color:steelblue;">' + sa.description + '</b></p>');
        }
        $("#danhgia").empty();
        $("#labelDanhgia").empty();
        $("#labelDanhgia").append('Đánh giá');
        $("#danhgia").append('<div class="col-4"><p>Duyệt đồng ý : Thông tin đầy đủ</p><button class="btn btn-rounded btn-info btn-accept" data-toggle="modal" href="#kyduyetVerify" >Đồng ý</button> </div>');
        $("#danhgia").append(' <div class="col-4"><p>Duyệt từ chối :</p> <select id = "reason" class = "form-control" > <option selected disabled hidden> --Lí do từ chối-- </option><option value="CMND không hợp lệ">CMND không hợp lệ </option> <option value="Bảo hiểm y tế hết hạn">Bảo hiểm y tế hết hạn </option> <option value="Mã bảo hiểm y tế không có thông tin">Mã bảo hiểm y tế không có thông tin </option> <option value="Mã bảo hiểm y tế không phải  thuộc mã DN(doanh nghiệp)">Mã bảo hiểm y tế không phải thuộc mã DN(doanh nghiệp) </option> <option value="Mức lương trong phiếu lương không trùng khớp với hệ thống"> Mức lương trong phiếu lương không trùng khớp với hệ thống </option> <option value="Sai vị trí công tác/chức vụ">Sai vị trí công tác/chức vụ </option> </select> ' +
            '<button class="btn btn-rounded btn-dark btn-refuse" style="margin-top:4%" onclick="tuchoiDuyetGiaiNgan()">Từ chối </button> </div>');
    }

    list = result.find(el => el.company.id == comId);
    let com = list.company;
    $("#job").empty();
    $("#job").append('<h4><b>*</b>&nbsp;&nbsp;&nbsp;Công việc</h4>');
    $("#job").append('<p>Mã công ty : <span style="color:grey;">' + com.companyCode + '</span></p>');
    $("#job").append('<p>Tên công ty : <span style="color:grey;">' + com.companyName + '</span></p>');
    $("#job").append('<p>Số điện thoại công ty : <span style="color:grey;">' + com.companyPhone + '</span></p>');
    $("#job").append('<span style="display: none" id="employeeduyet">' + list.saRequest.employeeDuyet + '</span>');
    $("#job").append('<span style="display: none" id="employeeTD">' + list.saRequest.employeeThamdinh + '</span>');
    if (typeof (com.companyAddress) === "undefined") {
        $("#job").append('<p>Địa chỉ công ty : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
    } else {
        $("#job").append('<p>Địa chỉ công ty : <span style="color:grey;">' + com.companyAddress + '</span></p>');
    }
    $("#job").append('<p>Mã nhân viên : <span style="color:grey;">' + list.customer.customerCode + '</span></p>');
    $("#job").append('<p>Trạng thái HĐLĐ : <span style="color:green;">' + 'đang hoạt động' + '</span></p>');

    $("#job").append('<p>Vị trí : <span  style="color:grey;">' + list.customer.customerPosition + '</span></p>');
    $("#job").append('<p>Mức lương : <span  style="color:grey;">' + list.customer.customerSalary.toLocaleString("vi-VN") + " đ" + '</span></p>');
    $('#modal-right').modal('show');
}