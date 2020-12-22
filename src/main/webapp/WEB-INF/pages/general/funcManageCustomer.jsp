<%@ page import="com.sgfintech.entity.Companies" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: phong
  Date: 12/22/20
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $( document ).ready(function() {
        $("#loading").css("display", "none");
    });
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
            rowElement.append('<td><h5>' + e.company.companyName + '</h5></td>');
            rowElement.append('<td>' + e.customer.customerCode + '</td>');
            rowElement.append('<td>' + e.customer.customerName + '</td>');
            rowElement.append('<td>' + e.customer.customerPhone + '</td>');
            rowElement.append('<td>' + e.customer.customerSalary + '</td>');
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
            body.append(rowElement);
        }
    });
    function ajaxPost(data)  {
        let result = "";
        try {
            $.ajax({
                type: "POST",
                timeout: 100000,
                url: "${pageContext.request.contextPath}/doSearchManage",
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
    function viewInfoCompany(params) {
        <%
            List<Companies> list = (List<Companies>) request.getAttribute("com");
            Gson g = new Gson();
            String json = g.toJson(list);
        %>
        var result = <%=json%>;
        result.forEach((company) => {
            if (company.companyCode == params) {
                let c = company;
                Object.keys(c).forEach((key, _) => {
                    let id = key;
                    $('#' + id).text(c[key]);
                })
            }
        })
    }
</script>