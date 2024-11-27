<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<a href = "${pageContext.request.contextPath}/admin/category/add"> Add Category</a>

<table border="1" width=100%>
	<tr>
		<th>STT</th>
		<th>Images</th>
		<th>CategoryId</th>
		<th>CategoryCode</th>
		<th>CategoryName</th>
		<th>Status</th>
		<th>Action</th>
	</tr>

	<c:forEach items="${listcate}" var="cate" varStatus="STT">
		<tr>
			<td>${STT.index+1 }</td>
			
			<td>
			
				<c:if test="${cate.images.substring(0,5) != 'https' }">
					<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
					
				</c:if> 
				<c:if test="${cate.images.substring(0,5) == 'https' }">
					<c:url value="${cate.images}" var="imgUrl"></c:url>
				</c:if> 
					<img height="150" width="200" src="${imgUrl}" />
			
			</td>
			<td>${cate.categoryId }</td>
			<td>${cate.categoryCode }</td>
			<td>${cate.categoryName }</td>
			<td>
				<c:if test="${cate.status == 1}">
					<span>Hoạt động</span>
				</c:if>
				<c:if test="${cate.status != 1}">
					<span>Khoá</span>
				</c:if>
			
			</td>
			<td>
				<a href="<c:url value='/admin/category/edit?id=${cate.categoryId }'/>"	class="center"> Sửa</a> |
				<a href="<c:url value='/admin/category/delete?id=${cate.categoryId }'/>" class="center">Xóa</a> 
			</td>
		</tr>
	</c:forEach>

</table>

<!-- Hiển thị phân trang -->
<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="<c:url value='/admin/categories?page=${currentPage - 1}'/>">Previous</a>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="page">
        <a href="<c:url value='/admin/categories?page=${page}'/>">${page}</a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="<c:url value='/admin/categories?page=${currentPage + 1}'/>">Next</a>
    </c:if>
</div>