
    $("body").on("click", ".btn-outline", function () {
        $("#loading").show();
        var customerName = $("#customerName").val();
        var customerPhone = $("#customerPhone").val();
        var customerId = $("#customerId").val();
        var data = {customerName:customerName,customerPhone:customerPhone,customerId:customerId};
        var dataobject = ajaxPost(data);
        //todo parse dataobject => json object
        try {
            var obj = JSON.parse(dataobject);
            console.log(obj)
        } catch (error) {
            var obj = dataobject;
        }
        //foreach(item: jsonobject){
        var body = $("#tbodytable");
        body.empty();
        Object.keys(obj).forEach((key)=>{
            var e = obj[key];
            var rowElement = $('<tr></tr>');
            rowElement.append('<td><h5>' + e.company.companyCode + '</h5></td>');
            rowElement.append('<td ><b>' + e.customer.customerName+'</b><br>' +
                'Ngày sinh :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBirthday.day +'/'+e.customer.customerBirthday.month +'/'+e.customer.customerBirthday.year+  '</span><br>'+
                'Số điện thoại :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerPhone +  '</span></td>');
            rowElement.append('<td>' +'Thường trú :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerAddress +'</span><br>'+
                'Tạm trú :'+' '+ '<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerAddressTemp  +'</span></td>');
            rowElement.append('<td>' +'Vị trí :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerPosition + '</span><br>'+
                'Mức lương :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerSalary.toLocaleString("vi-VN") +' '+ 'đ</span></td>');
            rowElement.append('<td>' +
                'Số CMND :'+ ' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerId + '</span><br>'+
                'Nơi cấp :'+ ' '+'<span style=" font-weight: 300 bold;color: grey">'+e.customer.customerIdLocation +
                '</span></td>');
            rowElement.append('<td xmlns="http://www.w3.org/1999/html">' +
                'Tên ngân hàng :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBankName+'</span><br>' +
                'Chủ tài khoản :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBank + '</span><br>' +
                'Số tài khoản :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerBankAcc + '</span></td>');
            rowElement.append('<td>' +
                'Loại HĐLĐ :'+' '+'<span style=" font-weight: 300 bold;color: grey">'+ e.customer.customerContract +'</span><br>' +
                'Trạng thái HĐLĐ :'+' '+'<b style=" font-weight: 300 bold;color: forestgreen">'+ e.customer.status + '</b></td>');
            body.append(rowElement);
            $("#loading").hide();
        })
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

