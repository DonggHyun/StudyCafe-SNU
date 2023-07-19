<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>스터디 카페 관리자 페이지</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        $(document).ready(function() {
            $("#titleColor").on("click", function() {
                $("#titleColor").val(selectColor());
            });

            $("#descriptionColor").on("click", function() {
                $("#descriptionColor").val(selectColor());
            });

            $("#backgroundColor").on("click", function() {
                $("#backgroundColor").val(selectColor());
            });
        });

        function selectColor() {
            return prompt("색상을 선택하거나 '#ff0000'과 같이 직접 입력하세요.");
        }
    </script>
</head>
<body class="bg-light">
<c:import url="../headerFooterForm/headerFooterForm_adminHeader.jsp" />

<!-- 메인 컨텐츠 -->
<div class="container">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body text-center">
                    <h2 class="card-title">챌린지 추가</h2>
                    <hr>
                    <form action="${pageContext.request.contextPath}/admin/challenge/edit" method="POST">
                        <input type="text" value="${id}" name="id" hidden/>
                        <div class="form-group">
                            <label for="title">챌린지명 :</label>
                            <input type="text" class="form-control" id="title" name="title" value="${challenge.title}" required>
                        </div>
                        <div class="form-group">
                            <label for="description">챌린지 설명 :</label>
                            <textarea class="form-control" id="description" name="description" required>${challenge.description}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="titleColor">제목 색상 :</label>
                            <input class="form-control" id="titleColor" name="titleColor" value="${challenge.titleColor}" required>
                        </div>
                        <div class="form-group">
                            <label for="descriptionColor">설명 색상 :</label>
                            <input class="form-control" id="descriptionColor" name="descriptionColor" value=" ${challenge.descriptionColor}" required>
                        </div>
                        <div class="form-group">
                            <label for="backgroundColor">배경 색상 :</label>
                            <input class="form-control" id="backgroundColor" name="backgroundColor" value="${challenge.backgroundColor}" required>
                        </div>
                        <div class="form-group">
                            <label for="imageSrc">이미지 주소 :</label>
                            <input class="form-control" id="imageSrc" name="imageSrc" value="${challenge.imageSrc}" required>
                        </div>
                        <div class="form-group">
                            <label for="activeStartTime">활성 시작시간 :</label>
                            <input class="form-control" id="activeStartTime" name="StartTime" value="${challenge.activeStartTime}" required>
                        </div>
                        <div class="form-group">
                            <label for="activeEndTime">활성 종료시간 :</label>
                            <input class="form-control" id="activeEndTime" name="EndTime" value="${challenge.activeEndTime}" required>
                        </div>
                        <div class="form-group">
                            <label for="periodDays">챌린지 적용기간(날) :</label>
                            <input class="form-control" id="periodDays" name="periodDays" value="${challenge.periodDays}" required>
                        </div>
                        <div class="form-group">
                            <label for="periodHours">챌린지 적용기간(시간) :</label>
                            <input class="form-control" id="periodHours" name="periodHours" value="${challenge.periodHours}" required>
                        </div>
                        <div class="form-group">
                            <label for="goalDay">챌린지 적용기간(날) :</label>
                            <input class="form-control" id="goalDay" name="goalDay" value="${challenge.goalDay}" required>
                        </div>
                        <div class="form-group">
                            <label for="goalHour">챌린지 적용기간(시간) :</label>
                            <input class="form-control" id="goalHour" name="goalHour" value="${challenge.goalHour}" required>
                        </div>
                        <div class="form-group">
                            <label for="rewardPoint">챌린지 리워드(포인트) :</label>
                            <input class="form-control" id="rewardPoint" name="rewardPoint" value="${challenge.rewardPoint}" required>
                        </div>
                        <div class="form-group form-check">
                            <input class="form-check-input" type="checkbox" id="active" value="${challenge.active}" name="active">
                            <label class="form-check-label" for="active">현재의 챌린지로 등록</label>
                        </div>
                        <input type="hidden" value="on" name="_active"/>
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary mt-3">수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 및 jQuery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
