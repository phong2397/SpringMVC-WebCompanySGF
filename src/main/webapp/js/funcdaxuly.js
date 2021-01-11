function viewInfoCompany(params) {
    result.forEach((company) => {
        if (company.companies.companyCode == params) {
            let c = company.companies;
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

function viewInfoContract(params) {
    result.forEach((contract) => {
        if (contract.contract.idContract == params) {
            let c = contract.contract;
            let time = c.createdDate.date;
            let second = c.createdDate.time;
            console.log(second)
            Object.keys(c).forEach((key) => {
                if (key == "borrow") {
                    value = c[key]
                    $('#' + key).text(value.toLocaleString("vi-VN") + " đ");
                    Object.keys(time).forEach((key) => {
                        console.log(time[key])
                        $('#' + key + '1').text(time[key]);
                    })
                    Object.keys(second).forEach((key) => {
                        console.log(second[key])
                        $('#' + key).text(second[key]);
                    })
                } else {
                    $('#' + key).text(c[key]);
                }
            })
        }
    })
    $('#modal').modal('show');
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