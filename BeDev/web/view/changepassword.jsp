<%-- 
    Document   : changepassword
    Created on : May 21, 2022, 10:04:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Change password</title>
        <link rel="stylesheet" href="../BeDev/view/dist/main.css" />
        <link rel="icon" type="image/png" href="../BeDev/view/dist/images/favicon/favicon.png" />
    </head>
    <body onload="loader()" >
          <jsp:include page="header.jsp"></jsp:include>
    <div class="white-bg mt-4 container">
              <div class="students-info-form">
                  <h6 class="font-title--card">Change Password</h6>
                  <form  action="ChangePassword" method="post">
                      <div class="row">
                          <div class="col-12">
                              <label for="cpass">Current Password</label>
                              <div class="input-with-icon">
                                  <input name="curPass" type="password" id="cpass" class="form-control" placeholder="Enter Password" />
                                  <div class="input-icon" onclick="showPassword('cpass', this)">
                                      <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="24"
                                          height="24"
                                          viewBox="0 0 24 24"
                                          fill="none"
                                          stroke="currentColor"
                                          stroke-width="2"
                                          stroke-linecap="round"
                                          stroke-linejoin="round"
                                          class="feather feather-eye"
                                          >
                                      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                      <circle cx="12" cy="12" r="3"></circle>
                                      </svg>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-12">
                              <label for="npass">New Password</label>
                              <div class="input-with-icon">
                                  <input name="newPass" type="password" id="npass" class="form-control" placeholder="Enter new password" />
                                  <div class="input-icon" onclick="showPassword('npass', this)">
                                      <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="24"
                                          height="24"
                                          viewBox="0 0 24 24"
                                          fill="none"
                                          stroke="currentColor"
                                          stroke-width="2"
                                          stroke-linecap="round"
                                          stroke-linejoin="round"
                                          class="feather feather-eye"
                                          >
                                      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                      <circle cx="12" cy="12" r="3"></circle>
                                      </svg>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-12">
                              <label for="cnpass">Confirm New Password</label>
                              <div class="input-with-icon">
                                  <input name="confirmNewPass" type="password" id="cnpass" class="form-control" placeholder="Enter Password" />
                                  <div class="input-icon" onclick="showPassword('cnpass', this)">
                                      <svg
                                          xmlns="http://www.w3.org/2000/svg"
                                          width="24"
                                          height="24"
                                          viewBox="0 0 24 24"
                                          fill="none"
                                          stroke="currentColor"
                                          stroke-width="2"
                                          stroke-linecap="round"
                                          stroke-linejoin="round"
                                          class="feather feather-eye"
                                          >
                                      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                      <circle cx="12" cy="12" r="3"></circle>
                                      </svg>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div style="color: red">
                          ${mess}
                      </div>
                      <div class="d-flex justify-content-lg-end justify-content-center mt-2">
                          <button class="button button-lg button--primary" type="submit">Save Changes</button>
                      </div>
                  </form>
              </div>
          </div>
          <<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
