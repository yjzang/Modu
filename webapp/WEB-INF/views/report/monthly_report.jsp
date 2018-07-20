<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-06-30
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css">
    <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">
<%--수정--%>


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

<div class="container">

    <br><br>
    <div align="center"><span style="font-size: 40px" id="monthlyReportTitle"><strong></strong></span></div>
    <br>

    <div>

        <div align="center" style="margin-top: 50px"><!-- 달력 -->

            <input type="button" value="◀" id="monthPrev" style="border: none; background-color: white;">
            <input type="text" id="monthOutput" readonly="readonly" class="form_month" data-date=""
                   data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM"
                   style="text-align: center;border: none;" placeholder="월 선택" onchange="isChanged()">
            <input type="button" value="▶" id="monthNext" style="border: none; background-color: white;">
        </div>
        <div align="Right" style="margin-right: 60px;">
            <input id="btn_stick" class="btn btn-sm btn-outline-primary active" type="button" name="" value="막대형"
                   onclick="stickGraph()">
            <input id="btn_donut" class="btn btn-sm btn-outline-primary " type="button" name="" value="파이형"
                   onclick="donutGraph()"></div><!-- 형태선택 버튼 -->
        <br>
        <div align="right" class="mt-2 mr-5 pr-2" id="period">
            <input type="text" name="" id="fromDate" readonly="readonly" style="width:100px;" class="form_month"
                   data-date="" data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM"
                   style="text-align: center;" placeholder="월 선택">
            ~<input type="text" name="" id="toDate" readonly="readonly" style="width:100px;" class="form_month"
                    data-date="" data-date-format="yyyy년 MM" data-link-field="dtp_input3" data-link-format="yyyy MM"
                    style="text-align: center;" placeholder="월 선택">
        </div>
        <div align="right" class="mt-2 mr-5 pr-2 dropdown"><input type="button"
                                                                  class="btn btn-sm btn-outline-danger dropdown-toggle"
                                                                  value="기간검색" onclick="periodSearch()"></div>
        <br>
        <div class="ml-5" id="graph1" style="width: 35%; height: 500px; float: left;"></div>
        <div class="mr-5" id="graph2" style="width: 55%; height: 500px; float: right;"></div>
        <div style="clear: both;"></div>
        <div style="width: 1173px;">
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col">날짜</th>
                    <th scope="col">사용내역(태그)</th>
                    <th scope="col">지출내역</th>
                </tr>
                </thead>
                <tbody>
                <%--월별 지출--%>
                <c:set var="januarySpend" value="${monthlySpend.get(0)}"/>
                <c:set var="febuarySpend" value="${monthlySpend.get(1)}"/>
                <c:set var="marchSpend" value="${monthlySpend.get(2)}"/>
                <c:set var="aprilSpend" value="${monthlySpend.get(3)}"/>
                <c:set var="maySpend" value="${monthlySpend.get(4)}"/>
                <c:set var="juneSpend" value="${monthlySpend.get(5)}"/>
                <c:set var="julySpend" value="${monthlySpend.get(6)}"/>
                <c:set var="augustSpend" value="${monthlySpend.get(7)}"/>
                <c:set var="septemberSpend" value="${monthlySpend.get(8)}"/>
                <c:set var="octoberSpend" value="${monthlySpend.get(9)}"/>
                <c:set var="novemberSpend" value="${monthlySpend.get(10)}"/>
                <c:set var="decemberSpend" value="${monthlySpend.get(11)}"/>

                <c:forEach var="tagList" items="${monthlyTagList}" varStatus="index">
                    <tr>
                        <td>${tagList.accountbookRegdate}</td>
                        <td id="name${index.index}">${tagList.tagName}</td>
                        <td id="spend${index.index}">${tagList.totalSpend}원</td>
                    </tr>
                    <c:set var="countIndex" value="${index.count}"/>
                </c:forEach>
                <%--태그 안달린 지출내역 가져오기--%>
                <c:forEach var="nullList" items="${nullList}" varStatus="index">
                    <tr>
                        <td>${nullList.accountbookRegdate}</td>
                        <td id="name${countIndex+index.index}">${nullList.accountbookUsage}</td>
                        <td id="spend${countIndex+index.index}">${nullList.totalSpend}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <br><br>
        <table align="Right" style="margin-right: 60px;">
            <tr>
                <td style="text-align: center;font-size: 30px"><strong>총 지출액 &nbsp;:&nbsp; </strong></td>
                <td style="text-align: center; font-size: 30px">${monthlyTotalSum}원</td>
            </tr>
        </table>
        <br><br><br>

    </div>
    <br>
    <div align="Right" style="margin-right: 60px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
    <br><br>
    <input type="hidden" name="" id="fromMonth" value="${fromMonth}">
    <input type="hidden" name="" id="toMonth" value="${toMonth}">
    <input type="hidden" name="" id="fromYear" value="${fromYear}">
    <input type="hidden" name="" id="toYear" value="${toYear}">

</div>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- 라인 그래프 출력을 위한 파일 include -->
<link class="include" rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.css"/>
<link class="include" rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.css"/>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.js"></script>
<!-- 막대 그래프 출력을 위한 파일 include -->
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.barRenderer.min.js"></script>
<!-- 원형 그래프 출력을 위한 파일 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.pieRenderer.min.js"></script>
<!-- 도넛 그래프 출력을 위한 파일 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.donutRenderer.min.js"></script>
<!-- 그래프 수치 표시를 위한 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.pointLabels.min.js"></script>
<!-- 범례 표시 위한 include -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
<!--  -->
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath }/assets/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<!-- 달력 출력을 위한 include -->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
      media="screen">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/locales/bootstrap-datetimepicker.ko.js"
        charset="UTF-8"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $('.menuTab').removeClass("active");
        $("#btn_report").addClass("active");

        var fromYear = $("#fromYear").val();
        var fromMonth = $("#fromMonth").val();
        var toYear = $("#toYear").val();
        var toMonth = $("#toMonth").val();
        if (fromMonth == toMonth && fromYear == toYear) {
            $("#monthlyReportTitle").html("<strong>" + fromYear + "년 " + fromMonth + "월 보고서</strong>");
            $("#monthOutput").val(fromYear + "년 " + fromMonth + "월");
            $("#fromDate").val(fromYear + "년 " + fromMonth + "월");
            $("#toDate").val(fromYear + "년 " + fromMonth + "월");
        } else {
            $("#monthlyReportTitle").html("<strong>" + fromYear + "년 " + fromMonth + "월 ~ " + toYear + "년 " + toMonth + "월 보고서</strong>");
            $("#monthOutput").val(fromYear + "년 " + fromMonth + "월");
            $("#fromDate").val(fromYear + "년 " + fromMonth + "월");
            $("#toDate").val(toYear + "년 " + toMonth + "월");
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
        $('#monthPrev').on("click", function () {
            var year = $("#fromYear").val();
            var month = $("#fromMonth").val();
            year = Number(year);
            month = Number(month);
            if (month <= 1) {
                month = 12;
                year--;
                location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + year + "/" + month + "/" + year + "/" + month;
            } else {
                month--;
                location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + year + "/" + month + "/" + year + "/" + month;
            }
        });
        $('#monthNext').on("click", function () {
            var year = $("#fromYear").val();
            var month = $("#fromMonth").val();
            year = Number(year);
            month = Number(month);
            if (month >= 12) {
                month = 1;
                year++;
                location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + year + "/" + month + "/" + year + "/" + month;
            } else {
                month++;
                location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + year + "/" + month + "/" + year + "/" + month;
            }
        });
    });


    var fnPrint = function () {
        window.print();
    };
    var isChanged = function () {
        var yearMonth = $("#monthOutput").val();
        var tmp = yearMonth.replace(/[^0-9]/g, '');
        var year = Number(tmp.substr(0, 4));
        var month = Number(tmp.substr(4, 6));
        location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + year + "/" + month + "/" + year + "/" + month;
    };
    var periodSearch = function () {
        var fromDate = $("#fromDate").val();
        var toDate = $("#toDate").val();
        var tmp = fromDate.replace(/[^0-9]/g, '');
        var fromYear = Number(tmp.substr(0, 4));
        var fromMonth = Number(tmp.substr(4, 6));
        var tmp = toDate.replace(/[^0-9]/g, '');
        var toYear = Number(tmp.substr(0, 4));
        var toMonth = Number(tmp.substr(4, 6));
        alert(fromYear + "년" + fromMonth + "월 부터" + toYear + "년" + toMonth + "월 까지 기간검색");
        location.href = "${pageContext.request.contextPath }/monthlyreport/${groupNo}/" + fromYear + "/" + fromMonth + "/" + toYear + "/" + toMonth;
    };

    //시작되면 바로 출력할 막대그래프
    $(function () {
        $.jqplot('graph1', [[['1월', ${januarySpend}], ['2월', ${febuarySpend}], ['3월', ${marchSpend}], ['4월', ${aprilSpend}], ['5월', ${maySpend}], ['6월', ${juneSpend}], ['7월', ${julySpend}], ['8월', ${augustSpend}], ['9월', ${septemberSpend}], ['10월', ${octoberSpend}], ['11월', ${novemberSpend}], ['12월', ${decemberSpend}]]],
            {
                title: '연간 지출',
                animate: true,
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                        , barPadding: 0  //bar padding
                        , barMargin: 0      //bar간 간격
                    }
                }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer
                    },
                    yaxis: {
                        tickOptions: {formatString: "%'d"}
                    }
                }
            });

        var size = ${monthlyTagList.size()};
        var list = new Array();
        var indexNo = 0;
        for (var i = 0; i < size; i++) {
            var name = $("#name" + i).text();
            var spend = $("#spend" + i).text();
            spend = Number(spend.replace(/[^0-9]/g, ''));
            list[i] = [name, spend];
            console.log(list[i]);
            $("#spend" + i).text(Number(spend).toLocaleString('en') + "원");
            indexNo++;
        }
        <%--var size2 = ${nullList.size()};--%>
        <%--for (var i=indexNo-1; i<size2+indexNo-1; i++){--%>
            <%--var name = $("#name" + i).text();--%>
            <%--var spend = $("#spend" + i).text();--%>
            <%--spend = Number(spend.replace(/[^0-9]/g, ''));--%>
            <%--list[i] = [name, spend];--%>
            <%--console.log(list[i]);--%>
            <%--$("#spend" + i).text(Number(spend).toLocaleString('en') + "원");--%>
        <%--}--%>
        var size2 = ${nullList.size()};
        var spendTotal = 0;
        for (var i=indexNo; i<size2+indexNo; i++){
            var name = $("#name" + i).text();
            var spend = $("#spend" + i).text();
            spend = Number(spend.replace(/[^0-9]/g, ''));
            spendTotal += spend;
            console.log(list[i]);
            $("#spend" + i).text(Number(spend).toLocaleString('en') + "원");
        }
        list[indexNo] = ['기타', spendTotal];
        $.jqplot('graph2', [list], {
            title: ${fromMonth}+'월 총 지출',
            animate: true,
            // seriesColors:['#ff0000','#0000ff'],
            series: [{//첫번째 그래프 설정
                renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                    , varyBarColor: true
                    /* 막대 넓이 */
                    , barWidth: 20      //bar width 설정
                    , barPadding: 0  //bar padding
                    , barMargin: 0      //bar간 간격
                }
            }],

            axes: {//축 설정
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer
                },
                yaxis: {
                    tickOptions: {formatString: "%'d"}
                }
            }
        });
    });
    //'막대형'누르면 나오는 그래프
    var stickGraph = function () {
        $('#graph1').children().remove();
        $('#graph2').children().remove();
        $("#btn_stick").addClass('active');
        $("#btn_donut").removeClass('active');
        $.jqplot('graph1', [[['1월', ${januarySpend}], ['2월', ${febuarySpend}], ['3월', ${marchSpend}], ['4월', ${aprilSpend}], ['5월', ${maySpend}], ['6월', ${juneSpend}], ['7월', ${julySpend}], ['8월', ${augustSpend}], ['9월', ${septemberSpend}], ['10월', ${octoberSpend}], ['11월', ${novemberSpend}], ['12월', ${decemberSpend}]]],
            {
                title: '연간 지출',
                animate: true,
                // seriesColors:['#ff0000','#0000ff'],
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                        , barPadding: 0  //bar padding
                        , barMargin: 0      //bar간 간격
                    }
                }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                    },
                    yaxis: {
                        tickOptions: {formatString: "%'d"}
                    }
                }
            });

        var size = ${monthlyTagList.size()};
        var list = new Array();
        for (var i = 0; i < size; i++) {
            var name = $("#name" + i).text();
            var spend = $("#spend" + i).text();
            spend = Number(spend.replace(/[^0-9]/g, ''));
            list[i] = [name, spend];
            console.log(list[i]);
            $("#spend" + i).text(Number(spend).toLocaleString('en') + "원");
        }
        $.jqplot('graph2', [list], {
            title: '6월 총 지출',
            animate: true,
            // seriesColors:['#ff0000','#0000ff'],
            series: [{//첫번째 그래프 설정
                renderer: $.jqplot.BarRenderer//막대그래프로 출력
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
                    , barPadding: 0  //bar padding
                    , barMargin: 0      //bar간 간격
                }
            }],

            axes: {//축 설정
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer
                },
                yaxis: {
                    tickOptions: {formatString: "%'d"}
                }
            }
        });
    };
    //'파이형' 누르면 나오는 그래프
    var donutGraph = function () {
        $('#graph1').children().remove();
        $('#graph2').children().remove();
        $("#btn_donut").addClass('active');
        $("#btn_stick").removeClass('active');
        $.jqplot('graph1', [[['1월', ${januarySpend}], ['2월', ${febuarySpend}], ['3월', ${marchSpend}], ['4월', ${aprilSpend}], ['5월', ${maySpend}], ['6월', ${juneSpend}], ['7월', ${julySpend}], ['8월', ${augustSpend}], ['9월', ${septemberSpend}], ['10월', ${octoberSpend}], ['11월', ${novemberSpend}], ['12월', ${decemberSpend}]]], {
            animate: true, animateReplot: true,
            title: '연간 지출',
            // seriesColors:['#ff0000','#0000ff'],
            legend: {
                renderer: $.jqplot.EnhancedLegendRenderer,//범례 설정
                show: true,//출력유무
                placement: 'inside',//출력위치 설정
                location: 'nw',
                marginTop: '15px'
            },
            seriesDefaults: {
                // make this a donut chart.
                renderer: $.jqplot.DonutRenderer,
                rendererOptions: {
                    // Donut's can be cut into slices like pies.
                    sliceMargin: 3,
                    // Pies and donuts can start at any arbitrary angle.
                    startAngle: -90,
                    showDataLabels: true,
                    // By default, data labels show the percentage of the donut/pie.
                    // You can show the data 'value' or data 'label' instead.
                    dataLabels: 'value',
                    // "totalLabel=true" uses the centre of the donut for the total amount
                    totalLabel: true,
                    animation: {
                        show: true,
                        speed: 1500    //animation 설정 시 속도
                    }
                }
            }
        });
        var size = ${monthlyTagList.size()};
        var list = new Array();
        for (var i = 0; i < size; i++) {
            var name = $("#name" + i).text();
            var spend = $("#spend" + i).text();
            spend = Number(spend.replace(/[^0-9]/g, ''));
            list[i] = [name, spend];
            console.log(list[i]);
            $("#spend" + i).text(Number(spend).toLocaleString('en') + "원");
        }
        $.jqplot('graph2', [list], {
            animate: true, animateReplot: true,
            title: '6월 총 지출',
            // seriesColors:['#ff0000','#0000ff'],
            legend: {
                renderer: $.jqplot.EnhancedLegendRenderer,//범례 설정
                show: true,//출력유무
                placement: 'inside',//출력위치 설정
                location: 'se',
                marginTop: '15px'
            },
            seriesDefaults: {
                // make this a donut chart.
                renderer: $.jqplot.DonutRenderer,
                rendererOptions: {
                    // Donut's can be cut into slices like pies.
                    sliceMargin: 3,
                    // Pies and donuts can start at any arbitrary angle.
                    startAngle: -90,
                    showDataLabels: true,
                    // By default, data labels show the percentage of the donut/pie.
                    // You can show the data 'value' or data 'label' instead.
                    dataLabels: 'value',
                    // "totalLabel=true" uses the centre of the donut for the total amount
                    totalLabel: true,
                    animation: {
                        show: true,
                        speed: 1500    //animation 설정 시 속도
                    }
                }
            }
        });
    };


</script>
</body>
</html>