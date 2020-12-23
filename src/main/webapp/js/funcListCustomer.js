$("body").on("click", ".btn-outline", function () {
    var customerName = $("#customerName").val();
    var customerPhone = $("#customerPhone").val();
    var customerId = $("#customerId").val();
    var data = {customerName:customerName,customerPhone:customerPhone,customerId:customerId};
    var dataobject = ajaxPost(data);
    //todo parse dataobject => json object
    try {
        var obj = JSON.parse(dataobject);
    } catch (error) {
        var obj = dataobject;
    }
    //foreach(item: jsonobject){
    var body = $("#tbodytable");
    body.empty();
    for (var i = 0; i < obj.length; i++){
        var e = obj[i];
        var rowElement = $('<tr></tr>');
        rowElement.append('<td>' + e.customer.companyCode + '</td>');
        rowElement.append('<td>' + '<h6 class="mb-0">' +'Mã số khách hàng :'+' '+ e.customer.customerCode+'</br>' +
            'Tên khách hàng :'+' '+ e.customer.customerName+'</br>' +
            'Số điện thoại :'+' '+ e.customer.customerPhone + '</br>' +
            'Lương :'+' '+ e.customer.customerSalary + '</h6>'+'</td>');
        rowElement.append('<td>' + '<h6>' +'Thường trú :'+' '+ e.customer.customerAddress +'</br>'+
            'Tạm trú :'+' '+ e.customer.customerAddressTemp  +'</h6>'+'</td>');
        rowElement.append('<td>' + e.customer.customerPosition + '</td>');
        rowElement.append('<td>' + '<h6>' +
            'CMND :'+ ' '+e.customer.customerId+'' +'</br>'+
            'Nơi cấp :'+ ' '+e.customer.customerIdLocation +'</br>'+
            'Ngày cấp :'+' '+e.customer.customerIdDate.date.day +'-' + e.customer.customerIdDate.date.month +'-' + e.customer.customerIdDate.date.year  + '</h6>' + '</td>');
        rowElement.append('<td>' + '<h6 class="mb-0">' +
            'Tên ngân hàng :'+' '+ e.customer.customerBankName+'</br>' +
            'Chủ tài khoản :'+' '+ e.customer.customerBank + '</br>' +
            'Account number :'+' '+ e.customer.customerBankAcc + '</h6>'+'</td>');
        rowElement.append('<td>' +  '<h6 class="mb-0">' +
            'Người thân :'+' '+ e.customer.customerRelative+'</br>' +
            'Số điện thoại :'+ ' '+e.customer.customerRelativePhone  + '</h6>'+'</td>');
        rowElement.append('<td>' + '<h6 class="mb-0">' +
            'Mã số thuế :'+' '+ e.customer.customerTax +'</br>' +
            'Bảo hiểm xã hội :'+' '+ e.customer.customerSocialInsurance + '</br>' +
            'Bảo hiểm y tế :'+' '+ e.customer.customerHealthInsurance + '</h6>'+'</td>');
        body.append(rowElement);
    }
    //
});
function ajaxPost(data)  {
    let result = "";
    try {
        $.ajax({
            type: "POST",
            timeout: 100000,
            data: data,
            async: false,
            url: "doSearch",
            success: function (data, status, xhr) {
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