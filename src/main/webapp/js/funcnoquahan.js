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

//function view thông tin công ty khi nhấn vào mã công ty trong bảng
function viewInfoCompany(params) {
    result.forEach((company) => {
        if (company.companies.companyCode == params) {
            let c = company.companies;
            console.log(c);
            $("#companyShow").empty();
            $("#companyShow").append('<h3><p>Mã công ty :' + ' ' + c.companyCode + '</p></h3>');
            $("#companyShow").append('<p>Tên công ty :' + ' ' + c.companyName + '</p>');
            $("#companyShow").append('<p>Địa chỉ công ty :' + ' ' + c.companyAddress + '</p>');
            $("#companyShow").append('<p>Mã số thuế :' + ' ' + c.conpanyTax + '</p>');
            $("#companyShow").append('<p>Ngày hoạt động :' + ' ' + ("0" + (c.createdDate.date.day)).slice(-2) + '/' + ("0" + (c.createdDate.date.month)).slice(-2) + '/' + c.createdDate.date.year + ' ' + ' ' + ("0" + (c.createdDate.time.hour)).slice(-2) + ':' + ("0" + (c.createdDate.time.minute)).slice(-2) + ':' + ("0" + (c.createdDate.time.second)).slice(-2) + '</p>');
            $('#modal-center').modal('show');
        }
    })
    $('#modal-center').modal('show');
}

//function view thông tin chi tiết hợp đồng khi nhấn vào mã hợp đồng trong bảng
function viewInfoContract(params) {
    list.forEach((contract) => {
        if (contract.idContract == params) {
            let contrStatus = contract.status
            console.log(contrStatus)
            if (contrStatus == 'done') {
                console.log(contract)
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã hợp đồng :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại khách hàng :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>System Trace :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Ngày ký duyệt :' + ' ' + contract.createdDate.date.day + '/' + contract.createdDate.date.month + '/' + contract.createdDate.date.year + '  ' + contract.createdDate.time.hour + ':' + contract.createdDate.time.minute + ':' + contract.createdDate.time.second + '</p>');
                $("#contractView").append('<p>Hạn trả nợ :' + ' ' + contract.dateRepayment.date.day + '/' + contract.dateRepayment.date.month + '/' + contract.dateRepayment.date.year + '  ' + contract.dateRepayment.time.hour + ':' + contract.dateRepayment.time.minute + ':' + contract.dateRepayment.time.second + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Số lần ứng :' + ' ' + contract.timeBorrow + '</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Người gạch nợ :' + ' ' + contract.acceptedBy + '</p>');
                $("#contractView").append('<p>Ngày gạch nợ :' + ' ' + contract.updatedDate.date.day + '/' + contract.updatedDate.date.month + '/' + contract.updatedDate.date.year + ' ' + ' ' + contract.updatedDate.time.hour + ':' + contract.updatedDate.time.minute + ':' + contract.updatedDate.time.second + '</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + contract.status + '</b></p>');
                $('#modalContract').modal('show');
            } else if (contrStatus == 'act') {
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã hợp đồng :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại khách hàng :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>System Trace :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Ngày ký duyệt :' + ' ' + contract.createdDate.date.day + '/' + contract.createdDate.date.month + '/' + contract.createdDate.date.year + '  ' + contract.createdDate.time.hour + ':' + contract.createdDate.time.minute + ':' + contract.createdDate.time.second + '</p>');
                $("#contractView").append('<p>Hạn trả nợ :' + ' ' + contract.dateRepayment.date.day + '/' + contract.dateRepayment.date.month + '/' + contract.dateRepayment.date.year + '  ' + contract.dateRepayment.time.hour + ':' + contract.dateRepayment.time.minute + ':' + contract.dateRepayment.time.second + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Số lần ứng :' + ' ' + contract.timeBorrow + '</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + contract.status + '</b></p>');
                $('#modalContract').modal('show');
            }
        }
    })
}

//function view thông tin khách hàng theo số điện thoại
function viewInfoContract(params) {
    list.forEach((contract) => {
        if (contract.idContract == params) {
            let contrStatus = contract.status
            console.log(contrStatus)
            if (contrStatus == 'done') {
                console.log(contract)
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã hợp đồng :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại khách hàng :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>System Trace :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Ngày ký duyệt :' + ' ' + ("0" + (contract.createdDate.date.day)).slice(-2) + '/' + ("0" + (contract.createdDate.date.month)).slice(-2) + '/' + contract.createdDate.date.year + '  ' + ("0" + (contract.createdDate.time.hour)).slice(-2) + ':' + ("0" + (contract.createdDate.time.minute)).slice(-2) + ':' + ("0" + (contract.createdDate.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Hạn trả nợ :' + ' ' + ("0" + (contract.dateRepayment.date.day)).slice(-2) + '/' + ("0" + (contract.dateRepayment.date.month)).slice(-2) + '/' + contract.dateRepayment.date.year + '  ' + ("0" + (contract.dateRepayment.time.hour)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.minute)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Số lần ứng :' + ' ' + contract.timeBorrow + '</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Người gạch nợ :' + ' ' + contract.acceptedBy + '</p>');
                $("#contractView").append('<p>Ngày gạch nợ :' + ' ' + ("0" + (contract.updatedDate.date.day)).slice(-2) + '/' + ("0" + (contract.updatedDate.date.month)).slice(-2) + '/' + contract.updatedDate.date.year + '  ' + ("0" + (contract.updatedDate.time.hour)).slice(-2) + ':' + ("0" + (contract.updatedDate.time.minute)).slice(-2) + ':' + ("0" + (contract.updatedDate.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + contract.status + '</b></p>');
                $('#modalContract').modal('show');
            } else if (contrStatus == 'act') {
                $("#contractView").empty();
                $("#contractView").append('<h3><p>Mã hợp đồng :' + ' ' + contract.idContract + '</p></h3>');
                $("#contractView").append('<p>Số điện thoại khách hàng :' + ' ' + contract.customerPhone + '</p>');
                $("#contractView").append('<p>System Trace :' + ' ' + contract.systemTrace + '</p>');
                $("#contractView").append('<p>Ngày ký duyệt :' + ' ' + ("0" + (contract.createdDate.date.day)).slice(-2) + '/' + ("0" + (contract.createdDate.date.month)).slice(-2) + '/' + contract.createdDate.date.year + '  ' + ("0" + (contract.createdDate.time.hour)).slice(-2) + ':' + ("0" + (contract.createdDate.time.minute)).slice(-2) + ':' + ("0" + (contract.createdDate.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Hạn trả nợ :' + ' ' + ("0" + (contract.dateRepayment.date.day)).slice(-2) + '/' + ("0" + (contract.dateRepayment.date.month)).slice(-2) + '/' + contract.dateRepayment.date.year + '  ' + ("0" + (contract.dateRepayment.time.hour)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.minute)).slice(-2) + ':' + ("0" + (contract.dateRepayment.time.second)).slice(-2) + '</p>');
                $("#contractView").append('<p>Số tiền ứng :' + ' ' + contract.remainAmountBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Phí :' + ' ' + contract.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
                $("#contractView").append('<p>Số lần ứng :' + ' ' + contract.timeBorrow + '</p>');
                $("#contractView").append('<p>Mã giao dịch :' + ' ' + contract.transactionId + '</p>');
                $("#contractView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + contract.status + '</b></p>');
                $('#modalContract').modal('show');
            }
        }
    })
}

// function sử dụng framework datatable của Jquery
$('#example').DataTable({
    dom: 'Bfrtip',
    pageLength: 10,// phân 10 kết quả cho mỗi trang
    columnDefs: [
        {
            visible: false,
            targets: [2, 3, 4, 5, 6, 8, 9, 11] // ẩn đi các column đã chọn
        },
    ],
    buttons: [
        {
            title: 'Danh sách đã xử lý',
            extend: 'excelHtml5',
            exportOptions: {
                format: {
                    customizeData: function (header, footer, body) {
                        return body;
                    }
                },
                columns: [0, 2, 3, 4, 5, 6, 8, 9, 11, 12, 14] // chỉ export excel các cột đã chọn

            }
        },
    ]
});