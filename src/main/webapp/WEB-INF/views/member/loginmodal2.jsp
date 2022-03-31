<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="" />
<!-- Modal Header 시작 -->
<div class="modal-header p-5 pb-4 border-bottom-0">
  <h2 class="fw-bold mb-0">Login</h2>
  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<!-- Modal Header 종료 -->
<!-- Modal body 시작 -->
<div class="modal-body p-5 pt-0">
  <form action="${pageContext.request.contextPath }/member/loginPro" method="post">
    <div class="form-floating mb-3">
      <input type="email" class="form-control rounded-4" name="email" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating mb-3">
      <input type="password" class="form-control rounded-4" name="pass" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">Login</button>
    <small class="text-muted">By clicking Login</small>
    <hr class="my-4">
    <h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
    <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" type="submit">
      <svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"/></svg>
      Login with Twitter
    </button>
    <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="submit">
      <svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"/></svg>
      Login with Facebook
    </button>
    <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4" type="submit">
      <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"/></svg>
      Login with GitHub
    </button>
  </form>
</div>
<!-- Modal body 종료 -->
<!-- Modal footer 시작 -->
<div class="modal-footer">
</div>
<!-- Modal footer 종료 -->