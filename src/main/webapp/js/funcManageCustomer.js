$( document ).ready(function() {
    $("#loading").css("display", "none");
    $("body").on("click", ".btn-outline", function () {
        var companyCode = $("#companyCode").val();
        var data = {companyCode:companyCode};
        var dataobject = ajaxPost(data);
        //todo parse dataobject => json object
        try {
            var obj = JSON.parse(dataobject);
        } catch (error) {
            var obj = dataobject;
        }
        //forech(item: jsonobject){
        var body = $("#tbodytable");
        body.empty();
        for (var i = 0; i < obj.length; i++){
            var e = obj[i];
            var rowElement = $('<tr></tr>');
            rowElement.append('<td>' + e.customer.companyCode + '</td>');
            rowElement.append('<td ><b>' + e.customer.customerName+'</b><br>' +
                'Mã số nhân viên :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerCode+  '</span><br>'+
                'Số điện thoại :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerPhone +  '</span><br>' +
                'Ngày sinh :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerBirthday.day +'-' + e.customer.customerBirthday.month +'-' + e.customer.customerBirthday.year +  '</span><br>' +
                'Giới tính :'+' '+ '<span className="d-block text-muted font-weight-normal">'+ e.customer.customerGender + '</span></td>');
            rowElement.append('<td>' +'Thường trú :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerAddress +'</span><br>'+
                'Tạm trú :'+' '+ '<span className="d-block text-muted font-weight-normal">'+ e.customer.customerAddressTemp  +'</span></td>');
            rowElement.append('<td>' +'Vị trí :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerPosition + '<br>'+
                'Lương :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerSalary+' ' +'đ</td>');
            rowElement.append('<td>' +
                'CMND :'+ ' '+'<span className="d-block text-muted font-weight-normal">'+e.customer.customerId + '</span><br>'+
                'Nơi cấp :'+ ' '+'<span className="d-block text-muted font-weight-normal">'+e.customer.customerIdLocation +'</span><br>'+
                'Ngày cấp :'+' '+'<span className="d-block text-muted font-weight-normal">'+e.customer.customerIdDate.date.day +'-' + e.customer.customerIdDate.date.month +'-' + e.customer.customerIdDate.date.year  + '</span></td>');
            rowElement.append('<td xmlns="http://www.w3.org/1999/html">' +
                'Tên ngân hàng :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerBankName+'</span><br>' +
                'Chủ tài khoản :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerBank + '</span><br>' +
                'Account number :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerBankAcc + '</span></td>');
            rowElement.append('<td>' +
                'Người thân :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerRelative+'</span><br>' +
                'Số điện thoại :'+ ' '+'<span className="d-block text-muted font-weight-normal">'+e.customer.customerRelativePhone  +'</span></td>');
            rowElement.append('<td>' +
                'Mã số thuế :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerTax +'</span><br>' +
                'Bảo hiểm xã hội :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerSocialInsurance + '</span></br>' +
                'Bảo hiểm y tế :'+' '+'<span className="d-block text-muted font-weight-normal">'+ e.customer.customerHealthInsurance + '</span></td>');
            body.append(rowElement);
        }
    });
    function ajaxPost(data)  {
        let result = "";
        try {
            $.ajax({
                type: "POST",
                timeout: 100000,
                url: "doSearchManage",
                data: data,
                async: false,
                success: function (data, status, xhr) { //data nay chinh la cai cuc em return o controller
                    console.log(data);
                    result = data;
                    return result;
                },
                error: function (jqXhr, textStatus, errorMessage) {
                    console.log(textStatus);
                    console.log(errorMessage);
                }
            })
        } catch(error) {
            return "Không thể kết nối tới server";
        }
        return result;
    }

});
