$("body").on("click", ".btn-success", function () {
    $("#loading").show();
    var dataRequest = $("#idContract").text();
    let data = {datarequest: dataRequest, status: 'done'};
    var result = submitWithdraw(data);
    if (result === "success") {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Dữ liệu được cập nhật thành công.',
            showConfirmButton: false,
            timer: 3000
        });
        $("#loading").hide();
        $("#tr-" + selectedContractId).remove();
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

function submitWithdraw(data) {
    try {
        // This async call may fail.
        let text = $.ajax({
            type: "POST",
            timeout: 100000,
            url: "gachno",
            data: data,
            dataType: 'text',
            async: false
        }).responseText;
        return text;
    } catch (error) {
        return "Không thể kết nối tới server";
    }
}

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}

function viewInfoCompany(params) {
    list.forEach((company) => {
        if (company.companies.companyCode == params) {
            let c = company.companies;
            Object.keys(c).forEach((key, _) => {
                let id = key;
                $('#' + id).text(c[key]);
            })
        }
    })
    console.log(list);
    // var index =
    $('#modal-center').modal('show');
}

function viewInfo(idContract, custPhone) {
    selectedContractId = idContract;
    console.log(selectedContractId)
    let result = list.find(el => el.customer.customerPhone == custPhone);
    console.log(result)
    const cust = result.customer;

    Object.keys(cust).forEach((key) => {
        $('#' + key).text(cust[key]);
    });
    result = list.find(el => el.contract.idContract == idContract);
    const contract = result.contract;
    Object.keys(contract).forEach((key) => {
        if (key == "remainAmountBorrow") {
            let value = (2 / 100 * contract[key]) + contract[key];
            $('#' + key).text(value.toLocaleString("vi-VN") + " đ");

        } else if (key == "borrow") {
            let value1 = contract[key];
            $('#' + key).text(value1.toLocaleString("vi-VN") + " đ");
        } else {
            $('#' + key).text(contract[key]);
        }
    });
    $('#main').slideDown("slow");
}

