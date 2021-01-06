$("body").on("click", ".btn-accept", function () {
    var dataRequest = $("#saRequestID").text();
    let data = {datarequest: dataRequest, status:'wfs', step:'1'};
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

$("body").on("click", ".btn-refuse", function () {
    $("#loading").show();
    var dataRequest = $("#saRequestID").text();
    console.log(dataRequest);
    let data = {datarequest: dataRequest, status: 'deni', step: '1'};
    var result = sendOrder(data);
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
function viewInfoOrder(id) {
    list = result.find(el => el.saRequest.id == id);
    console.log(list)
    const saRequest = list.saRequest;
    Object.keys(saRequest).forEach((key) => {
        if (key == "borrow") {
            let value1 = saRequest[key] + (saRequest[key]* 0.2);
            $('#' + key).text(value1.toLocaleString("vi-VN") + " đ");
        } else {
            $('#' + key).text(saRequest[key]);
        }
    });
    // var index =
    $('#modal-left').modal('show');
}

function viewInfoCompany(params) {
    result.forEach((company) => {
        if (company.company.companyCode == params) {
            let c = company.company;
            Object.keys(c).forEach((key) => {
                $('#' + key).text(c[key]);
            })
        }
    })
    console.log(result);
    $('#modal-center').modal('show');
}

function viewInfoCustomer(params) {
    result.forEach((customer) => {
        if (customer.customer.customerPhone == params) {
            axios({
                method: 'GET',
                url: 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                headers: {
                    // 'Content-Type': 'application/x-www-form-urlencoded',
                    'Access-Control-Allow-Origin': 'http://dev.sgft.info:8080/customergateway/api/v1/document/' + params,
                },
                auth: {
                    username: "sgfintech",
                    password: "k6mzMtPJLPMi5crF"
                }
            })
                .then(function (response) {
                    const imgCMND = JSON.parse(response.data.cmnd)
                    $('#imgCMND').empty();
                    Object.keys(imgCMND).forEach((key)=>{
                        if (imgCMND[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgCMND').append('Bổ sung hình ảnh');
                        }else{
                            $('#imgCMND').append('<img style="width: 100%" src="' + imgCMND[key] +'"/>');
                        }
                    });
                    const payslipObj = JSON.parse(response.data.payslip);
                    $('#imgPayslip').empty()
                    Object.keys(payslipObj).forEach((key)=>{
                        console.log(payslipObj[key]);
                        if (payslipObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgPayslip').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgPayslip').append('<img style="width: 100%" src="' + payslipObj[key] +'"/>');
                        }
                    });
                    const salaryObj = JSON.parse(response.data.salary);
                    $('#imgSalary').empty()
                    Object.keys(salaryObj).forEach((key)=>{
                        if (salaryObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgSalary').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgSalary').append('<img style="width: 100%" src="' + salaryObj[key] +'"/>');
                        }

                    });
                    const healthObj = JSON.parse(response.data.health);
                    $('#imgHealth').empty()
                    Object.keys(healthObj).forEach((key)=>{
                        if (healthObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgHealth').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgHealth').append('<img style="width: 100%"  src="' + healthObj[key] +'"/>');
                        }
                    });
                    const appendixObj = JSON.parse(response.data.appendix);
                    $('#imgAppendix').empty()
                    Object.keys(appendixObj).forEach((key)=>{
                        if (appendixObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgAppendix').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgAppendix').append('<img style="width: 100%" src="' + appendixObj[key] +'"/>');
                        }
                    });
                    const socialObj = JSON.parse(response.data.social);
                    $('#imgSocial').empty()
                    Object.keys(socialObj).forEach((key)=>{
                        if (socialObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgSocial').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgSocial').append('<img style="width: 100%" src="' + socialObj[key] +'"/>');
                        }
                    });
                    const contractObj = JSON.parse(response.data.contract);
                    $('#imgContract').empty()
                    Object.keys(contractObj).forEach((key)=>{
                        if (contractObj[key] == 'http://dev.sgft.info:8080/upload/'+params+'@'){
                            $('#imgContract').append('<div style="color: grey">Không có hình ảnh</div>');
                        }else{
                            $('#imgContract').append('<img style="width: 100%" src="' + contractObj[key] +'"/>');
                        }
                    });
                })
                .catch(function (error) {
                    console.log(error);
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
    $('#modal-right').modal('show');
}