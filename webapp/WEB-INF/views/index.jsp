<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
    <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu.css">
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
          media="screen">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<c:if test="${authUser eq null}">
<body style="overflow-x:hidden; overflow-y:auto;padding-top: 90px;">
</c:if>
<c:if test="${authUser ne null}">
<body style="overflow-x:hidden; overflow-y:auto;">
</c:if>
<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
 
<!----------------- container------------------->
<div class="container">

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" width="100%">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="carousel-caption d-none d-md-block mb-5">
                    <h1 class="mr-5">누구나, 한눈에 볼 수 있는 &ensp;&ensp;</h1>

                    <h1 class="ml-4">&nbsp;&ensp;&ensp;&ensp; 투명한 재정관리 </h1>
                    <br><br>
                    <button class="btn btn-primary btn-lg">모두의 가계부 시작하기</button>
                    <br>
                </div>

                <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main01.png"
                     alt="First slide">

            </div>
            <div class="carousel-item">
                <div class="carousel-caption d-none d-md-block mb-5">
                    <h1> 여러 모임 속에서 </h1>
                    <h1> 다양한 가계부를 한눈에 </h1>
                    <br>
                    <br>
                    <button class="btn btn-primary btn-lg">지금 바로 시작하기</button>
                </div>
                <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main02.png"
                     alt="Second slide">
            </div>
            <div class="carousel-item">
                <div class="carousel-caption d-none d-md-block mb-5">
                    <h1> 총무에게 편리한 </h1>
                    <h1> &ensp; &ensp;회비 관리 서비스</h1>
                    <br>
                    <br>
                    <button class="btn btn-primary btn-lg">바로 시작하기</button>
                </div>
                <img class="d-block w-100" src="${pageContext.request.contextPath }/assets/images/main03.png"
                     alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="ment" style="text-align: center;">
        <br>
        <span class="ment01" style="color: #0070c0;"> 모두의</span>
        <span class="ment02"> 가계부</span>
        <span class="ment03">만의 확실한 서비스</span>

    </div>
    <div class="card-deck mt-5">
        <div class="card" style="border: none">
            <img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill01.png"
                 alt="Card image cap">
            <div class="card-body" style="text-align: center">
                <h4 class="card-title">빅데이터 기반 <br> 맞춤 추천 서비스</h4>
                <p class="card-text">다양한 모임장소 데이터를 기반으로 <br>우리 모임에게 적절한<br> 모임 장소를 추천</p>
            </div>

        </div>
        <div class="card" style="border: none">
            <img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill02.png"
                 alt="Card image cap">
            <div class="card-body" style="text-align: center">
                <h4 class="card-title">다중 가계부</h4>
                <p class="card-text">여러 모임에<br> 다양한 가계부를<br> 한번에 정리할 수 있어요</p>
            </div>
        </div>
        <div class="card" style="border: none">
            <img class="w-40 mx-auto" src="${pageContext.request.contextPath }/assets/images/skill03.png"
                 alt="Card image cap">
            <div class="card-body" style="text-align: center">
                <h4 class="card-title">SMS 인식 기반 <br> 자동 입력 기능</h4>
                <p class="card-text">모든 sms알람을 <br>자동으로 인식하여 <br>편하게 입력할 수 있어요</p>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<!-- 로그인 Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content text-center">
            <div class="modal-header">
                <h5 class="modal-title ml-3" id="exampleModalCenterTitle">로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <center>
                    <input type="text" name="userEmail" id="loginEmail" class="form-control w-75" aria-label="Large"
                           aria-describedby="inputGroup-sizing-sm" placeholder="이메일 주소"><br>
                    <input type="password" name="userPassword" id="loginPassword" class="form-control w-75"
                           aria-label="Large"
                           aria-describedby="inputGroup-sizing-sm" placeholder="비밀번호"><br>
                    <button type="submit" class="btn btn-primary w-25" onclick="return loginFinalCheck()">로그인</button>
                    <br>
                </center>

                <div class="text-left custom-control custom-checkbox ml-5 pl-5 my-3">
                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                    <label class="custom-control-label" for="customCheck1">이메일 저장</label>
                    <span id="loginCheck"></span>
                </div>
                <%--<a href="#">다른 계정으로 로그인 </a>--%>
                <a class="kakao-login-btn"></a>
                <%--<a href="http://developers.kakao.com/logout"></a>--%>
            </div>
            <div class="mb-4">
                <a href="#">아이디 찾기 </a> |
                <a href="#">비밀번호 찾기 </a> |
                <a href="#" id="joinForm">회원가입하기</a>
            </div>
        </div>
    </div>
</div>

<!-- 회원가입 Modal -->
<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content text-center">
            <div class="modal-header">
                <h5 class="modal-title ml-3">회원가입</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath }/join" method="post">
                    <center>
                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/email.jpg" style="width:35px">
                        <input type="text" name="userEmail" class="form-control w-75" aria-label="Large"
                               aria-describedby="inputGroup-sizing-sm" placeholder="이메일 주소" id="userEmail"
                               onblur="emailCheck()"><br>

                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/password.jpg" style="width:35px">
                        <input type="text" name="userPassword" class="form-control w-75" aria-label="Large"
                               aria-describedby="inputGroup-sizing-sm" placeholder="비밀번호" id="userPassword"
                               onblur="passwordCheck()"><br>

                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/password.jpg" style="width:35px">
                        <input type="text" class="form-control w-75" aria-label="Large"
                               aria-describedby="inputGroup-sizing-sm" placeholder="비밀번호 확인" id="userPasswordConfirm"
                               onblur="passwordCheckConfirm()"><br>

                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/name.jpg" style="width:35px">
                        <input type="text" name="userName" class="form-control w-75" aria-label="Large"
                               aria-describedby="inputGroup-sizing-sm" placeholder="이름(실명)" id="userName"
                               onblur="nameCheck()"><br>

                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/birthday.jpg" style="width:35px">
                        <input type="text" name="userBirthday" readonly="readonly" class="form_day form-control w-75"
                               aria-label="Large" data-date="" aria-describedby="inputGroup-sizing-sm"
                               data-date-format="yyyy년 MM dd일" data-link-field="dtp_input3"
                               data-link-format="yyyy MM dd"
                               placeholder="생년월일" id="userBirthday">

                    </center>
                    <div class="text-left custom-control custom-checkbox ml-5 pl-5 my-3">
                        <input type="checkbox" class="custom-control-input" id="customCheck2">
                        <label class="custom-control-label" for="customCheck2">약관 동의 </label>
                    </div>
                    <span id="duplicateCheck"></span>
                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary w-50" onclick="return joinFinalCheck()">회원가입
                        </button>
                        <a class="kakao-login-btn"></a>
                        <input type="hidden" id="isEmailChecked" value="false">
                        <input type="hidden" id="isPasswordChecked" value="false">
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>


<!-- 카카오 회원가입 Modal -->
<div class="modal fade" id="kakaoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content text-center">
            <div class="modal-header">
                <h5 class="modal-title ml-3" id="exampleModalCenterTitle2">카카오톡으로 회원 가입하기</h5>
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath }/kakaoJoin" method="post">
                    <center>
                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/name.jpg" style="width:35px">
                        <input type="text" name="userName" class="form-control w-75" aria-label="Large"
                               aria-describedby="inputGroup-sizing-sm" placeholder="이름(실명)" id="kakaoUserName"
                               onblur="kakaoNameCheck()"><br>

                        <img class="float-left ml-4 m-0 p-0"
                             src="${pageContext.request.contextPath }/assets/images/birthday.jpg" style="width:35px">
                        <input type="text" name="userBirthday" readonly="readonly" class="form_day form-control w-75"
                               aria-label="Large" data-date="" aria-describedby="inputGroup-sizing-sm"
                               data-date-format="yyyy년 MM dd일" data-link-field="dtp_input3"
                               data-link-format="yyyy MM dd"
                               placeholder="생년월일" id="kakaoUserBirthday">
                        <span id="kakaoAlertMessage"></span><br>
                        <button type="submit" class="btn btn-primary w-25 mt-4" onclick="return kakaoJoin()">회원가입
                        </button>
                        <br>
                        <input type="hidden" name="userEmail" id="kakaoUserEmail" value="">
                    </center>
                </form>
            </div>
            <div class="mb-4">

            </div>
        </div>
    </div>

</div>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js"
        charset="UTF-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

    //쿠키설정하기
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    $(document).ready (function () {

        //    아이디기억용 쿠키
        //    시작되면 이메일칸에 쿠키정보 가져와서 뿌리기
        var userEmail = getCookie("userEmail");
        $("#loginEmail").val(userEmail);
        //만약 이메일칸에 정보가 있으면 체크박스를 체크상태로 바꾸고
        if ($("#loginEmail").val() != "") {
            $("input:checkbox[id='customCheck1']").prop("checked", true);
        }
    });
    //체크박스에 변화가 있을때
    $("#customCheck1").on("change", function () {
        // 체크된상태이면 쿠키를 세팅해라
        if ($("#customCheck1").is(":checked")) {
            var getUserEmail = $("#loginEmail").val();
            setCookie("userEmail", getUserEmail, 7);
        } else {//체크되지 않은 상태면 쿠키를 지워라
            deleteCookie("userEmail");
        }
    });
    //    아이디저장하기가 체크된 상태에서 아이디를 새로 입력했을 때도 쿠키를 저장해라
    $("#loginEmail").on("keyup", function () {
        if ($("#customCheck1").is(":checked")) {
            var getUserEmail = $("#loginEmail").val();
            setCookie("userEmail", getUserEmail, 7);
        }
    });


    $("#joinForm").on("click", function () {
        $("#exampleModalCenter").modal("hide");
        $("#exampleModalCenter3").modal();
    });

    // var joinForm = function(){
    //     $("#exampleModalCenter").modal("hide");
    //     $("#exampleModalCenter3").modal();
    // }
    //이메일 회원가입 이메일 중복확인
    var emailCheck = function () {
        var emailCheck = $("#userEmail").val();
        $.ajax({
            url: "${pageContext.request.contextPath }/emailcheck",
            type: "post",
            data: {userEmail: emailCheck},

            dataType: "json",
            success: function (result) {
                if (result > 0) {
                    $("#duplicateCheck").html("이 이메일은 이미 가입되어 있습니다");
                    $("#duplicateCheck").css("color", "red");
                    $("#isEmailChecked").val("false");
                } else {
                    $("#duplicateCheck").html("가입 가능한 이메일 입니다");
                    $("#duplicateCheck").css("color", "blue");
                    $("#isEmailChecked").val("true");
                }
            }, error: function (request, status, error) {
                console.error(request, status, error);
                alert("통신 실패");
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    };
    //이메일 회원가입 비밀번호 확인
    var passwordCheck = function () {
        var passwordCheck = $("#userPassword").val();
        if (passwordCheck.length < 4) {
            $("#duplicateCheck").html("비밀번호는 4자리 이상 입력해주세요");
            $("#duplicateCheck").css("color", "red");
            $("#isPasswordChecked").val("false");
        } else {
            $("#duplicateCheck").html("");
            $("#isPasswordChecked").val("true");
        }
    };
    //이메일 회원가입 비밀번호 재입력 확인
    var passwordCheckConfirm = function () {
        var password = $("#userPassword").val();
        var passwordCheckConfirm = $("#userPasswordConfirm").val();
        if (password != passwordCheckConfirm) {
            $("#duplicateCheck").html("비밀번호를 확인해 주세요");
            $("#duplicateCheck").css("color", "red");
        } else {
            $("#duplicateCheck").html("");
        }
    };
    //이메일 회원가입 이름 확인
    var nameCheck = function () {
        var userName = $("#userName");
        if (userName == null) {
            $("#duplicateCheck").html("이름을 입력해 주세요");
        } else {
            $("#duplicateCheck").html("");
        }
    };

    //이메일 회원가입 최종 확인
    var joinFinalCheck = function () {
        // event.preventDefault();
        console.log("파이널체크");
        var userEmail = $("#userEmail").val();
        var userPassword = $("#userPassword").val();
        var userPasswordConfirm = $("#userPasswordConfirm").val();
        var userName = $("#userName").val();
        var userBirthday = $("#userBirthday").val();
        var isEmailChecked = $("#isEmailChecked").val();
        var isPasswordChecked = $("#isPasswordChecked").val();
        var agree = $("input:checkbox[id='customCheck2']").is(":checked") == true;
        var emailPattern = /[-!#$%&'*+/^_~{}|0-9a-zA-Z]+(.[-!#$%&'*+/^_~{}|0-9a-zA-Z]+)*@[-!#$ %&'*+/^_~{}|0-9a-zA-Z]+(.[-!#$%&'*+/^_~{}|0-9a-zA-Z]+)*/;
        var result = userEmail.match(emailPattern);
        var namePattern = /^[가-힣]{2,4}$/;
        var nameResult = userName.match(namePattern);

        $("#duplicateCheck").html("");
        if (userEmail == "") {
            console.log("이메일없을때");
            $("#duplicateCheck").html("이메일을 입력해 주세요");
            $("#duplicateCheck").css("color", "red");
            return false;
        } else if (userEmail != "") {
            console.log("이메일 있을때");
            if (isEmailChecked == "false") {
                $("#duplicateCheck").html("이미 사용중인 이메일 입니다");
                $("#duplicateCheck").css("color", "red");
                return false;
            }
            if (result == null) {
                $("#duplicateCheck").html("이메일 형식을 확인해 주세요");
                $("#duplicateCheck").css("color", "red");
                return false;
            }
        }
        if (userPassword == "") {
            console.log("비밀번호 없을때");
            $("#duplicateCheck").html("비밀번호를 입력해 주세요");
            $("#duplicateCheck").css("color", "red");
            return false;
        } else if (userPassword != "") {
            console.log("비밀번호 있을때");
            if (userPasswordConfirm == "") {
                $("#duplicateCheck").html("비밀번호를 한번 더 입력 입력해 주세요");
                $("#duplicateCheck").css("color", "red");
                return false;
            } else if (userPasswordConfirm != "") {
                console.log("비밀번호 재입력 있을때");
                if (isPasswordChecked == "false") {
                    $("#duplicateCheck").html("비밀번호를 4자리 이상 입력해 주세요");
                    $("#duplicateCheck").css("color", "red");
                    return false;
                } else if (userPasswordConfirm != userPassword) {
                    console.log("비밀번호, 재입력 같지 않을때");
                    $("#duplicateCheck").html("비밀번호가 같은지 확인해 주세요");
                    $("#duplicateCheck").css("color", "red");
                    return false;
                }
            }
        }

        if (userName == "") {
            console.log("이름 없을때");
            $("#duplicateCheck").html("이름을 입력해 주세요");
            $("#duplicateCheck").css("color", "red");
            return false;
        } else if (userName != "") {
            console.log("이름 있을때");
            if (nameResult == null) {
                $("#duplicateCheck").html("이름을 한글로 정확히 입력해 주세요");
                $("#duplicateCheck").css("color", "red");
                return false;
            }
        }
        if (userBirthday == "") {
            console.log("생일 없을때");
            $("#duplicateCheck").html("생일을 입력해 주세요");
            $("#duplicateCheck").css("color", "red");
            return false;
        }
        if (agree == false) {
            $("#duplicateCheck").html("약관에 동의하셔야 가입이 가능합니다");
            $("#duplicateCheck").css("color", "red");
            return false;
        } else if (agree == true) {
            $("#duplicateCheck").html("");
            alert("회원 가입 성공");
            alert(userName + "," + userEmail + "," + userPassword + "," + userBirthday);
            return true;
        }
    };

    //이메일 로그인 최종 확인
    var loginFinalCheck = function () {
        var userEmail = $("#loginEmail").val();
        var userPassword = $("#loginPassword").val();

        $.ajax({
            url: "${pageContext.request.contextPath }/userlogincheck",
            type: "post",
            data: {userEmail: userEmail, userPassword: userPassword},

            dataType: "json",
            success: function (result) {
                if (result > 0) {
                    alert("로그인 성공");
                    $("#loginEmail").val("");
                    $("#loginPassword").val("");
                    location.href = "${pageContext.request.contextPath }/main";
                } else if (result == 0) {
                    $("#loginCheck").html("로그인 정보를 확인하세요");
                    $("#loginCheck").css("color", "red");
                }
            }, error: function (request, status, error) {
                console.error(request, status, error);
                alert("통신 실패");
                // alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
    //카카오 회원가입 ajax 이름 체크
    var kakaoNameCheck = function () {
        var userName = $("#kakaoUserName").val();
        if (userName == "") {
            $("#kakaoAlertMessage").html("이름을 입력해 주세요");
            $("#kakaoAlertMessage").css("color", "red");
        } else {
            $("#kakaoAlertMessage").html("");
        }
    }
    //카카오 회원가입 최종 확인
    var kakaoJoin = function () {
        var userName = $("#kakaoUserName").val();
        var userBirthday = $("#kakaoUserBirthday").val();
        var namePattern = /^[가-힣]{2,4}$/;
        var nameResult = userName.match(namePattern);

        $("#kakaoAlertMessage").html("");

        if (userName == "") {
            $("#kakaoAlertMessage").html("이름을 입력해 주세요");
            $("#kakaoAlertMessage").css("color", "red");
            return false;
        } else {
            if (nameResult == null) {
                $("#kakaoAlertMessage").html("이름을 한글로 정확히 입력해 주세요");
                $("#kakaoAlertMessage").css("color", "red");
                return false;
            }
        }
        if (userBirthday == "") {
            $("#kakaoAlertMessage").html("생일을 입력해 주세요");
            $("#kakaoAlertMessage").css("color", "red");
            return false;
        } else {
            return true;
        }

    }


    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('51711e01a78bd307f3d56512b550d08c');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '.kakao-login-btn',
        success: function (authObj) {
            // alert(JSON.stringify(authObj));
            Kakao.API.request({
                url: '/v1/user/me',
                success: function (res) {
                    // alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
                    // alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
                    console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                    console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
                    console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근
                    // res.properties.nickname으로도 접근 가능 )
                    console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

                    $.ajax({
                        url: "${pageContext.request.contextPath }/emailcheck",
                        type: "post",
                        data: {userEmail: res.id},

                        dataType: "json",
                        success: function (result) {
                            if (result > 0) {
                                location.href = "${pageContext.request.contextPath }/kakaoLogin?userEmail=" + res.id;
                            } else {
                                $("#kakaoUserEmail").val(res.id);
                                $("#exampleModalCenter").modal("hide");
                                $("#kakaoModal").modal();
                            }
                        }, error: function (request, status, error) {
                            console.error(request, status, error);
                            alert("통신 실패");
                            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });

                    // $("#kakaoModal").modal({backdrop: 'static'});
                    <%--location.href = "${pageContext.request.contextPath }/main";--%>
                },
                fail: function (err) {
                    alert(JSON.stringify(err));
                }
            })
        }
    });
    //]]>

</script>

</body>
</html>