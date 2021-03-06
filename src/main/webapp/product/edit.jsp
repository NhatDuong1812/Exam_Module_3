<%--
  Created by IntelliJ IDEA.
  User: Duong1812
  Date: 15/1/2021
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="title" scope="request" value="Edit Product"/>
<jsp:include page="../inc/header.jsp"></jsp:include>
<div class="container">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold">${title}</h6>
        </div>
        <form action="${pageContext.request.contextPath}/admin/products" method="post">

            <div class="card-body">
                <c:if test="${sessionScope['msg'] != null}">
                    <%=session.getAttribute("msg")%>
                    <%session.removeAttribute("msg");%>
                </c:if>
                <input type="hidden" name="act" value="update">
                <input type="hidden" name="id" value="${requestScope['product'].getId()}">
                <fieldset>
                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label text-md-right">Name <span
                                class="text-danger">*</span>:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="name" id="name"
                                   placeholder="Enter name" value="${requestScope['product'].getName()}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="price" class="col-md-2 col-form-label text-md-right">Price <span
                                class="text-danger">*</span>:</label>
                        <div class="col-md-10">
                            <input type="number" class="form-control" name="price" id="price"
                                   placeholder="Enter price" value="${requestScope['product'].getPrice()}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="qty" class="col-md-2 col-form-label text-md-right">Quantity <span
                                class="text-danger">*</span>:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="qty" id="qty"
                                   placeholder="Enter quantity" value="${requestScope['product'].getQty()}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="color" class="col-md-2 col-form-label text-md-right">Color <span
                                class="text-danger">*</span>:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="color" id="color"
                                   placeholder="Enter color" value="${requestScope['product'].getColor()}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="desc" class="col-md-2 col-form-label text-md-right">Description</label>
                        <div class="col-md-10">
                            <textarea name="desc" id="desc" cols="15" rows="5"
                                      class="form-control">${requestScope['product'].getDesc()}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="category" class="col-md-2 col-form-label text-md-right">Categories</label>
                        <div class="col-md-10">

                            <select name="category" id="category" class="form-control" required>
                                <c:if test="${requestScope['categories'] != null}">
                                    <c:forEach items="${requestScope['categories']}" var="category">
                                        <option value="${category.getId()}"
                                                <c:if test="${requestScope['product'].getCategoryId() == category.getId()}">selected</c:if>>${category.getName()}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                </fieldset>
            </div><!-- /.card-body-->
            <div class="card-footer">
                <div class="col-md-6 offset-md-4">
                    <button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top"
                            title="Save"><i class="fas fa-save"></i> Update
                    </button>  |
                    <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-secondary"
                       data-toggle="tooltip" data-placement="top" title="Cancel"><i class="fa fa-arrow-circle-left"></i></i> Back</a>
                </div>
            </div>
        </form>
    </div><!-- /.card -->
</div>
<!-- /.container-fluid -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
