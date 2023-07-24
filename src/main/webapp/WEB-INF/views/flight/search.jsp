<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>항공권 검색</h2>
							<div class="bar_search_panel">
								<p class="search">왕복</p>
								<p class="search">도시 ${sessionScope.search.departmentNation}
									→ ${sessionScope.search.arrivalNation}</p>
								<p class="search">날짜${sessionScope.search.departmentDate} ~
									${sessionScope.search.arrivalDate}</p>
								<p class="search">인원: ${sessionScope.search.person}명</p>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<p class="search">좌석 등급: 이코노미</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<p class="search">좌석 등급: 비즈니스</p>
									</c:when>
									<c:otherwise>
										<p class="search">좌석 등급: 퍼스트</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container box_1170">
		<div class="section-top-border">

			<c:choose>
				<c:when test="${goListCount eq '0' || comeListCount eq '0'}">
		검색된 항공권이 없습니다.
	</c:when>
				<c:otherwise>
					<form action="<c:url value="/flight/ticket/select"/>" method="get">
						<input type="hidden" name="grade"
							value="${sessionScope.search.grade}"> <input
							type="hidden" name="person" value="${sessionScope.search.person}">
						<input type="hidden" name="requestCount" value="${requestCount}">
						<div style="margin-bottom: 30px;">
							<h3>가는편 항공권: ${goListCount}</h3>
							<div style="margin: 20px 0;">
								<table>
									<thead>
										<tr>
											<th>선택</th>
											<th>항공사 이름</th>
											<th>비행기 기종</th>
											<th>항공사 이미지</th>
											<th>도시</th>
											<th>날짜 및 시간</th>
											<th>비행 시간</th>
											<th>잔여 좌석</th>
											<th>좌석 금액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="flightScheduleToGo"
											items="${flightScheduleToGo}" varStatus="status">
											<tr>
												<td><input type="checkbox" name="scheduleListIdToGo"
													value="${flightScheduleToGo.scheduleId}"
													class="confirm-checkbox"></td>
												<td>${flightScheduleToGo.airlineName}</td>
												<td>${flightScheduleToGo.airplaneTypeName}</td>
												<td>${Airline.image}</td>
												<td>출발: ${flightScheduleToGo.departmentNation}<br>
													도착: ${flightScheduleToGo.arrivalNation}
												</td>
												<td>출발: ${flightScheduleToGo.departmentDate},
													${flightScheduleToGo.departmentTime}<br> 도착:
													${flightScheduleToGo.arrivalDate},
													${flightScheduleToGo.arrivalTime}
												</td>
												<td>${flightScheduleToGo.flightTimeDetail}</td>
												<c:choose>
													<c:when test="${sessionScope.search.grade eq '1'}">
														<td>${flightScheduleToGo.economyClassRemain}석</td>
														<td>${flightScheduleToGo.economyClassFare}원</td>
													</c:when>
													<c:when test="${sessionScope.search.grade eq '2'}">
														<td>${flightScheduleToGo.businessClassRemain}석</td>
														<td>${flightScheduleToGo.businessClassFare}원</td>
													</c:when>
													<c:otherwise>
														<td>${flightScheduleToGo.firstClassRemain}석</td>
														<td>${flightScheduleToGo.firstClassFare}원</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div>
							<h3>오는편 항공권: ${comeListCount}</h3>
							<div style="margin: 20px 0;">
								<table>
									<thead>
										<tr>
											<th>선택</th>
											<th>항공사 이름</th>
											<th>비행기 기종</th>
											<th>항공사 이미지</th>
											<th>도시</th>
											<th>날짜 및 시간</th>
											<th>비행 시간</th>
											<th>잔여 좌석</th>
											<th>좌석 금액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="flightScheduleToCome"
											items="${flightScheduleToCome}" varStatus="status">
											<tr class=>
												<td><input type="checkbox" name="scheduleListIdToCome"
													value="${flightScheduleToCome.scheduleId}"
													class="confirm-checkbox"></td>
												<td>${flightScheduleToCome.airlineName}</td>
												<td>${flightScheduleToCome.airplaneTypeName}</td>
												<td>${flightScheduleToCome.image}</td>
												<td>출발: ${flightScheduleToCome.departmentNation}<br>
													도착: ${flightScheduleToCome.arrivalNation}
												</td>
												<td>출발: ${flightScheduleToCome.departmentDate},
													${flightScheduleToCome.departmentTime}<br> 도착:
													${flightScheduleToCome.arrivalDate},
													${flightScheduleToCome.arrivalTime}
												</td>
												<td>${flightScheduleToCome.flightTimeDetail}</td>
												<c:choose>
													<c:when test="${sessionScope.search.grade eq '1'}">
														<td>${flightScheduleToCome.economyClassRemain}석</td>
														<td>${flightScheduleToCome.economyClassFare}원</td>
													</c:when>
													<c:when test="${sessionScope.search.grade eq '2'}">
														<td>${flightScheduleToCome.businessClassRemain}석</td>
														<td>${flightScheduleToCome.businessClassFare}원</td>
													</c:when>
													<c:otherwise>
														<td>${flightScheduleToCome.firstClassRemain}석</td>
														<td>${flightScheduleToCome.firstClassFare}원</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<p class="serach-btn">
								<c:if test="${goListCount ne '0' || comeListCount ne '0'}">
									<input type="submit" class="genric-btn info radius" value="선택">
								</c:if>
							</p>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />

	<style>
.search {
	color: #a2a2a2;
	font-family: "Open Sans", sans-serif;
	line-height: 28px;
	font-size: 20px;
	font-weight: 400;
}

td {
	font-family: "Open Sans", sans-serif;
	line-height: 28px;
	font-size: 16px;
	font-weight: 400;
	font-size: 14px;
	color: black;
	line-height: 1.4;
	position: relative;
	padding: 15px;
	border-bottom: 1px solid gray;
}

thead {
	background-color: #38a4ff;
	font-size: 18px;
	line-height: 1.2em;
	font-weight: 400;
	color: white;
	height: 100%;
}

th {
	padding: 15px;
	border-bottom: 1px solid gray;
}

table {
	border-bottom: 1px solid #444444;
	border-collapse: collapse;
}

.bar_search_panel {
	display: inline-flex;
}

.search {
	padding: 10px;
}

.serach-btn {
	display: flex;
	flex-direction: row-reverse;
	margin-top: 20px;
}
</style>
</body>
</html>