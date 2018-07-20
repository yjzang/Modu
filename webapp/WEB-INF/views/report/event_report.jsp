<%--
  Created by IntelliJ IDEA.
  User: cnrp
  Date: 2018-06-30
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width", initial-scale="1"> 반응형 -->
    <title>모두의 가계부</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css"> <!-- stylesheet 외부의 css 가져오겟다 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/Modu_sh.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:auto;">


<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>


<div class="container">

    <br><br>
    <div align="center"><span style="font-size: 40px" id="monthlyReportTitle"><strong>6월 모임 보고서</strong></span></div>
    <br>
    <div>


        <div align="Right" style="margin-right: 60px;">
            <input id="btn_stick" class="btn btn-sm btn-outline-primary active" type="button" name="" value="막대형" onclick="stickGraph()">
            <input id="btn_donut" class="btn btn-sm btn-outline-primary " type="button" name="" value="파이형" onclick="donutGraph()"></div><!-- 형태선택 버튼 -->
        <br>
        <div class="ml-5" id="graph1" style="width: 35%; height: 500px; float: left;"></div>
        <div class="mr-5" id="graph2" style="width: 55%; height: 500px; float: right;"></div>
        <div style="clear: both;"></div>
        <div class="mt-5 col-8 mx-auto" style="width: 1173px;">
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col" colspan="3" style="font-size: 20px;">상세 내역</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="row">2018.06.01</td>
                    <td>식비</td>
                    <td>50,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.04</td>
                    <td>숙박비</td>
                    <td>70,000원</td>
                </tr>
                <tr>
                    <td scope="row">2018.06.05</td>
                    <td>간식비</td>
                    <td>20,000원</td>
                </tr>
                </tbody>
            </table>
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col" colspan="3" style="font-size: 20px;">장소, 인원</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="col">장소</th>
                    <th scope="col">인원</th>
                    <th scope="col">1인당 가격</th>
                </tr>
                <tr>
                    <td scope="row">원할매보쌈</td>
                    <td>50명</td>
                    <td>12,000원</td>
                </tr>
                <tr>
                    <td scope="row">송탄부대찌개</td>
                    <td>30명</td>
                    <td>10,000원</td>
                </tr>
                <tr>
                    <td scope="row">아비꼬</td>
                    <td>20명</td>
                    <td>8,000원</td>
                </tr>
                </tbody>
            </table>
            <br>
            <table class="table" style="text-align: center; table-layout: fixed;">
                <thead>
                <tr>
                    <th scope="col" colspan="3" style="font-size: 20px;">찬조금</th>
                </tr>
                </thead>
                <tr>
                    <td scope="row">이상화 선배님</td>
                    <td>50,000원</td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <br>
        </div>
        <div class="col-8" style="float: right;">
            <table class="table" style="text-align: center; table-layout: fixed;font-size: 30px;">
                <thead>
                <tr>
                    <th scope="col" colspan="2" style="font-size: 30px;">총계</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="row">수입</td>
                    <td>50,000원</td>
                </tr>
                <tr>
                    <td scope="row">지출</td>
                    <td>100,000원</td>
                </tr>
                <tr>
                    <td scope="row">소계</td>
                    <td>-50,000원</td>
                </tr>
                <tr></tr>
                </tbody>
            </table>
        </div>
        <div style="clear: both;"></div>
        <br><br><br>

    </div>
    <br>
    <div align="Right" style="margin-right: 60px;">
        <input type="button" name="" value="보고서 출력" onClick="fnPrint()">
    </div>
    <br><br>




</div>
<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>



<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/header.js"></script>
<!-- 라인 그래프 출력을 위한 파일 include -->
<link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.css" />
<link class="include" rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery/jquery.jqplot.min.js"></script>
<!-- 막대 그래프 출력을 위한 파일 include -->
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.barRenderer.min.js"></script>
<!-- 원형 그래프 출력을 위한 파일 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pieRenderer.min.js"></script>
<!-- 도넛 그래프 출력을 위한 파일 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.donutRenderer.min.js"></script>
<!-- 그래프 수치 표시를 위한 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.pointLabels.min.js"></script>
<!-- 범례 표시 위한 include -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.enhancedLegendRenderer.min.js"></script>
<!--  -->
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript">

    $(document).ready(function(){
        $('.menuTab').removeClass("active");
        $("#btn_report").addClass("active");
    });

    var fnPrint = function() {
        window.print();
    };
    $(function() {

        $.jqplot('graph1', [[['6월모임',100000],['연주회',500000],['모임',450000],['노래방',230000],['연습후 뒷풀이',57000],['레슨 뒷풀이',73000],['운동회',25000],['간식비',30000]]],
            {title: '6월 총 지출액',
                animate:true,
                // seriesColors:['#ff0000','#0000ff'],
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
                    , pointLabels: { show: true, stackedValue : true  }//수치 표기
                    ,rendererOptions: {//만들기 옵션
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        ,shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        ,showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        ,varyBarColor: false
                        /* 막대 넓이 */
                        ,barWidth: 20      //bar width 설정
                        ,barPadding: 0  //bar padding
                        ,barMargin: 0      //bar간 간격
                    }
                }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                    },
                    yaxis: {
                        tickOptions:{formatString:"%'d"}
                    }
                }
            });

        $.jqplot('graph2', [[['식당',100000],['교통비',500000],['기타지출',450000],['잡화(비춤)',230000],['여행/MT',57000]]], {
            title: '행사 지출액',
            animate:true,
            // seriesColors:['#ff0000','#0000ff'],
            series: [{//첫번째 그래프 설정
                renderer: $.jqplot.BarRenderer//막대그래프로 출력
                , pointLabels: { show: true, stackedValue : true  }//수치 표기
                ,rendererOptions: {//만들기 옵션
                    animation: {
                        speed: 1500    //animation 설정 시 속도
                    }
                    /* 그림자 */
                    ,shadow: false
                    //shadowDepth: 10, 그림자
                    /* 막대에 관한 라인 */
                    ,showLine: true
                    /* 각각의 막대그래프 램던 색 여부 */
                    ,varyBarColor: false
                    /* 막대 넓이 */
                    ,barWidth: 20      //bar width 설정
                    ,barPadding: 0  //bar padding
                    ,barMargin: 0      //bar간 간격
                }
            }],

            axes: {//축 설정
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                },
                yaxis: {
                    tickOptions:{formatString:"%'d"}
                }
            }
        });
    });
    var stickGraph = function(){
        $('#graph1').children().remove();
        $('#graph2').children().remove();
        $.jqplot('graph1', [[['6월모임',100000],['연주회',500000],['모임',450000],['노래방',230000],['연습후 뒷풀이',57000],['레슨 뒷풀이',73000],['운동회',25000],['간식비',30000]]],
            {title: '6월 총 지출액',
                animate:true,
                // seriesColors:['#ff0000','#0000ff'],
                series: [{//첫번째 그래프 설정
                    renderer: $.jqplot.BarRenderer//막대그래프로 출력
                    , pointLabels: { show: true, stackedValue : true  }//수치 표기
                    ,rendererOptions: {//만들기 옵션
                        animation: {
                            speed: 1500    //animation 설정 시 속도
                        }
                        /* 그림자 */
                        ,shadow: false
                        //shadowDepth: 10, 그림자
                        /* 막대에 관한 라인 */
                        ,showLine: true
                        /* 각각의 막대그래프 램던 색 여부 */
                        ,varyBarColor: false
                        /* 막대 넓이 */
                        ,barWidth: 20      //bar width 설정
                        ,barPadding: 0  //bar padding
                        ,barMargin: 0      //bar간 간격
                    }
                }],

                axes: {//축 설정
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                    },
                    yaxis: {
                        tickOptions:{formatString:"%'d"}
                    }
                }
            });

        $.jqplot('graph2', [[['식당',100000],['교통비',500000],['기타지출',450000],['잡화(비춤)',230000],['여행/MT',57000]]], {
            title: '행사 지출액',
            animate:true,
            // seriesColors:['#ff0000','#0000ff'],
            series: [{//첫번째 그래프 설정
                renderer: $.jqplot.BarRenderer//막대그래프로 출력
                , pointLabels: { show: true, stackedValue : true  }//수치 표기
                ,rendererOptions: {//만들기 옵션
                    animation: {
                        speed: 1500    //animation 설정 시 속도
                    }
                    /* 그림자 */
                    ,shadow: false
                    //shadowDepth: 10, 그림자
                    /* 막대에 관한 라인 */
                    ,showLine: true
                    /* 각각의 막대그래프 램던 색 여부 */
                    ,varyBarColor: false
                    /* 막대 넓이 */
                    ,barWidth: 20      //bar width 설정
                    ,barPadding: 0  //bar padding
                    ,barMargin: 0      //bar간 간격
                }
            }],

            axes: {//축 설정
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                },
                yaxis: {
                    tickOptions:{formatString:"%'d"}
                }
            }
        });
    };
    var donutGraph = function(){
        $('#graph1').children().remove();
        $('#graph2').children().remove();
        $("#btn_donut").addClass('active');
        $("#btn_stick").removeClass('active');
        $.jqplot('graph1', [[['6월모임',100000],['연주회',500000],['모임',450000],['노래방',230000],['연습후 뒷풀이',57000],['레슨 뒷풀이',73000],['운동회',25000],['간식비',30000]]], {
            animate: true, animateReplot: true,
            title:'연간 지출',
            // seriesColors:['#ff0000','#0000ff'],
            legend:{
                renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                show:true,//출력유무
                placement:'inside',//출력위치 설정
                location:'nw',
                marginTop:'15px'
            },
            seriesDefaults: {
                // make this a donut chart.
                renderer:$.jqplot.DonutRenderer,
                rendererOptions:{
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
                        show:true,
                        speed: 1500    //animation 설정 시 속도
                    }
                }
            }
        });
        $.jqplot('graph2', [[['식당',100000],['교통비',500000],['기타지출',450000],['잡화(비춤)',230000],['여행/MT',57000]]], {
            animate: true, animateReplot: true,
            title:'6월 총 지출',
            // seriesColors:['#ff0000','#0000ff'],
            legend:{
                renderer:$.jqplot.EnhancedLegendRenderer,//범례 설정
                show:true,//출력유무
                placement:'inside',//출력위치 설정
                location:'se',
                marginTop:'15px'
            },
            seriesDefaults: {
                // make this a donut chart.
                renderer:$.jqplot.DonutRenderer,
                rendererOptions:{
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
                        show:true,
                        speed: 1500    //animation 설정 시 속도
                    }
                }
            }
        });
    };

</script>
</body>
</html>