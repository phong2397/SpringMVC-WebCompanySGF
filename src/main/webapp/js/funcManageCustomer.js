$("body").on("click", ".btn-outline", function () {
         $("#loading").show();
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
        rowElement.append('<td><h5>' + e.customer.companyCode + '</h5></td>');
        rowElement.append('<td ><b>' + e.customer.customerName+'</b><br>' +
            'Mã số nhân viên :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerCode+  '</span><br>'+
            'Số điện thoại :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerPhone +  '</span><br>' +
            'Ngày sinh :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBirthday.day +'-' + e.customer.customerBirthday.month + '-' + e.customer.customerBirthday.year +  '</span></td>');
        rowElement.append('<td>' +'Thường trú :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerAddress +'</span><br>'+
            'Tạm trú :'+' '+ '<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerAddressTemp  +'</span></td>');
        rowElement.append('<td>' +'Vị trí :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerPosition + '</span><br>'+
            'Mức lương :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerSalary.toLocaleString("vi-VN") +' '+ 'đ</span></td>');
        rowElement.append('<td>' +
            'Số CMND :'+ ' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerId + '</span><br>'+
            'Nơi cấp :'+ ' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerIdLocation +'</span><br>'+
            'Ngày cấp :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerIdDate.date.day +'-' + e.customer.customerIdDate.date.month +'-' + e.customer.customerIdDate.date.year  + '</span></td>');
        rowElement.append('<td xmlns="http://www.w3.org/1999/html">' +
            'Tên ngân hàng :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBankName+'</span><br>' +
            'Chủ tài khoản :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBank + '</span><br>' +
            'Số tài khoản :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBankAcc + '</span></td>');
        rowElement.append('<td>' +
            'Người thân :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerRelative+'</span><br>' +
            'Số điện thoại :'+ ' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerRelativePhone  +'</span></td>');
        rowElement.append('<td>' +
            'Mã số thuế :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerTax +'</span><br>' +
            'Mã số bảo hiểm xã hội :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerSocialInsurance + '</span></br>' +
            'Mã số bảo hiểm y tế :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerHealthInsurance + '</span></td>');
        body.append(rowElement);
        $("#loading").hide();
    }
    $("#loading").hide();
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