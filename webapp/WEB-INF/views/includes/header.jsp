<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-----------header------------------>
<header style="z-index: 4">

    <style type="text/css">
        .dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
        }

    </style>
    <%--첫번째 네비바--%>
    <nav class="container navbar navbar-expand-lg navbar-light bg-light">
        <%-- 공통 로고 --%>
        <a class="navbar-brand"
           href="${pageContext.request.contextPath }/main"> <img
                class="mb-1"
                src="${pageContext.request.contextPath }/assets/images/logo1.png"
                width="168" height="72" alt="모두의 가계부">
        </a>
 
        <c:if test="${authUser ne null}">
            <%--모임 검색창--%>
            <form class="form-inline mt-3" method="post" action="${pageContext.request.contextPath }/groupmain/${gvo.groupNo}/groupSearch">
                <input class="form-control mr-sm-1 searchForm " id="searchbox" name="gSearch"
                       style="border-bottom-width: 2px; border-color: #0070c0; width: 300px;"
                       type="text" placeholder="모임을 검색하세요" aria-label="search">
                <button class="t-button mt-2" type="submit" id="sumit">
                    <img src="${pageContext.request.contextPath }/assets/images/search.png">
                </button>
            </form>

            <!-- <form action="#" name="form1" method="post">
            <input type="text" id="searchbox">
            <input type="submit" id="submit" value="검색">
            </form> -->
        </c:if>

        <c:if test="${authUser eq null}">
            <div class="collapse navbar-collapse justify-content-end">

                <ul class="navbar-nav mt-2">
                        <%--로그인/회원가입 버튼--%>
                    <button class="mr-2"
                            style="border: 2px solid #0179c1; background-color: white;">
                        <a class="nav-link" href="#"
                           style="color: #0179c1; font-weight: bold;" data-toggle="modal"
                           data-target="#exampleModalCenter">로그인/회원가입</a>
                    </button>
                </ul>

            </div>
        </c:if>
        <c:if test="${authUser ne null}">
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav mt-2">
                    <div class="clubIcon float-right mb-3">
                        <button class="btn btn-sm btn-mint" data-toggle="modal"
                                data-target="#exampleModalCenter01">모임 추가하기
                        </button>
                    </div>
                        <%--로그인/회원가입 버튼--%>
                    <div>
                        <button class="mr-3 mt-3" style="border: 2px solid #0179c1; background-color: white;">
                            <a href="${pageContext.request.contextPath }/logout"
                               class="nav-link" style="color: #0179c1; font-weight: bold;">로그아웃</a>
                        </button>
                    </div>
                </ul>

            </div>
        </c:if>
        <%--<button class="mr-2"style="border:2px solid #0179c1; background-color:white; ">--%>
        <%--<a class="nav-link" href="#" style="color: #0179c1; font-weight: bold;" data-toggle="modal" data-target="#exampleModalCenter3">회원가입</a>--%>
        <%--</button>--%>

        </ul>

        </div>
    </nav>
    <!-- <div style="margin-bottom: 80px;"></div> -->
    <c:if test="${authUser ne null}">
        <%--두번째 네비바--%>
        <nav id="secNav" class="container navbar navbar-expand-lg navbar-light bg-light">

            <div class="collapse navbar-collapse "
                 width="70">
                <ul class="navbar-nav icon" id="check">



					<%--모임 리스트--%>
					<c:choose>
						<c:when test="${gList ne null}">
							<%-- <li class="nav-item" >
							<div class="clubIcon active"  id="gClick" >
								<img src="${pageContext.request.contextPath }/upload/${gvo.groupImg}" alt="" style="max-height: 50px; max-width: 50px;"> <br>
							    <a class="nav-link"  href="${pageContext.request.contextPath }/groupmain" style="font-size: 3px">${gvo.groupName }</a>
							</div>
						</li>	 --%>
							<div class="btn-group active ml-0 dropdown">
								<div style="width:200px;  overflow:hidden; text-overflow:ellipsis; height: 50px;">
									<c:if test="${gvo.groupImg==null}" >
										<img src="${pageContext.request.contextPath }/assets/images/groupImg00.png"
											alt="" style="max-height: 50px; max-width: 50px; ">
									</c:if>
									<c:if test="${gvo.groupImg!=null}" >
										<img src="${pageContext.request.contextPath }/upload/${gvo.groupImg}"
											alt="" style="max-height: 50px; max-width: 50px; ">
									</c:if>
										${gvo.groupName!=null?gvo.groupName:'모임을 선택하세요' }
								</div>

                                <button class="btn btn-light btn-lg dropdown-toggle ml-0 dropdown"
                                        type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">

                                </button>

                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${gList }" var="gro">
                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath }/groupmain/${gro.groupNo}"
                                           style=" font-size: 20px ; ">
                                            <img src="${pageContext.request.contextPath }/upload/${gro.groupImg}"
                                                 alt="" style="max-height: 50px; max-width: 50px;">
                                            &nbsp; ${gro.groupName}</a>
                                    </c:forEach>
                                </div>
                            </div>

                            <c:if test="${gvo.groupNo ne null}">
                                <!-- <nav id="thirdNav"
                                class="container navbar navbar-expand-lg navbar-light bg-light">
                                -->
                                <div class="collapse navbar-collapse " style="position:absolute; right:300px;">

					<ul class="navbar-nav" >
						<%--메인--%>
						<li id="btn_main" class="nav-item menuTab active"><a
							class="nav-link"
							href="${pageContext.request.contextPath }/groupmain/${gvo.groupNo}">메인
								<span class="sr-only">(current)</span>
						</a></li>
						<%--가계부--%>
						<li id="accountbook" class="nav-item menuTab"><a
							class="nav-link"
							href="${pageContext.request.contextPath }/accountbook/${gvo.groupNo}">가계부</a>
						</li>
						<%--통계(풀다운메뉴)--%>
						<li class="nav-item menuTab dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 통계 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<%--경로 = 최상경로/모임번호/annualreport--%>
                                    <a id="goToReportByPeriod" class="dropdown-item" href="" onclick="goToReportByPeriod()">기간별 보고서</a>
                                    <a id="goToReportByTag" class="dropdown-item" href="" onclick="goToReportByTag()">태그별 보고서</a>
							</div></li>
						<%--게시판--%>
						<li id="btn_board" class="nav-item menuTab"><a
							class="nav-link"
							href="${pageContext.request.contextPath }/board/${gvo.groupNo}">게시판</a></li>

						<%--회비관리--%>
						<c:choose>
						 <c:when test="${authUser.userNo eq gvo.manager }">
						   <c:choose>
						   <c:when test="${empty gvo.memberFeeAmount  }">
						     <li class="nav-item menuTab"><a class="nav-link"
							     href="${pageContext.request.contextPath }/membershipfee/${gvo.groupNo}">회비관리</a>
						     </li>
						   </c:when>
						   <c:otherwise>
						     <li class="nav-item menuTab"><a class="nav-link"
							     href="${pageContext.request.contextPath }/membershipfee/${gvo.groupNo}/feemanage">회비관리</a>
						     </li>
						   </c:otherwise>
						   </c:choose>
						 </c:when>
						 <c:otherwise>
						   <li class="nav-item menuTab"><a class="nav-link"
							   href="${pageContext.request.contextPath }/membershipfee/${gvo.groupNo}/feemanage">회비관리</a>
						   </li>
						 </c:otherwise>
						</c:choose>

						<c:if test="${authUser.userNo eq gvo.manager }">
						<%--모임관리--%>
						<li class="nav-item menuTab"><a class="nav-link"
							href="${pageContext.request.contextPath }/groupmanage/${gvo.groupNo}">모임관리</a></li>
						</c:if>

				</div>

			<!-- </nav> -->
		 </c:if>

						</c:when>
						<c:otherwise>
							<li class="nav-item">

								<div class="btn-group active">
								<button class="btn btn-light btn-lg dropdown-toggle"
									type="button" id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="#"
										style="font-size: 15px">&emsp;모임이없습니다.&emsp;</a>
								</div>
								</div>
							</li>
						</c:otherwise>
					</c:choose>

				</ul>

			</div>
		</nav>

	</c:if>
</header>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter01" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content text-center">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <img
						alt="groupImg02"
						src="${pageContext.request.contextPath }/assets/images/groupImg02.png">&emsp;
					모임 정보 입력
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="join-form" name="joinForm" method="post"
				action="${pageContext.request.contextPath}/plusgroup"
				enctype="multipart/form-data">
				<center>
					<div class="modal-body">
						<!-- <label for="gname1">모임 이름</label> -->
						<input type="text" name="groupName"
							class="form-control w-75 text-center" aria-label="Large"
							aria-describedby="inputGroup-sizing-sm" id="gname1" name="gname"
							placeholder="모임이름" value=""><br>
						<!-- <label for="gtag1">모임 설명, 해시태그</label> -->
						<input type="text" name="groupExplain"
							class="form-control w-75 text-center" aria-label="Large"
							aria-describedby="inputGroup-sizing-sm" id="gtag1" name="gtag"
							placeholder="모임설명, 해시태그" value=""><br>

                        <div class="form-group p-2 w-75" style="position: relative;">
                            <input type="file" name="file" class="custom-file-input"
                                   id="boardUpload" multiple="true" onchange="loadFile(event);">
                            <label class="custom-file-label text-center pr-5"
                                   for="boardUpload">이미지 업로드 &emsp;</label> <img id="addImg" src=""
                                                                                 class="w-100 mx-auto mt-3">
                        </div>

                        <br> <label for="gcar1" style="font-weight: bold">*모임
                        성격</label>
                        <!-- <input type="text" class="form-control w-75" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="gcar1" name="gcar"> -->
                        <br>

						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline1" name="groupType"
								class="custom-control-input" value="1"> <label
								class="custom-control-label" for="customRadioInline1">계모임</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline2" name="groupType"
								class="custom-control-input" value="2"> <label
								class="custom-control-label" for="customRadioInline2">동아리/동호회</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline3" name="groupType"
								class="custom-control-input" value="3"> <label
								class="custom-control-label" for="customRadioInline3">친목모임</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" id="customRadioInline4" name="groupType"
								class="custom-control-input" value="4"> <label
								class="custom-control-label" for="customRadioInline4">기타</label>
						</div>
						<input type="hidden" name="userNo" value="${authUser.userNo}">
						<div class="text-center mb-3">
							<br> <input class="btn btn-success" name="" type="submit"
								value="모임 생성하기">

                        </div>
                    </div>
            </form>
            </center>
        </div>
    </div>
</div>
<input type="hidden" name="groupNo" id="groupNo" value="${authUser.groupNo}">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
    /*  이미지 미리보기 , 확장자 체크  */

    var goToReportByPeriod = function () {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var groupNo = $("#groupNo").val();
        $("#goToReportByPeriod").attr("href", "${pageContext.request.contextPath}/reportbyperiod/" + groupNo + "/" + year + "/" + month + "/" + year + "/" + month);
    }

    var goToReportByTag = function () {
        var groupNo = $("#groupNo").val();
        //제일 최근 태그 가져와야함
        //ajax 구현
        $("#goToReportByTag").attr("href", "${pageContext.request.contextPath}/report/getRecentTag/" + groupNo);
    }

    /*  이미지 미리보기 , 확장자 체크  */

    var loadFile = function (event) {
        var addImg = document.getElementById('addImg');
        addImg.src = URL.createObjectURL(event.target.files[0]);

        var fileName = $("#boardUpload").val();

        fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
        console.log(fileName);
        if (fileName != "jpg" && fileName != "png" && fileName != "gif" && fileName != "bmp") {

            alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");

            $("#boardUpload").val('');
            $("#addImg").hide();

            /*$('#boardUploadModal').modal('hide');*/

        } else {
            $("#addImg").show();
        }

    };


</script>



