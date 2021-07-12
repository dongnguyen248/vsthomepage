
$(document).ready(function () {
    $('#supplierInfo').DataTable({
        columnDefs: [
            { orderable: false, targets: 0 },

        ],
        bFilter: true,
        searching: true,
        info: false,
        ajax: {
            url: "../../Purchasing/GetSupplier",
            dataSrc: "result",

        },
        columns: [
            { data: "Seq" },
            {
                data: "NameCompany", render: function (data, type, row) {
                    return String.format("<a href=javascript:checkUser('{0}')>{1}</a>", row["IdUser"], data)
                }
            },
            {
                data: "Writer",
            },
            {
                data: "CreateDate",
                type: "date",
                render: function (data) {
                    return data ? moment(data).format("DD/MM/yyyy") : "";
                }
            },
            {
                data: "Status",
                render: function (data) {
                    if (data == false) {
                        return String.format("Progress")
                    } else {
                        return String.format("Completed")
                    }
                }
            },
        ],
    });
    $("#supplierReports").dataTable({
        columnDefs: [
            { orderable: false, targets: 0 },
        ],
        bFilter: true,
        searching: true,
        info: false,
        ajax: {
            url: "../../Purchasing/getReportSupplier",
            dataSrc: "reports",

        }, columns: [
            { data: "Seq" },
            {
                data: "Name"

            },

            {
                data: "TitleReport",
                render: function (data, type, row) {
                    return String.format("<a href='detail-report-{0}.html'>{1}</a>", row["Id"], data)
                    //<a href = "detail-report.html">

                },
            }

        ],
    })
});

if (!String.format) {
    String.format = function (format) {
        var args = Array.prototype.slice.call(arguments, 1);
        return format.replace(/{(\d+)}/g, function (match, number) {
            return typeof args[number] != "undefined" ? args[number] : match;
        });
    };
}


var seq = 1;
$("#fileupload").click(function () {
    var inpID = "inputfile" + seq;
    var inpFullID = "#" + inpID;
    var optId = "file" + seq;
    $("#inputhidden").append(
        "<input type='file' name='' class='inpImport' id='" + inpID + "' />"
    );
    $(inpFullID).click();

    $(inpFullID).change(function () {
        let image = event.target.files[0];
        let filename = event.target.files[0].name;
        var re = /(\.jpg|\.jpeg|\.bmp|\.gif|\.png|\.docx|\.doc|\.xls|\.xlsx|\.ppt|\.pptx|\.pdf)$/i;
        if (!re.exec(filename)) {
            swal("File extension not supported!");
            return;
        }
        let checkExists = 0;
        var elements = document.getElementsByClassName("inpImport");

        if (elements.length > 1) {
            for (var i = 0; i < elements.length; i++) {
                if (filename === getFilename(elements[i].value)) {
                    checkExists++;
                    if (checkExists > 1) {
                        alert("File already upload!");
                        $("#" + inpID).remove();
                        break;
                    }
                }
            }
        }
        if (checkExists <= 1) {
            changebackgroundFilextension(filename, optId, inpID);
        }
    });

    seq++;
});
function changebackgroundFilextension(filename, optId, inpID) {
    var backgroundIcon = "";
    $(".listFileImport").css("display", "block");
    $(".listFileImport .list").append(String.format("<li id={0}>{1} <a onclick=\"removefile('{0}','{2}')\" class='btnfloatR'><img src='/media/images/ico_go_rcb.png'/></a></li>", optId, filename, inpID));
    var extension = getFileExtension(filename);

    if (extension === "doc" || extension === "docx") {
        backgroundIcon = "/media/images/ico_doc_on.png";
    } else if (extension === "xls" || extension === "xlsx") {
        backgroundIcon = "/media/images/ico_xlsx_on.png";
    } else if (extension === "ppt" || extension === "pptx") {
        backgroundIcon = "/media/images/ico_ppt_on.png";
    } else if (extension === "jpg" || extension === "gif" || extension === "jpg" || extension === "jpeg") {
        backgroundIcon = "/media/images/ico_img_on.png";
    } else {
        backgroundIcon = "/media/images/ico_pdf_on.png";
    }
    $("#" + optId).css("background-image", "url(" + backgroundIcon + ")");
}
function removefile(optionID, inpID) {
    $("#" + optionID).remove();
    $("#" + inpID).remove();
    checkElementInUl();
}

function checkElementInUl() {
    if ($(".list").children().length === 0) {
        $(".listFileImport").css("display", "none");
    }
}
function getFileExtension(filename) {
    return filename.split(".").pop();
}

function getFilename(fullPath) {
    if (fullPath) {
        var startIndex =
            fullPath.indexOf("\\") >= 0
                ? fullPath.lastIndexOf("\\")
                : fullPath.lastIndexOf("/");
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf("\\") === 0 || filename.indexOf("/") === 0) {
            filename = filename.substring(1);
        }
        return filename;
    }
}

//await fileToByteArray($(value).prop("files")[0]),
$(function () {
    $("#add-new-supplier").submit(function (event) {
        event.preventDefault();
        var username = $("#userview-company").val();
        var isValidUsername = validateStr(username);
        var password = $("#passwordview-company").val();
        var supplier = new FormData();
        supplier.append("NameCompany", $("#name-company").val());
        supplier.append("DayoIncor", $('#date-company').val());
        supplier.append("Representative", $("#who-company").val());
        supplier.append("MainProduct", $("#product-company").val());
        supplier.append("MainCustomer", $("#customer-company").val());
        supplier.append("Contact", $("#person-company").val());
        supplier.append("SupplierUser.Name", username);
        supplier.append("SupplierUser.password", password);
        supplier.append("Conversations[0].Content", $("#message-text").val());
        var files = $("#inputhidden").children().toArray();

        if (files.length === 0 || !isValidUsername || (password.length < 6)) {
            swal("Please checking : selected file attach?, User no have space and special key(*,#...) or Password need more 6 character  ");
            return;
        }

        for (var i = 0; i < files.length; i++) {
            supplier.append("SupplierCertificates[" + i + "].FileName", $(files[i]).val().split(/(\\|\/)/g).pop());
            supplier.append("SupplierCertificates[" + i + "].FileData", $(files[i]).prop("files")[0]);
        }

        axios.post("/Purchasing/AddSupplier", supplier).then(function (response) {
            console.log(response.data);
            var isExists = response.data.isExists;
            if (!isExists) {
                $("#registerModal").modal("hide");
                window.location.reload(false);
            } else {
                swal({ icon: "error", title: "Username already has, Please choose other Username" });

            }
        });
        if (response.status == 200) {


        } else {
        }
    });
});

$("#submitForm").click(function () {
    var username = $("#username").val();
    var password = $("#password").val();
    var supplier = {
        Name: username,
        password: password
    }
    axios.post("/Purchasing/CheckSupplier", supplier).then(function (data) {
        if (data.data.id != null) {
            $("#checkUser").modal("hide");
            localStorage.setItem("userId", data.data.id)
            localStorage.setItem("roleId", data.data.roleId)
            window.location.reload(false);
        } else {
            swal({ icon: "error", title: "User Or Password is not crorrect" })
        }
    })


});

function resetFileInfoModal() {
    $("#inputhidden").children().remove();
    $(".listFileImport .list").children().remove();
    $(".listFileImport").css("display", "none");
}

$("#Logout").click(function () {
    localStorage.clear();
    window.location.reload(false);

});


//check user login
function checkUser(id) {
    var userId = localStorage.getItem("userId");
    if (userId != null) {
        if (userId == id) {
            getDetailSupplier(id);
        } else {
            if (localStorage.getItem("roleId") == 1) {
                getDetailSupplier(id);
                changeStatus(id);
            } else {
                swal("Use don't have permitsion in this question!")
            }
        }
    } else {
        $("#checkUser").modal("show");
    }
}

function getDetailSupplier(ownerId) {
    var loggedInId = localStorage.getItem("userId");
    window.location.href = "/thong-tin-nha-cung-cap-" + ownerId + "-p-" + loggedInId + ".html";
}

$(document).ready(function () {
    $('#date-company').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'dd MM yy',
        onClose: function (dateText, inst) {
            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
        }
    })
    if (localStorage.getItem("userId") != null) {
        $(".dangky").hide();
        $("#Logout").show();
    }
});

$(function () {
    $('.selectpicker').selectpicker();
});

$("#select-lang").on("change", function (e) {
    if (e.target.value === "vn") {
        $(".purchasing-lang__vn").css("display", "block");
        $(".purchasing-lang__kor").css("display", "none");
    } else if (e.target.value === "kor") {
        $(".purchasing-lang__vn").css("display", "none");
        $(".purchasing-lang__kor").css("display", "block");
    }
    localStorage.setItem("lang", e.target.value);
});
$(document).ready(function () {
    if (!localStorage.getItem("lang")) {
        localStorage.setItem("lang", "vn");
    }
    var lang = localStorage.getItem("lang");
    console.log("aaaa");
    $("#select-lang").val(lang).change();
})

function validateStr(text) {
    var nameRegex = /^[a-zA-Z\-]+$/;
    var validfirstUsername = text.match(nameRegex);
    if (validfirstUsername) {
        return true;
    }
    return false;
}
function changeStatus(id) {
    axios.post("/Purchasing/ChangeStatus?id=" + id);
}
$("#reportSupplier").click(function () {
    $("#report").modal("show");

})
$("#formReport").submit(function () {
    var formReport = new FormData();
    formReport.append("Name", $("#formReport").find('input[name="name"]').val());
    formReport.append("SecretCode", $("#formReport").find('input[name="secretnumber"]').val());
    formReport.append("PhoneNumber", $("#formReport").find('input[name="phonenumber"]').val());
    formReport.append("Email", $("#formReport").find('input[name="Email"]').val());
    formReport.append("TitleReport", $("#formReport").find('input[name="title"]').val());
    formReport.append("ContentReport", $("#formReport").find('textarea[name="Content"]').val());
    axios.post("/Purchasing/AddReport", formReport)

})