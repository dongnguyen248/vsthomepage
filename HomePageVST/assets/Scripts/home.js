$('.carousel[data-type="multi"] .item').each(function () {
    var next = $(this).next();
    if (!next.length) {
        next = $(this).siblings(':first');
    }
    next.children(':first-child').clone().appendTo($(this));

    for (var i = 0; i < 2; i++) {
        next = next.next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));
    }
});

var videos = document.querySelectorAll('video');
for (var i = 0; i < videos.length; i++) {
    videos[i].addEventListener('play', function () { pauseAll(this) }, true);
}

function pauseAll(elem) {
    for (var i = 0; i < videos.length; i++) {
        if (videos[i] == elem) continue;
        if (videos[i].played.length > 0 && !videos[i].paused) {
            videos[i].style.border = 'none';
            videos[i].style.borderRadius = 0;
            videos[i].pause();
        }
    }
}

$(document).ready(function () {
    $('video').bind('contextmenu', function () { return false; });
    $('video').attr('controlsList', 'nodownload');
});

//file upload
var seq = 1;
$("#fileupload").click(function () {
    var inpID = "inputfile" + seq;
    var inpFullID = "#" + inpID;
    var optId = "file" + seq;
    //Append 1 new input element
    $("#inputhidden").append(
        "<input type='file' name='' class='inpImport' id='" + inpID + "' />"
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