function gachno() {
    $("#loading").show();
    var dataRequest = $("#idContract").text();
    var moneyRemain = $("#remainAmountBorrow").text().trim();
    var moneyRepay = $("#TotalFee1").text().trim();
    var total = moneyRemain - moneyRepay;
    let data = {datarequest: dataRequest, moneyRemainAmount: moneyRemain, moneyRepay: moneyRepay, total: total};
    var result = submitWithdraw(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
        $("#tr-" + selectedContractId).remove();
        $('#modalHoadonGachno').modal('hide');
        $("#remainAmountBorrowOrder-" + dataRequest).empty();
        $("#remainAmountBorrowOrder-" + dataRequest).append(total.toLocaleString("vi-VN") + ' đ');
    } else if (result === "roleError") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Bạn không có quyền gạch nợ',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();

    } else if (result === "notcomplete") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
        $('#modalHoadonGachno').modal('hide');
        $("#" + dataRequest).empty();
        $("#" + dataRequest).append((total + (total * 0.02)).toLocaleString("vi-VN") + ' đ');

    } else {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Có lỗi xảy ra trong quá trình thực thi vui lòng thử lại',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();

    }
};

function submitWithdraw(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "gachno",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
        console.log(data)
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}

function viewInfo(idContract, custPhone) {
    selectedContractId = idContract;
    console.log(selectedContractId)

    let viewInvoice = result.find(el => el.customer.customerPhone == custPhone);
    console.log(viewInfo)
    const cust = viewInvoice.customer;

    Object.keys(cust).forEach((key) => {
        $('#' + key + 'g').text(cust[key]);
    });
    viewInvoice = result.find(el => el.contract.idContract == idContract);
    const contract = viewInvoice.contract;
    Object.keys(contract).forEach((key) => {
        if (key == "remainAmountBorrow") {
            let value = contract[key] + (contract[key] * 0.02);
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
            $('#remainAmountBorrow1').text(value.toLocaleString("vi-VN") + " đ");

        } else if (key == "borrow") {
            let value1 = contract[key];
            $('#' + key).text(value1.toLocaleString("vi-VN") + " đ");
        } else if (key == "feeBorrow") {
            let total = contract[key]
            $('#TotalFee').text(total.toLocaleString("vi-VN") + " đ");
        } else {
            $('#' + key).text(contract[key]);
        }
    });
    $('#modalHoadonGachno').modal("show");
}

function viewInfoCustomer(phone, comId, idContract) {
    let username = "sgfintech";
    let password = "k6mzMtPJLPMi5crF";
    result.forEach((customer) => {
        if (customer.customer.customerPhone == phone) {
            $.ajax({
                url: 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
                headers: {
                    "Access-Control-Allow-Origin": 'https://dev.sgft.info/customergateway/api/v1/document/' + phone,
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
                    console.log(imgCMND)
                    $('#imgCMNDc').empty();
                    Object.keys(imgCMND).forEach((key) => {
                        if (imgCMND[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgCMNDc').append('Bổ sung hình ảnh');
                        } else {
                            $('#imgCMNDc').append('<img class="img" src="' + imgCMND[key] + '"/>');
                        }
                    });
                    const payslipObj = JSON.parse(data.payslip);
                    $('#imgPayslipc').empty()
                    Object.keys(payslipObj).forEach((key) => {
                        if (payslipObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgPayslipc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgPayslipc').append('<img class="img" src="' + payslipObj[key] + '"/>');
                        }
                    });
                    const salaryObj = JSON.parse(data.salary);
                    $('#imgSalary').empty()
                    Object.keys(salaryObj).forEach((key) => {
                        if (salaryObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgSalaryc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSalaryc').append('<img class="img" src="' + salaryObj[key] + '"/>');
                        }
                    });
                    const healthObj = JSON.parse(data.health);
                    $('#imgHealthc').empty()
                    Object.keys(healthObj).forEach((key) => {
                        if (healthObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgHealthc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgHealthc').append('<img class="img"  src="' + healthObj[key] + '"/>');
                        }
                    });
                    const appendixObj = JSON.parse(data.appendix);
                    $('#imgAppendixc').empty()
                    Object.keys(appendixObj).forEach((key) => {
                        if (appendixObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgAppendixc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgAppendixc').append('<img class="img" src="' + appendixObj[key] + '"/>');
                        }
                    });
                    const socialObj = JSON.parse(data.social);
                    $('#imgSocialc').empty()
                    Object.keys(socialObj).forEach((key) => {
                        if (socialObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgSocialc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSocialc').append('<img class="img" src="' + socialObj[key] + '"/>');
                        }
                    });
                    const contractObj = JSON.parse(data.contract);
                    $('#imgContractc').empty()
                    Object.keys(contractObj).forEach((key) => {
                        if (contractObj[key] == 'https://dev.sgft.info/upload/' + phone + '@') {
                            $('#imgContractc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgContractc').append('<img class="img" src="' + contractObj[key] + '"/>');
                        }
                    });
                },
            });
            let c = customer.customer;
            const date = c.customerBirthday;
            const idate = c.customerIdDate
            $("#dateCMND").empty();
            $("#dateCMND").append('<td> Ngày cấp : <span style="color: grey">' + ("0" + (idate.date.day)).slice(-2) + '/' + ("0" + (idate.date.month)).slice(-2) + '/' + idate.date.year + ' ' + '</span></td>');
            Object.keys(c).forEach((key) => {
                if (key == "customerSalary") {
                    value = c[key]
                    $('#' + key + 'c').text(value.toLocaleString("vi-VN") + " đ");
                    Object.keys(date).forEach((key) => {
                        if (key == "monthc" || key == "dayc") {
                            value1 = "0" + date[key]
                            $('#' + key + 'c').text(value1.slice(-2));
                        } else {
                            $('#' + key + 'c').text(date[key]);
                        }

                    })
                } else {
                    $('#' + key + 'c').text(c[key]);
                }
            })

        }
    })
    list = result.find(el => el.companies.id == comId);
    let comp = list.companies
    $("#jobc").empty();
    $("#jobc").append('<h4><b>*</b>&nbsp;&nbsp;&nbsp;Công việc</h4>');
    $("#jobc").append('<p>Mã công ty : <span style="color:grey;">' + comp.companyCode + '</span></p>');
    $("#jobc").append('<p>Tên công ty : <span style="color:grey;">' + comp.companyName + '</span></p>');
    if (typeof (comp.companyAddress) === "undefined") {
        $("#jobc").append('<p>Địa chỉ công ty : <span style="color:grey;">' + 'không có thông tin' + '</span></p>');
    } else {
        $("#jobc").append('<p>Địa chỉ công ty : <span style="color:grey;">' + comp.companyAddress + '</span></p>');
    }
    $("#jobc").append('<p>Mã nhân viên : <span style="color:grey;">' + list.customer.customerCode + '</span></p>');
    $("#jobc").append('<p>Trạng thái HĐLĐ : <span style="color:grey;">' + 'đang hoạt động' + '</span></p>');
    $("#jobc").append('<p>Vị trí : <span  style="color:grey;">' + list.customer.customerPosition + '</span></p>');
    $("#jobc").append('<p>Mức lương : <span  style="color:grey;">' + list.customer.customerSalary.toLocaleString("vi-VN") + " đ" + '</span></p>');
    console.log(list)
    let com = list.companies;
    Object.keys(com).forEach((key) => {
        $('#' + key).text(com[key]);
        if (key = "companyPhone") {
            valuephone = com[key]
            console.log(valuephone)
            if (value !== "undefined" && valuephone) {
                $('#' + key).text(com[key]);
            } else {
                $('#' + key).text('Số điện thoại không có');
            }
        }
    })

    list = result.find(el => el.contract.idContract == idContract);
    let con = list.contract;
    let time = con.createdDate;
    $('#planShow').empty();
    var rowElement = $('<tr></tr>');
    rowElement.append('<td class="text-center">' + 'Nhắc hạn' + '</td>');
    rowElement.append('<td class="text-center"><h5>' + '05/02/2021' + ' đ</h5></td>');
    rowElement.append('<td><h5>' + con.borrow.toLocaleString("vi-VN") + ' đ</h5></td>');
    rowElement.append('<td><h5>' + '2 %' + '</h5></td>');
    rowElement.append('<td><h5>' + (con.borrow * 0.02).toLocaleString("vi-VN") + ' đ</h5></td>');
    rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + time.date.year + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
    rowElement.append('<td><h5>' + (con.borrow + (con.borrow * 0.02)).toLocaleString("vi-VN") + ' đ</h5></td>');
    $('#planShow').append(rowElement);
    Object.keys(con).forEach((key) => {
        console.log(con[key])

        $('#' + key + 'imp').text(con[key]);
    })
    $('#modalRepayment').modal('show');
}

$("#rootcheckbox").click(function () {
    $('input:checkbox').not(this).prop('checked', this.checked);
});

$("body").on("click", ".as", function () {
    var datarequest = $(this).closest("tr").find('td:eq(6)').text().trim();
    let data = {dataRequest: datarequest};
    var result = findHistoryModal(data);
    var obj = JSON.parse(result);
    $("#tbodyCon").empty();
    Object.keys(obj).forEach((key) => {
        let con = obj[key]
        console.log(con)
        let time = obj[key].contract.createdDate
        var rowElement = $('<tr></tr>');
        rowElement.append('<td><h5><a  href="#" onclick="viewInfoContract(' + con.contract.idContract + ')">' + con.contract.idContract + '</a></h5></td>');
        rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
        rowElement.append('<td><h5>' + con.contract.acceptedBy + ' </td>');

        rowElement.append('<td><h5>' + con.contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</h5></td>');
        rowElement.append('<td><h5>' + con.contract.borrow.toLocaleString("vi-VN") + ' đ</h5></td>');
        if (con.contract.status == 'act') {
            rowElement.append('<td><h5 style="color:#0D8BBD">đã giải ngân</h5></td>');

        } else if (con.contract.status == 'done') {
            rowElement.append('<td><h5 style="color: hotpink">đã tất toán</h5></td>');

        }
        $("#tbodyCon").append(rowElement)
    })
});

function viewInfoContract(params) {
    salist.forEach((contract) => {
        console.log(salist)
        if (contract.idContract == params) {

            if (contract.status == "act") {
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã đơn :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>Ngày giải ngân :' + ' ' + ("0" + (contract.createdDate.date.day)).slice(-2) + '/' + ("0" + (contract.createdDate.date.month)).slice(-2) + '/' + contract.createdDate.date.year + ' ' + ' ' + ("0" + (contract.createdDate.time.hour)).slice(-2) + ':' + ("0" + (contract.createdDate.time.minute)).slice(-2) + ':' + ("0" + (contract.createdDate.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Người giải ngân :' + ' ' + contract.acceptedBy + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + '2 %' + '</p>');
                $("#contractView").append('<p>Mức Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0D8BBD">' + 'đã giải ngân' + '</b></p>');
                $("#contractView").append('<p>Số tiền còn nợ :' + ' ' + '0' + ' đ</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Mã hệ thống(System Trace) :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Số tiền thanh toán :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Ngày thanh toán :' + ' ' + ("0" + (contract.dateRepayment.date.day)).slice(-2) + '/' + ("0" + (contract.dateRepayment.date.month)).slice(-2) + '/' + contract.dateRepayment.date.year + ' ' + ' ' + ("0" + (contract.dateRepayment.time.hour)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.minute)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Hạn thanh toán :' + ' ' + '05/02/2021' + '</p>');
            } else if (contract.status == "done") {
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã đơn :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>Ngày giải ngân :' + ' ' + ("0" + (contract.createdDate.date.day)).slice(-2) + '/' + ("0" + (contract.createdDate.date.month)).slice(-2) + '/' + contract.createdDate.date.year + ' ' + ' ' + ("0" + (contract.createdDate.time.hour)).slice(-2) + ':' + ("0" + (contract.createdDate.time.minute)).slice(-2) + ':' + ("0" + (contract.createdDate.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Người giải ngân :' + ' ' + contract.acceptedBy + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + '2 %' + '</p>');
                $("#contractView").append('<p>Mức Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + 'đã tất toán' + '</b></p>');
                $("#contractView").append('<p>Số tiền còn nợ :' + ' ' + '0' + ' đ</p>');
                $("#contractView").append('<p>Số tiền thanh toán :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Mã hệ thống(System Trace) :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Ngày thanh toán :' + ' ' + ("0" + (contract.dateRepayment.date.day)).slice(-2) + '/' + ("0" + (contract.dateRepayment.date.month)).slice(-2) + '/' + contract.dateRepayment.date.year + ' ' + ' ' + ("0" + (contract.dateRepayment.time.hour)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.minute)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Hạn thanh toán :' + ' ' + '05/02/2021' + '</p>');
                $("#contractView").append('<p>Người gạch nợ :' + ' ' + contract.acceptedBy + '</p>');
                $("#contractView").append('<p>Ngày gạch nợ :' + ' ' + ("0" + (contract.dateRepayment.date.day)).slice(-2) + '/' + ("0" + (contract.dateRepayment.date.month)).slice(-2) + '/' + contract.dateRepayment.date.year + ' ' + ' ' + ("0" + (contract.dateRepayment.time.hour)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.minute)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.second)).slice(-2) + '</p>');

            }


            $('#modalContract').modal('show');
        }

    })
}

function findHistoryModal(data) {
    let result = "";
    try {
        $.ajax({
            type: "POST",
            timeout: 100000,
            url: "findContractHistoryModal",
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
