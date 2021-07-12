if (!String.format) {
    String.format = function (format) {
        var args = Array.prototype.slice.call(arguments, 1);
        return format.replace(/{(\d+)}/g, function (match, number) {
            return typeof args[number] != "undefined" ? args[number] : match;
        });
    };
}
function changeURL(url) {
    document.getElementById("iframeContent").setAttribute("src", "/Template/Purchasing/" + url)
    //console.log(document.getElementById("iframeContent").getAttribute("src"));
    initDataTable();
}

//file upload
var seq = 1;
$("#fileupload").click(function () {
    var inpID = "inputfile" + seq;
    var inpFullID = "#" + inpID;
    var optId = "file" + seq;
    //Append 1 new input element
    $("#inputhidden").append(
        "<input type='file' name='' class='inpImport' id='" + inpID + "'/>"
    );

    //call event click of button
    $(inpFullID).click();

    //call event Change(affter select file) of input
    $(inpFullID).change(function () {
        let image = event.target.files[0];
        let filename = event.target.files[0].name;
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

function fileInfo(supllierId) {
    var listFileSelected = $("#inputhidden").children().toArray();

    if (listFileSelected.length == 0) {
        swal("Failed!", "No file has been selected yet!", "error");
    } else {
        addFileInfo(listFileSelected, supllierId);;
        resetFileInfoModal();
    }
}
async function addFileInfo(listFileSelected, supllierId) {
    var elems = listFileSelected;
    var result = [];
    var fileData = new FormData();

    for (var i = 1; i <= elems.length; i++) {

        var fileInput = document.getElementById('inputfile' + i);

        for (var j = 0; j < fileInput.files.length; j++) {
            var sfilename = fileInput.files[j].name;
            fileData.append(sfilename, fileInput.files[j])
        }
        fileData.append("supllierId", supllierId);
        try {
            $.ajax({
                type: "POST",
                url: "../../Purchasing/AddNewFile",
                data: fileData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (result) {
                    $("#registerModal").modal("hide");
                },
                failure: function (r, e, s) { swal(e); }
            });
            //swal("Success!", "Create content successfully!", "success");
            //$("#addNew").modal("hide");
            //result.push(response.data);
        } catch (error) {
            swal("Failed!", "add file failed, check your input and try again!", "error");
        }

    }
    return result;
}

function resetFileInfoModal() {
    $("#inputhidden").children().remove();
    $(".listFileImport .list").children().remove();
    $(".listFileImport").css("display", "none");
}
function fileToByteArray(file) {
    return new Promise((resolve, reject) => {
        try {
            var reader = new FileReader();
            var fileByteArray = [];
            reader.readAsArrayBuffer(file);
            reader.onloadend = (evt) => {
                if (evt.target.readyState == FileReader.DONE) {
                    var arrayBuffer = evt.target.result;
                    var array = new Uint8Array(arrayBuffer);
                    for (byte of array) {
                        fileByteArray.push(byte);
                    }
                }
                resolve(fileByteArray);
            }
        }
        catch (error) {
            reject(error);
        }
    })
}
$(function () {
    $("#add-new-supplier").submit(function () {
        event.preventDefault();
        //var url = $(this).attr("action");
        //var method = $(this).attr("method");
        var formSupplier = new FormData(this);
        $("#btnAddNewFile").prop("disabled", true);
        $.ajax({
            type: "post",
            url: "../../Purchasing/AddSupplier",
            data: formSupplier,
            processData: false,
            contentType: false,
            cache: false,
            success: function (result) {
                fileInfo(result.response.Id);
            },
            failure: function (r, e, s) { swal(e); }
        });
        $("#btn-cus-register").prop("disabled", false);
    });
});

function initDataTable() {
    $("#tbMainDefault").DataTable({
        columnDefs: [{ orderable: false, targets: 0 }],
        order: [[1, "asc"]],
        bFilter: true,
        searching: true,
        info: false,
        ajax: {
            url: '/purchasing/GetSupplierQuestion',
            dataSrc: 'results',
            async: true,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Authorization", "Bearer " + localStorage.token);
            }
        },

        columns: [
            { data: "Seq" },
            { data: "NameCompany" },
            { data: "Writer" },
            { data: "CreatedDate" },
            { data: "Status"}
        ]
    });

};

//$(document).ready(function () {
//    initDataTable();
//})