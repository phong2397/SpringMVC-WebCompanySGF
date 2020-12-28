
    $("body").on("click", ".btn-success", function () {
        var dataRequest = $("#idContract").text().trim();
        let data = { datarequest: dataRequest, status: 'done' };
        var result = submitWithdraw(data);
        if (result === "success") {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Dữ liệu được cập nhật thành công.',
                showConfirmButton: false,
                timer: 3000
            });
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

