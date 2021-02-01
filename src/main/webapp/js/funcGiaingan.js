// $("body").on("click", ".as", function () {
//     var phone = $(this).closest('tr').children('td:eq(6)').text().trim();
//     data = {phone: phone};
//     var result = findHistoryModal(data);
//     var obj = JSON.parse(result);
//     $("#tbody").empty();
//     Object.keys(obj).forEach((key) => {
//         let sa = obj[key]
//         let time = obj[key].saRequest.createdDate
//         var rowElement = $('<tr></tr>');
//         rowElement.append('<td><h5><a  href="#" onclick="viewInfoOrder(' + sa.saRequest.id + ')">' + sa.saRequest.id + '</a></h5></td>');
//         rowElement.append('<td><h5>' + ("0" + (time.date.day)).slice(-2) + '/' + ("0" + (time.date.month)).slice(-2) + '/' + ("0" + (time.date.year)).slice(-2) + ' ' + ("0" + (time.time.hour)).slice(-2) + ':' + ("0" + (time.time.minute)).slice(-2) + ':' + ("0" + (time.time.second)).slice(-2) + '</h5></td>');
//         rowElement.append('<td><h5>' + sa.saRequest.borrow.toLocaleString("vi-VN") + ' đ</h5></td>');
//         if (sa.saRequest.status == 'wait') {
//             rowElement.append('<td><h5 style="color: darkorange">chờ xét duyệt</h5></td>');
//
//         } else if (sa.saRequest.status == 'wfs') {
//             rowElement.append('<td><h5 style="color:  #0aa5df">chờ ký duyệt</h5></td>');
//
//         } else if (sa.saRequest.status == 'done') {
//             rowElement.append('<td><h5 style="color: hotpink"> đã giải ngân</h5></td>');
//
//         } else if (sa.saRequest.status == 'act') {
//             rowElement.append('<td><h5 style="color: green">chờ chuyển tiền</h5></td>');
//
//         } else if (sa.saRequest.status == 'deni') {
//             rowElement.append('<td><h5 style="color: red">từ chối</h5></td>');
//
//         }
//         $("#tbody").append(rowElement)
//     })
// });
//
//
// function viewInfoOrder(params) {
//     saList.forEach((order) => {
//         if (order.id == params) {
//             let sa = order.status
//             console.log(sa)
//             if (sa == 'done') {
//                 $("#listView").empty();
//                 $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
//                 $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
//                 $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
//                 $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
//                 $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: hotpink">' + 'Đã hoàn thành' + '</b></p>');
//                 $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
//                 $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
//                 $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + ("0" + (order.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeDuyetDate.date.month)).slice(-2) + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (order.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.second)).slice(-2) + '</p>');
//
//                 $('#modal-left').modal('show');
//             } else if (sa == 'act') {
//                 $("#listView").empty();
//                 $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
//                 $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
//                 $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
//                 $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
//                 $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: green">' + 'Đã giải ngân' + '</b></p>');
//                 $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
//                 $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Người duyệt đơn :' + ' ' + order.employeeDuyet + '</p>');
//                 $("#listView").append('<p>Ngày duyệt đơn :' + ' ' + ("0" + (order.employeeDuyetDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeDuyetDate.date.month)).slice(-2) + '/' + order.employeeDuyetDate.date.year + ' ' + ' ' + ("0" + (order.employeeDuyetDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeDuyetDate.time.second)).slice(-2) + '</p>');
//                 $('#modal-left').modal('show');
//             } else if (sa == 'wfs') {
//                 $("#listView").empty();
//                 $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
//                 $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
//                 $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
//                 $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
//                 $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: #0aa5df">' + 'chờ ký duyệt' + '</b></p>');
//                 $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
//                 $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
//                 $('#modal-left').modal('show');
//             } else if (sa == 'wait') {
//                 $("#listView").empty();
//                 $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
//                 $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
//                 $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
//                 $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
//                 $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: darkorange">' + 'chờ xét duyệt' + '</b></p>');
//                 $('#modal-left').modal('show');
//             } else if (sa == 'deni') {
//                 $("#listView").empty();
//                 $("#listView").append('<h3><p>Mã yêu cầu :' + ' ' + order.id + '</p></h3>');
//                 $("#listView").append('<p>Số điện thoại :' + ' ' + order.customerPhone + '</p>');
//                 $("#listView").append('<p>Mã công ty :' + ' ' + order.companyCode + '</p>');
//                 $("#listView").append('<p>Ngày yêu cầu :' + ' ' + ("0" + (order.createdDate.date.day)).slice(-2) + '/' + ("0" + (order.createdDate.date.month)).slice(-2) + '/' + order.createdDate.date.year + ' ' + ' ' + ("0" + (order.createdDate.time.hour)).slice(-2) + ':' + ("0" + (order.createdDate.time.minute)).slice(-2) + ':' + ("0" + (order.createdDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Số tiền ứng :' + ' ' + order.borrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Phí :' + ' ' + order.feeBorrow.toLocaleString("vi-VN") + ' đ</p>');
//                 $("#listView").append('<p>Số lần ứng :' + ' ' + order.timeBorrow + '</p>');
//                 $("#listView").append('<p>Trạng thái :' + ' ' + '<b style="color: red">' + 'từ chối' + '</b></p>');
//                 $("#listView").append('<p>Người thẩm định :' + ' ' + order.employeeThamdinh + '</p>');
//                 $("#listView").append('<p>Ngày thẩm định :' + ' ' + ("0" + (order.employeeThamdinhDate.date.day)).slice(-2) + '/' + ("0" + (order.employeeThamdinhDate.date.month)).slice(-2) + '/' + order.employeeThamdinhDate.date.year + ' ' + ' ' + ("0" + (order.employeeThamdinhDate.time.hour)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.minute)).slice(-2) + ':' + ("0" + (order.employeeThamdinhDate.time.second)).slice(-2) + '</p>');
//                 $("#listView").append('<p>Nhận xét :' + ' ' + order.description + '</p>');
//                 $('#modal-left').modal('show');
//             }
//         }
//     })
// }

function viewInfoCustomer(id) {
    list = result.find(el => el.id == id);
    $("#id_donhang").empty();
    $("#id_donhang").val(id);
    console.log(id)
    $('#modal-giaingan').modal('show');
}


$("#rootcheckbox").click(function () {
    $('input:checkbox').not(this).prop('checked', this.checked);
});