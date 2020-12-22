<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.sgfintech.handler.MergeDataOrder" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: phong
  Date: 12/22/20
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loading").css("display", "none");
    });
    $("body").on("click", ".btn-accept", function () {
        var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
        dataRequest = dataRequest.substring(0, dataRequest.length - 4);
        let data = {datarequest: dataRequest, status: 'act', step: '2'};
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
                url: "${pageContext.request.contextPath}/kyduyet",
                data: data,
                dataType: 'text',
                async: false
            }).responseText;
            return text;
        } catch (error) {
            return "Không thể kết nối tới server";
        }
    }

    $("body").on("click", ".btn-refuse", function () {
        var dataRequest = $(this).parents("tr").find("td:eq(0)").text().replaceAll("#", "");
        dataRequest = dataRequest.substring(0, dataRequest.length - 4);
        let data = {datarequest: dataRequest, status: 'act', step: '2'};
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
    <%
              List<MergeDataOrder> list = (List<MergeDataOrder>) request.getAttribute("views");
              Gson g = new Gson();
              String json = g.toJson(list);
              %>
    function viewInfoCompany(params) {
        var result = <%=json%>;
        result.forEach((company) => {
            if (company.company.companyCode == params) {
                let c = company.company;
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
    function viewInfoOrder(params) {

        var result = <%=json%>;
        result.forEach((saRequest) => {
            if (saRequest.saRequest.id == params) {
                let c = saRequest.saRequest;
                Object.keys(c).forEach((key, _) => {
                    let id = key;
                    $('#' + id).text(c[key]);
                })
            }
        })
        console.log(result);
        // var index =
        $('#modal-left').modal('show');
    }
    function viewInfoCustomer(params) {
        var result = <%=json%>;
        result.forEach((customer) => {
            if (customer.customer.customerPhone == params) {
                let c = customer.customer;
                Object.keys(c).forEach((key, _) => {
                    let id = key;
                    $('#' + id).text(c[key]);
                })
            }
        })
        console.log(result);
        // var index =
        $('#modal-right').modal('show');
    }
</script>
