<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-07-19
  Time: 오전 11:57
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

</head>
<body style="overflow-x:hidden; overflow-y:auto;">


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>


<div class="container">


    <div align="center" style="margin-top: 50px">

        <input type="button" value="◀" id="fromYearPrev" style="border: none; background-color: white;">
        <input type="text" id="fromYearMonthOutput" readonly="readonly" class="form_month" data-date=""
               data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM"
               style="text-align: center;border: none;">
        <input type="button" value="▶" id="fromYearNext" style="border: none; background-color: white;">
        <input type="button" value="◀" id="toYearPrev" style="border: none; background-color: white;">
        <input type="text" id="toYearMonthOutput" readonly="readonly" class="form_month" data-date=""
               data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM"
               style="text-align: center;border: none;">
        <input type="button" value="▶" id="toYearNext" style="border: none; background-color: white;">
        <button type="button" id="searchPeriod">검색</button>
    </div>
    <br>
    <div class="mb-3">
        <div>
            <br>
            <div align="center"><span style="font-size: 30px"
                                      id="periodTitle"><strong>${fromYear}년 ${fromMonth}월 ~ ${toYear}년 ${toMonth}월 보고서</strong></span>
            </div>
            <br>
            <br>
            <c:if test="${!empty monthlySpend}">
                <c:set var="periodTotalSpend" value="0"/>
                <c:set var="periodTotalIncome" value="0"/>
                <c:forEach var="i" items="${monthlySpend}">
                    <c:set var="periodTotalSpend" value="${periodTotalSpend+i}"/>
                </c:forEach>
                <c:forEach var="i" items="${monthlyIncome}">
                    <c:set var="periodTotalIncome" value="${periodTotalIncome+i}"/>
                </c:forEach>
            </c:if>
            <table align="right" style="font-size: 25px;margin-right: 70px;">
                <tr>
                    <td>총 수입 :</td>
                    <td style="color:blue;" align="center" id="periodTotalIncome"></td>
                    <td>원</td>
                </tr>
                <tr>
                    <td>총 지출 :</td>
                    <td style="color:red;" align="center" id="periodTotalSpend"></td>
                    <td>원</td>
                </tr>
            </table>
            <div style="clear: both"></div>
            <br>
            <br>
            <div class="mx-auto" id="graph1" style="width: 90%; height: 500px;"></div>
            <div style="width: 1173px;">
                <c:if test="${!empty reportListByCategory}">
                <c:if test="${reportListByCategory.get(0).size() > 9}">
                <table class="table" style="text-align: center; table-layout: fixed; font-size: 13px;"
                       id="firstHalfTable">
                </c:if>
                <c:if test="${reportListByCategory.get(0).size() < 10}">
                <table class="table" style="text-align: center; table-layout: fixed;"
                       id="firstHalfTable">
                </c:if>
                        <thead>
                        <tr>
                            <th scope="col" style="width: 127px;"></th>
                            <c:if test="${fromYear eq toYear}">
                                <c:forEach var="month" begin="${fromMonth}" end="${toMonth}">
                                    <th scope="col">${month}월</th>
                                </c:forEach>
                            </c:if>
                            <c:if test="${fromYear ne toYear}">
                                <c:forEach var="month" begin="${fromMonth}" end='12'>
                                    <th scope="col">${month}월</th>
                                </c:forEach>
                                <c:forEach var="month" begin="1" end="${toMonth}" varStatus="mont">
                                    <th scope="col">${mont.count}월</th>
                                </c:forEach>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${reportListByCategory}" varStatus="index">
                            <tr>
                                <td>${item.get(0).categoryName}</td>
                                <c:forEach var="list" items="${item}" varStatus="index2">
                                    <c:if test="${list.totalSpend eq 0 and list.monthNo ne 0}">
                                        <td id="data${index.index}${index2.index}">+${list.totalIncome}</td>
                                    </c:if>
                                    <c:if test="${list.totalIncome eq 0 and list.monthNo ne 0}">
                                        <td id="data${index.index}${index2.index}">-${list.totalSpend}</td>
                                    </c:if>
                                    <c:if test="${list.totalIncome eq 0 and list.totalSpend eq 0}">
                                        <td>0</td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr style="border-top: 2px black solid;">
                            <th>수입</th>
                                <%--for문--%>
                            <c:forEach var="income" items="${monthlyIncome}" varStatus="index">
                                <c:if test="${income gt 0}">
                                    <td style="color:blue;" id="totalIncome${index.index}">+${income}</td>
                                </c:if>
                                <c:if test="${income eq 0}">
                                    <td>${income}</td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr>
                            <th>지출</th>
                                <%--for문--%>
                            <c:forEach var="spend" items="${monthlySpend}" varStatus="index">
                                <c:if test="${spend gt 0}">
                                    <td style="color:red;" id="totalSpend${index.index}">-${spend}</td>
                                </c:if>
                                <c:if test="${spend eq 0}">
                                    <td>${spend}</td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr>
                            <th>합계</th>
                                <%--for문--%>
                            <c:forEach var="total" items="${monthlyTotal}" varStatus="index">
                                <c:if test="${total eq 0}">
                                    <td>${total}</td>
                                </c:if>
                                <c:if test="${total gt 0}">
                                    <td style="color: blue;" id="totalSum${index.index}">+${total}</td>
                                </c:if>
                                <c:if test="${total lt 0}">
                                    <td style="color:red;" id="totalSum${index.index}">${total}</td>
                                </c:if>
                            </c:forEach>
                            </c:if>
                        </tr>
                        </tfoot>
                    </table>
            </div>
        </div>
        <br>
    </div>
    <div align="Right" style="margin-right: 80px;margin-top: 30px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
    <br>
    <input type="hidden" name="" id="fromYear" value="${fromYear}">
    <input type="hidden" name="" id="toYear" value="${toYear}">
    <input type="hidden" name="" id="fromMonth" value="${fromMonth}">
    <input type="hidden" name="" id="toMonth" value="${toMonth}">


</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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


    $(document).ready(function () {
        $('.menuTab').removeClass("active");
        $("#btn_report").addClass("active");
        $(".dropdown-item").removeClass("active");

        var fromYear = $("#fromYear").val();
        var toYear = $("#toYear").val();
        var fromMonth = $("#fromMonth").val();
        var toMonth = $("#toMonth").val();

        $("#fromYearMonthOutput").val(fromYear + "년 " + fromMonth + "월");
        $("#toYearMonthOutput").val(toYear + "년 " + toMonth + "월");
        if (${fromYear eq toYear and fromMonth eq toMonth}) {
            $("#periodTitle").html("<strong>" + fromYear + "년 " + fromMonth + "월 보고서</strong>");
        } else {
            $("#periodTitle").html("<strong>" + fromYear + "년 " + fromMonth + "월 ~ " + toYear + "년 " + toMonth + "월 보고서</strong>");
        }
        $('.form_month').datetimepicker({
            language: 'ko',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 3,
            minView: 3,
            forceParse: 0
        });
        $('#fromYearPrev').on("click", function () {
            var fromYearMonth = $("#fromYearMonthOutput").val();
            var tmp = fromYearMonth.replace(/[^0-9]/g, '');
            var year = Number(tmp.substr(0, 4));
            var month = Number(tmp.substr(4, 6));
            if (month <= 1) {
                month = 12;
                $("#fromYearMonthOutput").val(year - 1 + "년 " + month + "월");
            } else {
                month--;
                $("#fromYearMonthOutput").val(year + "년 " + month + "월");
            }
        });
        $('#fromYearNext').on("click", function () {
            var fromYearMonth = $("#fromYearMonthOutput").val();
            var tmp = fromYearMonth.replace(/[^0-9]/g, '');
            var year = Number(tmp.substr(0, 4));
            var month = Number(tmp.substr(4, 6));
            if (month >= 12) {
                month = 1;
                $("#fromYearMonthOutput").val(year + 1 + "년 " + month + "월");
            } else {
                month++;
                $("#fromYearMonthOutput").val(year + "년 " + month + "월");
            }
        });
        $('#toYearPrev').on("click", function () {
            var toYearMonth = $("#toYearMonthOutput").val();
            var tmp = toYearMonth.replace(/[^0-9]/g, '');
            var year = Number(tmp.substr(0, 4));
            var month = Number(tmp.substr(4, 6));
            if (month <= 1) {
                month = 12;
                $("#toYearMonthOutput").val(year - 1 + "년 " + month + "월");
            } else {
                month--;
                $("#toYearMonthOutput").val(year + "년 " + month + "월");
            }
        });
        $('#toYearNext').on("click", function () {
            var toYearMonth = $("#toYearMonthOutput").val();
            var tmp = toYearMonth.replace(/[^0-9]/g, '');
            var year = Number(tmp.substr(0, 4));
            var month = Number(tmp.substr(4, 6));
            if (month >= 12) {
                month = 1;
                $("#toYearMonthOutput").val(year + 1 + "년 " + month + "월");
            } else {
                month++;
                $("#toYearMonthOutput").val(year + "년 " + month + "월");
            }
        });
        var periodTotalSpend = ${periodTotalSpend};
        var periodTotalIncome = ${periodTotalIncome};
        $("#periodTotalSpend").text(Number(periodTotalSpend).toLocaleString('en'));
        $("#periodTotalIncome").text(Number(periodTotalIncome).toLocaleString('en'));
        for (var i = 0; i <${monthlyTotal.size()}; i++) {
            var totalSum = $("#totalSum" + i).text();
            $("#totalSum" + i).text(Number(totalSum).toLocaleString('en'));
        }
        for (var i = 0; i <${monthlyIncome.size()}; i++) {
            var totalIncome = $("#totalIncome" + i).text();
            $("#totalIncome" + i).text(Number(totalIncome).toLocaleString('en'));
        }
        for (var i = 0; i <${monthlySpend.size()}; i++) {
            var totalSpend = $("#totalSpend" + i).text();
            $("#totalSpend" + i).text(Number(totalSpend).toLocaleString('en'));
        }
        for (var i = 0; i <${reportListByCategory.size()}; i++) {
            for (var j = 0; j <${monthlyTotal.size()}; j++) {
                var data = $("#data" + i + j).text();
                if (data > 0) {
                    data = "+" + Number(data).toLocaleString('en');
                } else {
                    data = Number(data).toLocaleString('en');
                }
                $("#data" + i + j).text(data);
            }
        }
    });

    $("#searchPeriod").on("click", function () {
        var groupNo = ${groupNo};
        var fym = $("#fromYearMonthOutput").val();
        var tym = $("#toYearMonthOutput").val();
        var tmp = fym.replace(/[^0-9]/g, '');
        var fy = Number(tmp.substr(0, 4));
        var fm = Number(tmp.substr(4, 6));
        var tmp = tym.replace(/[^0-9]/g, '');
        var ty = Number(tmp.substr(0, 4));
        var tm = Number(tmp.substr(4, 6));
        var check = 13 - fm + tm <= 12 ? true : false;
        console.log(fm);
        console.log(tm);
        console.log(check);
        if (fy == ty && fm < tm) {
            location.href = "${pageContext.request.contextPath }/reportbyperiod/" + groupNo + "/" + fy + "/" + fm + "/" + ty + "/" + tm;
        } else if (fy < ty && check) {
            location.href = "${pageContext.request.contextPath }/reportbyperiod/" + groupNo + "/" + fy + "/" + fm + "/" + ty + "/" + tm;
        } else if (fy == ty && fm == tm) {
            location.href = "${pageContext.request.contextPath }/reportbyperiod/" + groupNo + "/" + fy + "/" + fm + "/" + ty + "/" + tm;
        } else if (fy > ty) {
            alert("기간 설정을 다시 해 주세요")
        } else if (fy == ty && fm > tm) {
            alert("기간 설정을 다시 해 주세요")
        } else {
            alert("기간은 최대 12개월까지 설정할 수 있습니다");
        }
    });

    var fnPrint = function () {
        window.print();
    };

    $(function () {
        //for문으로 합계 구하기
        var spend1 = new Array;
        for (var i in ${monthlySpend}) {
            spend1.push(${monthlySpend}[i]);
        }
        var income1 = new Array;
        for (var i in ${monthlyIncome}) {
            income1.push(${monthlyIncome}[i]);
        }
        var tickMonth = new Array;
        if (${fromYear == toYear}) {
            for (var i =${fromMonth}; i <=${toMonth}; i++) {
                tickMonth.push(i + "월");
            }
        } else {
            for (var i =${fromMonth}; i <= 12; i++) {
                tickMonth.push(i + "월")
            }
            for (var i = 1; i <=${toMonth}; i++) {
                tickMonth.push(i + "월")
            }
        }
        $.jqplot('graph1', [income1, spend1], {
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
                    , ticks: tickMonth
                },
                yaxis: {
                    tickOptions: {formatString: "%'d"}
                }
            }
        });
    });


</script>
</body>
</html>