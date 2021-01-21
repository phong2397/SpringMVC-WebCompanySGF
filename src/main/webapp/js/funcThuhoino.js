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
                    const imgCMND = JSON.parse(data.cmnd);
                    $('#imgCMND').empty();
                    Object.keys(imgCMND).forEach((key) => {
                        console.log(imgCMND[key])
                        if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgCMND').append('Bổ sung hình ảnh');
                        } else {
                            $('#imgCMND').append('<img style="width: 100%" src="' + imgCMND[key] + '"/>');
                        }
                    });
                    const payslipObj = JSON.parse(data.payslip);
                    $('#imgPayslip').empty();
                    Object.keys(payslipObj).forEach((key) => {
                        console.log(payslipObj[key])
                        if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgPayslip').append('<img style="width: 100%" src="' + payslipObj[key] + '"/>');
                        }
                    });
                    const salaryObj = JSON.parse(data.salary);
                    $('#imgSalary').empty();
                    Object.keys(salaryObj).forEach((key) => {
                        console.log(salaryObj[key]);
                        if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSalary').append('<img style="width: 100%" src="' + salaryObj[key] + '"/>');
                        }
                    });
                    const healthObj = JSON.parse(data.health);
                    $('#imgHealth').empty();
                    Object.keys(healthObj).forEach((key) => {
                        console.log(healthObj[key]);
                        if (healthObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgHealth').append('<img style="width: 100%"  src="' + healthObj[key] + '"/>');
                        }
                    });
                    const appendixObj = JSON.parse(data.appendix);
                    $('#imgAppendix').empty();
                    Object.keys(appendixObj).forEach((key) => {
                        console.log(appendixObj[key]);
                        if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgAppendix').append('<img style="width: 100%" src="' + appendixObj[key] + '"/>');
                        }
                    });
                    const socialObj = JSON.parse(data.social);
                    $('#imgSocial').empty();
                    Object.keys(socialObj).forEach((key) => {
                        console.log(socialObj[key]);
                        if (socialObj[key] == 'http://dev.sgft.info:8080/upload/' + params + '@') {
                            $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                        } else {
                            $('#imgSocial').append('<img style="width: 100%" src="' + socialObj[key] + '"/>');
                        }
                    });
                    const contractObj = JSON.parse(data.contract);
                    $('#imgContract').empty();
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
                        console.log(date[key])
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


