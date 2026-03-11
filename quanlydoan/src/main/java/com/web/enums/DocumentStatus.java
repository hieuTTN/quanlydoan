package com.web.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DocumentStatus {

    DANG_HIEN_THI("Đang hiển thị", "#007BFF"),
    DANG_CHO("Đang chờ duyệt", "#FF9F43"),
    TU_CHOI("Từ chối duyệt", "#FF4757"),
    DANG_DONG("Đang đóng", "#2F3542");

    private final String displayName;

    private final String color;
}
