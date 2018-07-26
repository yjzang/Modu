<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-07-21
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
    <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css">
    <!-- stylesheet 외부의 css 가져오겟다 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <%--<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.autocomplete.css" />--%>

</head>

<link style="overflow-x:hidden; overflow-y:auto;">


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>


<div class="container">

    <div class="mb-3">
        <div align="center"><span style="font-size: 35px"
                                  id="periodTitle"><strong>태그명+ 보고서</strong></span>
        </div>
        <div>
            <%--<div class="mx-auto" align="center" style="margin-top: 50px">--%>
            <%--</div>--%>
            <div style="float:left">
                <table style="margin-left: 80px;margin-top: 30px;max-height: 280px;" id="shortcutByAjax">
                    <tr style="border-bottom: 1px black solid;">
                        <td style="font-size: 20px;" colspan="3"><strong>태그 바로가기</strong></td>
                    </tr>
                    <tbody id="removeBody" align="center">
                    <c:forEach var="pagingList" items="${pagingList}">
                        <tr>
                            <td colspan="3">
                                <a href="/reportbytag/${crtPage}/${pagingList.tagNo}">${pagingList.tagName}</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            <c:if test="${prev eq true}">
                                <button class="btn" id="btnPrev">◀</button>
                            </c:if>
                        </td>
                        <td class="btn-group btn-group-toggle">
                            <c:forEach var="pagingBtn" begin="${startPageBtnNo}" end="${endPageBtnNo}">
                                <button class="pagingBtn btn" id="${pagingBtn}pagingBtn">${pagingBtn}</button>
                            </c:forEach>
                        </td>
                        <td>
                            <c:if test="${next eq true}">
                                <button class="btn" id="btnNext">▶</button>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="text" value="" id="searchBox" style="width:100px; margin-left: 80px; margin-top: 20px;">
                <button type="button" id="searchPeriod">검색</button>
                <br>
                <span style="color:red; margin-left: 60px; font-size: 20px;" id="searchResult"></span>
            </div>

            <%--<div style="clear: both"></div>--%>
            <c:forEach var="tag" items="${tagList}">
                <c:if test="${tagNo eq tag.tagNo}">
                    <c:set var="tagNameForTitle" value="${tag.tagName}"/>
                </c:if>
            </c:forEach>
            <div style="float:right;margin-top: 50px;">
                <table align="right" style="font-size: 25px;margin-right: 70px; width:150px; text-align: center">
                    <tr>
                        <th colspan="2">총 수입</th>
                    </tr>
                    <tr>
                        <td style="color:blue;" id="periodTotalIncome" align="center"></td>
                        <td align="center">원</td>
                    </tr>
                    <tr>
                        <th align="center" colspan="2">총 지출</th>
                    </tr>
                    <tr>
                        <td style="color:red;" id="periodTotalSpend" align="center"></td>
                        <td align="center">원</td>
                    </tr>
                </table>
            </div>
            <div class="mx-auto">
                <c:set var="placeNumCount" value="0"/>
                <c:forEach var="noPlaceCheck" items="${accountbookListByTag}">
                    <c:if test="${noPlaceCheck.accountbookPlace ne null}">
                        <c:set var="placeNumCount" value="${placeNumCount+1}"/>
                    </c:if>
                </c:forEach>
                <c:if test="${placeNumCount ne 0}">
                <br><br>
                <table align="center" class="table" style="width:700px;">
                    <thead>
                    <tr>
                        <th scope="col" colspan="5" style="font-size: 25px;text-align: center">장소, 인원별 사용금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td align="center">날짜</td>
                        <td align="center">내역</td>
                        <td align="center">장소</td>
                        <td align="center">인원</td>
                        <td align="center">1인당 금액</td>
                    </tr>
                    </c:if>
                    <c:if test="${!empty accountbookListByTag}">
                    <c:forEach var="item" items="${accountbookListByTag}" varStatus="index">
                        <c:if test="${item.totalSpend > 0 and item.accountbookPlace ne null}">
                            <tr>
                                <td align="center">${item.accountbookRegdate}</td>
                                <td align="center">${item.accountbookUsage}</td>
                                <td align="center">${item.accountbookPlace}</td>
                                <td align="center">${item.accountbookPersonnel}</td>
                                <td align="center"
                                    id="spendByPersonnel${index.index}">${item.totalSpend/item.accountbookPersonnel}</td>
                            </tr>

                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
                </c:if>
            </div>

            <div style="clear: both;"></div>
            <div class="mx-auto" id="graph1" style="width: 90%; height: 500px;"></div>
        </div>
        <br>
        <table class="table" style="text-align: center; table-layout: fixed;">
            <thead>
            <tr>
                <th scope="col" colspan="3" style="font-size: 25px;">상세 내역</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="spend" value="0"/>
            <c:set var="income" value="0"/>
            <c:set var="incomeEmptyCheck" value="0"/>
            <c:forEach var="accountList" items="${accountbookListByTag}" varStatus="index">
                <c:if test="${accountList.totalSpend ne 0}">
                    <tr>
                        <td scope="row">${accountList.accountbookRegdate}</td>
                        <td id="usage${index.index}">${accountList.accountbookUsage}</td>
                        <td id="details${index.index}" name="spend">${accountList.totalSpend}</td>
                    </tr>
                    <c:set var="spend" value="${spend+accountList.totalSpend}"/>
                </c:if>
                <c:if test="${accountList.totalIncome ne 0}">
                    <tr style="display: none">
                        <td scope="row">${accountList.accountbookRegdate}</td>
                        <td id="usage${index.index}">${accountList.accountbookUsage}</td>
                        <td id="details${index.index}" name="income">${accountList.totalIncome}</td>
                    </tr>
                    <c:set var="incomeEmptyCheck" value="${incomeEmptyCheck+1}"/>
                    <c:set var="income" value="${income+accountList.totalIncome}"/>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
        <br>

        <c:if test="${incomeEmptyCheck ne 0}">
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col" colspan="3" style="font-size: 20px;">찬조금 내역</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="accountList" items="${accountbookListByTag}" varStatus="index">
                    <c:if test="${accountList.totalIncome ne 0}">
                        <tr>
                            <td scope="row">${accountList.accountbookRegdate}</td>
                            <td>${accountList.accountbookUsage}</td>
                            <td id="detailIncome${index.index}">${accountList.totalIncome}</td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <div align="Right" style="margin-right: 80px;margin-top: 30px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
</div>
<br>
<input type="hidden" value="${crtPage}" id="crtPageForPaging">

</div>


<%--<input type="hidden" id="testest" value="${tagList}">--%>


<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- 자동 완성을 위한 jquery.autocomplete include -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>

<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<<!-- 라인 그래프 출력을 위한 파일 include -->
<link class="include" rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.css"/>
<link class="include" rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.js"></script>
<!-- 막대 그래프 출력을 위한 파일 include -->
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.barRenderer.min.js"></script>
<!-- 원형 그래프 출력을 위한 파일 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.pieRenderer.min.js"></script>
<!-- 그래프 수치 표시를 위한 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.pointLabels.min.js"></script>
<!-- 범례 표시 위한 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
<!--  -->
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/excanvas.min.js"></script>
<!-- 달력 출력을 위한 include -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
      media="screen">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js"
        charset="UTF-8"></script>

<script type="text/javascript">
    var availableTags = new Array();
    var availableTagNo = new Array();
    $(document).ready(function () {

        <c:forEach var="list" items="${tagList}">
        availableTags.push("${list.tagName}");
        availableTagNo.push(${list.tagNo});
        </c:forEach>
        console.log(availableTags);

        $("#searchBox").autocomplete({
            lookup: availableTags
        });

        $('.menuTab').removeClass("active");
        $("#btn_report").addClass("active");
        $(".dropdown-item").removeClass("active");

        $("#periodTitle").html("<strong>${tagNameForTitle} 보고서</strong>");

        $("#periodTotalIncome").text(Number(${income}).toLocaleString('en'));
        $("#periodTotalSpend").text(Number(${spend}).toLocaleString('en'));

        for (var i = 0; i <${accountbookListByTag.size()}; i++) {
            var details = $("#details" + i).text();
            $("#details" + i).text(Number(details).toLocaleString('en') + "원");

            var spendByPersonnel = $("#spendByPersonnel" + i).text();
            $("#spendByPersonnel" + i).text(Number(spendByPersonnel).toLocaleString('en') + "원");

            var detailIncome = $("#detailIncome" + i).text();
            $("#detailIncome" + i).text(Number(detailIncome).toLocaleString('en') + "원");
        }
    });

    $("#searchPeriod").on("click", function () {
        console.log("asdf")
        var searchKWD = $("#searchBox").val();
        var tagNo = 0;

        for (var i in availableTags) {
            if (searchKWD == availableTags[i]) {
                tagNo = availableTagNo[i];
                location.href = "${pageContext.request.contextPath}/reportbytag/" + ${crtPage} +"/" + tagNo;
            } else {
                $("#searchResult").html("검색 결과가 없습니다.");
            }
        }
    });


    $("#shortcutByAjax").on("click", "button", function () {
        var tagNo = ${tagNo};
        var crtPage = $("#crtPageForPaging").val();
        var groupNo = ${authUser.groupNo};
        var tmpText = $(this).attr("id");

        console.log(tmpText);
        if (tmpText == 'btnNext') {
            crtPage++;
            $("#crtPageForPaging").val(crtPage);
        } else if (tmpText == 'btnPrev') {
            crtPage--;
            $("#crtPageForPaging").val(crtPage);
        } else if (tmpText.search('pagingBtn') >= 0) {
            crtPage = tmpText.replace(/[^0-9]/g, '');
            $("#crtPageForPaging").val(crtPage);
        }
        console.log(tagNo);
        console.log(crtPage);
        $.ajax({
            url: "${pageContext.request.contextPath }/report/getTagListForPaging",
            type: "post",
            data: {tagNo: tagNo, crtPage: crtPage, groupNo: groupNo},

            dataType: "json",
            success: function (result) {
                var prev = result.prev;
                var next = result.next;
                var endPageBtnNo = result.endPageBtnNo;
                var startPageBtnNo = result.startPageBtnNo;
                var crtPage = result.crtPage;
                var pagingList = result.pagingList;
                $("#removeBody").empty();
                $.each(pagingList, function (index, value) {
                    var str = "";
                    str += "<tr>";
                    str += "<td colspan='3'>";
                    str += "<a href='${pageContext.request.contextPath}/reportbytag/" + crtPage + "/" + value.tagNo + "'>" + value.tagName + "</a>";
                    str += "</td>";
                    str += "</tr>";
                    str += "<tr>";
                    str += "<td>";
                    $("#removeBody").append(str);
                });
                if (prev == true) {
                    $("#removeBody").append("<button class='btn' id='btnPrev'>◀</button>");
                }
                $("#removeBody").append("</td><td class='btn-group btn-group-toggle' style='text-align: center'>");
                for (var i = startPageBtnNo; i <= endPageBtnNo; i++) {
                    var str = "";
                    str += "<button class='pagingBtn btn' id='" + i + "pagingBtn'>" + i + "</button>";
                    $("#removeBody").append(str);
                }
                    $("#removeBody").append("</td><td>");
                if (next == true) {
                    $("#removeBody").append("<button class='btn' id='btnNext'>▶</button>");
                }
                $("#removeBody").append("</td></tr>");
            }, error: function () {
                alert("통신 실패");
            }
        });
    });

    var fnPrint = function () {
        window.print();
    };

    $(function () {
        var spend = new Array();
        var income = new Array();
        for (var i = 0; i <${accountbookListByTag.size()}; i++) {
            if ($("#details" + i).attr('name') == 'spend') {
                var tmp = $("#details" + i).text();
                var tmp2 = tmp.replace(/[^0-9]/g, '');
                spend.push([$("#usage" + i).text(), Number(tmp2)]);
            } else {
                var tmp = $("#details" + i).text();
                var tmp2 = tmp.replace(/[^0-9]/g, '');
                income.push([$("#usage" + i).text(), Number(tmp2)]);
            }
        }

        if (income == '' || income == null || income == undefined || income == 0 || income == NaN) {
            $.jqplot('graph1', [spend], {
                title: '',
                animate: true,
                seriesColors: ['#eaa228'],
                legend: {
                    renderer: $.jqplot.EnhancedLegendRenderer,//범례 설정
                    show: true,//출력유무
                    placement: 'inside',//출력위치 설정
                    location: 'ne',
                    marginTop: '15px'
                },
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
                    , label: '지출'//막대 이름설정
                    , pointLabels: {show: true, stackedValue: true}//수치 표기
                    , rendererOptions: {//만들기 옵션
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        , shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        , showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        , varyBarColor: false
                        /* 막대 넓이 */
                        , barWidth: 20      //bar width 설정
                        , barPadding: 20  //bar padding
                        , barMargin: 0      //bar간 간격
                    }
                }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer
                        // , ticks: tickMonth
                    },
                    yaxis: {
                        tickOptions: {formatString: "%'d"}
                    }
                }
            });
        } else {
            $.jqplot('graph1', [income, spend], {
                title: '',
                animate: true,
                // seriesColors:['#ff0000','#0000ff'],
                legend: {
                    renderer: $.jqplot.EnhancedLegendRenderer,//범례 설정
                    show: true,//출력유무
                    placement: 'inside',//출력위치 설정
                    location: 'ne',
                    marginTop: '15px'
                },
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
                    , label: '수입'//막대 이름설정
                    , pointLabels: {show: true, stackedValue: true}//수치 표기
                    , rendererOptions: {//만들기 옵션
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        , shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        , showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        , varyBarColor: false
                        /* 막대 넓이 */
                        , barWidth: 20      //bar width 설정
                        , barPadding: 20  //bar padding
                        , barMargin: 0      //bar간 간격
                    }
                },
                    {//두번째 그래프 설정
                        renderer: $.jqplot.BarRenderer
                        , label: '지출'
                        , pointLabels: {show: true, stackedValue: true}
                        , rendererOptions: {
                            animation: {
                                speed: 1500    //animation 설정 시 속도
                            }
                            /* 그림자 */
                            , shadow: false
                            //shadowDepth: 10, 그림자
                            /* 막대에 관한 라인 */
                            , showLine: true
                            /* 각각의 막대그래프 램던 색 여부 */
                            , varyBarColor: false
                            /* 막대 넓이 */
                            , barWidth: 20      //bar width 설정
                            , barPadding: 20  //bar padding
                            , barMargin: 0      //bar간 간격
                        }
                    }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer
                        // , ticks: tickMonth
                    },
                    yaxis: {
                        tickOptions: {formatString: "%'d"}
                    }
                }
            });
        }

    });


</script>
</body>
</html>