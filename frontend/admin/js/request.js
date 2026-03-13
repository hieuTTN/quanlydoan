
var firstUrl = 'http://localhost:8080'
async function uploadSingleFile(filePath) {
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    var urlUpload = firstUrl+'/api/public/upload-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        var linkImage = await res.text();
        return linkImage;
    }
    else{
        return null;
    }
}

async function uploadSingleFileFormData(formData) {
    var urlUpload = firstUrl+'/api/public/upload-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        var linkImage = await res.text();
        return linkImage;
    }
    else{
        return null;
    }
}


async function uploadMultipleFile(listFile) {
    const formData = new FormData()
    for (var i = 0; i < listFile.length; i++) {
        formData.append("file", listFile[i])
    }
    var urlUpload = firstUrl+'/api/public/upload-multiple-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        return await res.json();
    } else {
        return [];
    }
}



var token = localStorage.getItem("token");

async function getMethod(url) {
    if(url.includes(firstUrl) == false){
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if(response.status < 300){
        return response
    }
    else{
        var textMess = 'Có lỗi xảy ra khi lấy dữ liệu, mã lỗi: ' + response.status
        if(response.status == exceptionCode){
            var result = await response.json();
            textMess = result.defaultMessage;
        }
        swal({
            title: "Thông báo",
            text: textMess,
            type: "error"
        },
        function() {
        });
        return null;
    }
}

async function postMethod(url) {
    if(url.includes(firstUrl) == false){
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if(response.status < 300){
        return response
    }
    else{
        var textMess = 'Có lỗi xảy ra khi gửi request, mã lỗi: ' + response.status
        if(response.status == exceptionCode){
            var result = await response.json();
            textMess = result.defaultMessage;
        }
        swal({
            title: "Thông báo",
            text: textMess,
            type: "error"
        },
        function() {
        });
        return null;
    }
}

async function postMethodTextPlan(url, payload) {
    if(url.includes(firstUrl) == false){
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'text/plain'
        }),
        body: payload
    });
    if(response.status < 300){
        return response
    }
    else{
        var textMess = 'Có lỗi xảy ra khi gửi request, mã lỗi: ' + response.status
        if(response.status == exceptionCode){
            var result = await response.json();
            textMess = result.defaultMessage;
        }
        swal({
            title: "Thông báo",
            text: textMess,
            type: "error"
        },
        function() {
        });
        return null;
    }
}

async function postMethodPayload(url, payload) {
    if(url.includes(firstUrl) == false){
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(payload)
    });
    if(response.status < 300){
        return response
    }
    else{
        var textMess = 'Có lỗi xảy ra khi gửi request, mã lỗi: ' + response.status
        if(response.status == exceptionCode){
            var result = await response.json();
            textMess = result.defaultMessage;
        }
        swal({
            title: "Thông báo",
            text: textMess,
            type: "error"
        },
        function() {
        });
        return null;
    }
}

async function deleteMethod(url) {
    if(url.includes(firstUrl) == false){
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if(response.status < 300){
        return response
    }
    else{
        var textMess = 'Có lỗi xảy ra khi gửi request, mã lỗi: ' + response.status
        if(response.status == exceptionCode){
            var result = await response.json();
            textMess = result.defaultMessage;
        }
        swal({
            title: "Thông báo",
            text: textMess,
            type: "error"
        },
        function() {
        });
        return null;
    }
}


