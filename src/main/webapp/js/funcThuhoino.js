//function xảy ra khi nhấn vào số điện thoại trong column thứ 2 gọi đến data ajax thực hiện thành công hiển thị nội dung các đơn hàng và ngày yêu cầu vào modal
$("body").on("click", ".as", function () {
    var datarequest = $(this).closest("tr").find('td:eq(1)  > h6  > b  > .as').text().trim();// tìm đến số điện thoai của td thứ 1
    let data = {dataRequest: datarequest};
    var result = findHistoryModal(data);
    var obj = JSON.parse(result);
    $("#tbodytable").empty();
    Object.keys(obj).forEach((key) => {
        let con = obj[key]
        let time = obj[key].contract.createdDate
        var rowElement = $('<tr></tr>');
        rowElement.append('<td><h5><a  href="#" onclick="viewInfoContract(' + con.contract.idContract + ')">' + con.contract.idContract + '</a></h5></td>');
        rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
        $("#tbodytable").append(rowElement);
    })
});

//function ajax gọi đến value trong TotalListController thực hiện truy vấn trả về danh sách contract đúng với số điện thoại đó
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

//function xảy ra khi nhấn vào submit payment gọi đến data ajax , thực hiện thành công hiển thị popup alert thông báo
$("body").on("click", ".btn-success", function () {
    $("#loading").show();
    var dataRequest = $("#idContract").text(); // tìm id contract
    console.log(dataRequest)
    let data = {datarequest: dataRequest, status: 'done'};
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
        $('#main').hide();
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

//function ajax gọi đến value trong  WriteoffController thực hiện cập nhật thông tin chờ gạch nợ trong bảng table contract
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
        $('#' + key).text(cust[key]);
    });
    viewInvoice = result.find(el => el.contract.idContract == idContract);
    const contract = viewInvoice.contract;
    Object.keys(contract).forEach((key) => {
        if (key == "remainAmountBorrow") {
            let value = (2 / 100 * contract[key]) + contract[key];
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");

        } else if (key == "borrow") {
            let value1 = contract[key];
            $('#' + key).text(value1.toLocaleString("vi-VN") + " đ");
        } else {
            $('#' + key).text(contract[key]);
        }
    });
    $('#main').slideDown("slow");
}

function viewInfoCustomer(phone, comId, idContract) {
    let username = "sgfintech";
    let password = "k6mzMtPJLPMi5crF";
    result.forEach((customer) => {
        if (customer.customer.customerPhone == phone) {
            $.ajax({
                url: 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + phone,
                headers: {
                    "Access-Control-Allow-Origin": 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + phone,
                    "Access-Control-Allow-Credentials": true,
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Basic " + btoa(username + ":" + password));
                },
                crossDomain: true,
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    const imgCMND = JSON.parse(data.cmnd);
                    $('#imgCMNDc').empty();
                    Object.keys(imgCMND).forEach((key) => {
                        if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgCMNDc').append('Bổ sung hình ảnh');
                        } else {
                            $('#imgCMNDc').append('<img class="img" src="' + imgCMND[key] + '"/>');
                        }
                    });
                    const payslipObj = JSON.parse(data.payslip);
                    $('#imgPayslipc').empty();
                    Object.keys(payslipObj).forEach((key) => {
                        console.log(payslipObj[key])
                        if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgPayslipc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgPayslipc').append('<img class="img" src="' + payslipObj[key] + '"/>');
                        }
                    });
                    const salaryObj = JSON.parse(data.salary);
                    $('#imgSalaryc').empty();
                    Object.keys(salaryObj).forEach((key) => {
                        console.log(salaryObj[key]);
                        if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgSalaryc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSalaryc').append('<img class="img" src="' + salaryObj[key] + '"/>');
                        }
                    });
                    const healthObj = JSON.parse(data.health);
                    $('#imgHealthc').empty();
                    Object.keys(healthObj).forEach((key) => {
                        console.log(healthObj[key]);
                        if (healthObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgHealthc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgHealthc').append('<img class="img"  src="' + healthObj[key] + '"/>');
                        }
                    });
                    const appendixObj = JSON.parse(data.appendix);
                    $('#imgAppendixc').empty();
                    Object.keys(appendixObj).forEach((key) => {
                        console.log(appendixObj[key]);
                        if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgAppendixc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgAppendixc').append('<img class="img" src="' + appendixObj[key] + '"/>');
                        }
                    });
                    const socialObj = JSON.parse(data.social);
                    $('#imgSocialc').empty();
                    Object.keys(socialObj).forEach((key) => {
                        console.log(socialObj[key]);
                        if (socialObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgSocialc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSocialc').append('<img class="img" src="' + socialObj[key] + '"/>');
                        }
                    });
                    const contractObj = JSON.parse(data.contract);
                    $('#imgContractc').empty();
                    Object.keys(contractObj).forEach((key) => {
                        console.log(contractObj[key]);
                        if (contractObj[key] == 'http://dev.sgft.info:8080/upload/' + phone + '@') {
                            $('#imgContractc').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgContractc').append('<img style="width: 100%" src="' + contractObj[key] + '"/>');
                        }
                    });
                },
            });
            let c = customer.customer;
            const date = c.customerBirthday;
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
    let com = list.companies;
    console.log(com)
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

