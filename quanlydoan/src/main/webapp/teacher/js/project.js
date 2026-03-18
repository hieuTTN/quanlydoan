async function addWork(){
    var payload = {
        "idwork":document.getElementById("idwork").value,
        "deadline":document.getElementById("work-deadline").value,
        "title":document.getElementById("work-title").value,
        "description":tinyMCE.get('contentTienDo').getContent(),
        "semesterTeacherId":document.getElementById("semesterTeacherId").value,
    }
    var response = await postMethodPayload('/api/work-process/teacher/create-update', payload);
    if(response.status < 300){
        swal({
            title: "Thông báo",
            text: "Thêm tiến độ công việc thành công",
            type: "success"
        },
        function() {
            window.location.reload();
        });
    }
}