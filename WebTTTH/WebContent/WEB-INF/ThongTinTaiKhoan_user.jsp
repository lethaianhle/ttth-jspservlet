<%@page import="Bean.LichKhaiGiang"%>
<%@page import="DAO.LichKhaiGiangDAO"%>
<%@page import="Bean.user" %>
<%@page import="Bean.Account" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Thông tin tài khoản User</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--bootstrap & Jquery-->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!--Icon fa-->
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--CSS-->
	<link rel="stylesheet" type="text/css" href="css/mycssHome.css"/>
	<link rel="stylesheet" type="text/css" href="css/mycssHomeUser.css"/>
	<link rel="stylesheet" type="text/css" href="css/mycssInfoTaiKhoanTeacher.css"/>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<script language="javascript" src="js/myjsHome.js"></script>
	<!--Chặn download ảnh-->
	<link rel="stylesheet" href="css/demo.css" type="text/css" media="screen" title="no title" charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/flux.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/myjsInfoTaiKhoanTeacher.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	(function () {
		var thongbao = document.getElementById('message').value; //lấy thông báo
	    if(thongbao != ""){
	        alert(thongbao);
	    } 
	   
	})();
</script> 
</head>
<body>
	
	<!--
			==============================Hearder====================================
	-->
	<div class="container">
		<div class="topbar">
			<div id="menu">
				<ul>
					<%Account acc=(Account)session.getAttribute("account");
					if(session.getAttribute("account")!=null)
						{ 
						int account_id;
						account_id=acc.getAccount_id();    
						%>
					<li class="dropdown">
    					<button class="btn btn_account dropdown-toggle" type="button" data-toggle="dropdown">
    						<img src="<%= acc.getAvatar() %>" class="img_avatar img-responsive" alt="Cinque Terre"/>
    						<span  class="dropbtn"><%=acc.getName() %></span>
					    	<span class="caret"></span>
						</button>
					    <ul class="dropdown-menu">
					      <li ><a href="ThongTinTaiKhoan?roleID=${account.role_id}">Thông tin tài khoản</a></li>
					      <li><a href="logout">Đăng xuất</a></li>
					    </ul>
					</li>		
					<%}else{ %>					
					<li class="dropdown">
						<span  class="dropbtn">TÀI KHOẢN</span>
						<div class="dropdown-content">
						    <a href="login">Đăng nhập</a>
						    <a href="Register_account">Đăng ký</a>
						</div>
					</li>			
					<%} %>								
					<li class="sdt"><span class="glyphicon glyphicon-earphone"></span>(+84)98777777 </li>
					<li class="gmail"><span class="	glyphicon glyphicon-envelope"></span>ITCENTER2017@GMAIL.COM</li>
				</ul>
			</div>
		</div>
		<header id="header">
			<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="30">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href="TrangChu">
							<img style="width: 220px;padding-top: 10px;" src="images/TC.png" />
						</a>
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
						</button>
					</div>
					
					<div class="collapse navbar-collapse" >
						<ul class="nav navbar-nav navbar-right">  
							<li class="active"><a href="TrangChu">TRANG CHỦ</a></li>     
							<li class="dropdown">
								<a href="Course" class="dropdown-toggle" data-toggle="dropdown">KHÓA HỌC<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="Course">Các khóa học</a></li>
									<li><a href="LichKhaiGiang">Lịch khai giảng</a></li>          
								</ul>
							</li>
							<li >
								<a href="News">TIN TỨC</a>
								
							</li> 
							<%if(session.getAttribute("account")!=null)
							{%>
							<li>
								<a href="user_thaoluan">THẢO LUẬN</a>
							</li> 
							<%}else{ %>	
							<li>
								<a href="thaoluan">THẢO LUẬN</a>
							</li> 
							<%} %>	
							<li><a href="Contact">LIÊN HỆ</a></li>
							<li class="dropdown">
								<a ><span class="glyphicon glyphicon-search"></span></a>
								<ul class="dropdown-menu">
									<li>
										<input type="text" id="timkiem" placeholder="Tìm kiếm">
									</li>
								</ul>
							</li>
						</ul>
						
					</div>
				</div><!--end container-->
			</nav><!--end nav-->
		</header><!--end header-->
	</div>
	<!--
		==============================content===================================
	-->
	<div class="header-page">
		<div class="header-content">
			<h1 style="text-align: right; padding-right: 0px;">Trang học viên</h1>		
		</div>
	</div>

	<div class="container">
		<div class="row Info_Content">
			<div class="col-md-3 Info_Content_Menu">
				<div class="Menu_Image">
					<img src="<%=acc.getAvatar() %>" class="img-circle img-responsive Menu_Image_1" />
				</div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs nav-vertical-tabs Menu_ContentMain" role="tablist">
				    <li role="presentation" class="active"><a href="#home-Vertical" data-toggle="tab" aria-expanded="false"><i class="fa fa-address-card-o" aria-hidden="true"></i> THÔNG TIN CÁ NHÂN</a></li>
				    <li role="presentation" class=""><a href="#profile-Vertical" data-toggle="tab" aria-expanded="false"><i class="fa fa-cog" aria-hidden="true"></i> THAY ĐỔI THÔNG TIN</a></li>
				    <li role="presentation" class=""><a href="#messages-Vertical" data-toggle="tab" aria-expanded="false"><i class="fa fa-lock" aria-hidden="true"></i> ĐỔI MẬT KHẨU</a></li>
				    <li role="presentation" class=""><a href="#settings-Vertical" data-toggle="tab" aria-expanded="true"><i class="fa fa-suitcase" aria-hidden="true"></i> KHÓA HỌC CỦA BẠN</a></li>
				</ul>

			</div>
			<div class="col-md-9 Info_Content_text">
				<!-- Tab panes -->
				<div class="tab-content vertical-content ">
		<!-- THÔNG TIN CÁ NHÂN -->
				    <div role="tabpanel" class="tab-pane fade active in Info_Content_text1" id="home-Vertical">
				    <form class="form-horizontal" id="form_validation" method="POST" novalidate="novalidate" action="UploadAvatar?IDupload=<%=acc.getAccount_id() %>" enctype="multipart/form-data">
				        <div class="row">
							<div class="col-md-8 Text1_info">
								<table class="table_text1">
								  <tr >
							        <td colspan="2"><h4 class="tieude_text1" >THÔNG TIN CÁ NHÂN</h4></td>
							      </tr>
							      <tr>
							        <td>Họ và Tên:</td>
							        <td><%=acc.getName() %></td>
					
							      </tr>
							      <tr>
							        <td>Ngày sinh:</td>
							        <td><%=acc.getBirthday() %></td>
							      </tr>
							      <tr>
							        <td>Giới Tính:</td>
							        <td><%=acc.getSex() %></td>
							      </tr>
							      <tr>
							        <td>Email:</td>
							        <td><%=acc.getMail() %></td>
							      </tr>
							      <tr>
							        <td>SDT:</td>
							        <td><%=acc.getPhonenumber() %></td>
							      </tr>
								</table>
							</div>
							<div class="col-md-4 Text2_info">
								<div class="img_text2_2">Avatar:</div>
								<div>
									<img src="<%=acc.getAvatar() %>" class="img-thumbnail img_text2_1" alt="Cinque Terre">
								</div>
								 <div class="modal-body">
	                             Thay đổi Avatar:
						            <input type="file" name="uploadFile" />
						            <br/><br/>
									<input type="submit" value="Upload" />
						            </div>
								
							</div>
						</div>
						</form>
				    </div>
		<!-- THAY ĐỔI THÔNG TIN -->
				    <div role="tabpanel" class="tab-pane fade Info_Content_text2" id="profile-Vertical">
				        <div class="card-inner">
					        <h4 class="tieude_text1">CHỈNH SỬA THÔNG TIN CÁ NHÂN</h4>
					        
					        <div class="demo">
					            <form class="form-horizontal" id="form_validation" method="Get" novalidate="novalidate" action="Update_Teacher">
					                <div class="row">
					                    <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
					                        <label>Họ và tên:</label>
					                    </div>
					                    <div class="col-md-9 col-xs-8 col-xs-8">
					                        <div class="form-group focused">
					                            <input type="text" class="form-control" name="name" value="<%=acc.getName() %>" required="" aria-required="true" aria-invalid="true">
					                        <label id="name-error" class="error" for="name">Vui lòng điền họ và tên của bạn vào</label></div>
					                    </div>
					                </div>
					                <div class="row m-t-10">
					                    <div class="col-md-3 col-xs-4 form-control-label">
					                        <label>Ngày Sinh:</label>
					                    </div>
					                    <div class="col-md-9 col-xs-8">
					                        <div class="form-group focused">
					                            <input type="date" value="<%=acc.getBirthday() %>" name="birthday"class="form-control">
					                            <label id="date-error" class="error" for="date">Vui lòng điền Ngày Sinh của bạn vào</label>
					                        </div>
					                    </div>
					                </div>
			                   		   
					                <div class="row m-t-10">
					                	<div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
					                        <label>Thay đổi: </label>
					                    </div>
					                    <div class="col-md-9 col-xs-8 col-xs-8">
					                        <div class="form-group">
					                        <%if(acc.getSex().trim().toLowerCase()!="nữ"){ %>
					                        	<input type="radio" name="gender" id="male_1" value="Nam" class="with-gap" checked>
					                            <label for="male_1">Nam</label>
					                            <input type="radio" name="gender" id="female_1" value="Nữ" class="with-gap" >
					                            <label for="female_1" class="m-l-20">Nữ</label>
					                         <%}else { %>
					                         	<input type="radio" name="gender" id="male_1" value="Nam" class="with-gap" >
					                            <label for="male_1">Nam</label>
					                            <input type="radio" name="gender" id="female_1" value="Nữ" class="with-gap" checked>
					                            <label for="female_1" class="m-l-20">Nữ</label>
					                            <%} %>
					                        <label id="gender-error" class="error" for="gender">Vui lòng chọn 1 trong 2</label></div>
					                    </div>
					                </div>
					                <div class="row m-t-10">
					                    <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
					                        <label>Email:</label>
					                    </div>
					                    <div class="col-md-9 col-xs-8 col-xs-8">
					                        <div class="form-group">
					                            <input type="email" class="form-control" name="mail" value="<%=acc.getMail() %>" required="" aria-required="true">
					                            <label id="email-error" class="error" for="email">Vui lòng điền Email của bạn vào</label>
					                        </div>
					                    </div>
					                </div>
					                <div class="row m-t-10">
					                    <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
					                        <label>SĐT:</label>
					                    </div>
					                    <div class="col-md-9 col-xs-8 col-xs-8">
					                        <div class="form-group">
					                            <input type="text" class="form-control" name="sdt" value="<%=acc.getPhonenumber() %>" required="" aria-required="true">
					                            <label id="sdt-error" class="error" for="sdt">Vui lòng điền SĐT của bạn vào</label>
					                        </div>
					                    </div>
					                </div>
					                 
					                <button class="btn btn-primary form_submit1" type="submit">SUBMIT</button>
					            </form>
					        </div>
				    
					    </div>
				    </div>
				     
		<!-- ĐỔI MẬT KHẨU -->
				    <div role="tabpanel" class="tab-pane fade Info_Content_text3" id="messages-Vertical">
				        <div class="form_InfoMain">
							<div>
							    <h3 class="tieude_text1">
							        THAY ĐỔI MẬT KHẨU
							    </h3>
								<div id="pthongbao">
									<p id="pthongbao">
							    </p>
						    </div>
						    </div>
						    <form name="frmDoiMK" action="Update_Password" method="post">
						        <div class="row">
						            <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
						                <label>Tên Tài Khoản:</label>
						            </div>
						            <div class="col-md-9 col-xs-8 col-xs-8">
						                <div class="form-group">
						                    <input type="text" id="TenTK" class="form-control" value="<%=acc.getName() %>">
						                </div>
						            </div>
						            <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
						                <label>Mật Khẩu Cũ:</label>
						            </div>
						            <div class="col-md-9 col-xs-8 col-xs-8">
						                <div class="form-group">
						                    <input type="password" id="MKCu" name="MKCu" class="form-control" placeholder="Pass Old">
						                </div>
						            </div>
						            <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
						                <label>Mật Khẩu Mới:</label>
						            </div>
						            <div class="col-md-9 col-xs-8 col-xs-8">
						                <div class="form-group">
						                    <input type="password" id="MKCap1" class="form-control" placeholder="Name or Email New">
						                </div>
						            </div>
						            <div class="col-md-3 col-xs-4 col-xs-4 form-control-label">
						                <label>Nhập Lại Mật Khẩu Mới:</label>
						            </div>
						            <div class="col-md-9 col-xs-8 col-xs-8">
						                <div class="form-group">
						                    <input type="password" id="MKCap2" name="MKCap2" class="form-control" placeholder="Again Name or Email New">
						                </div>
						            </div>
						        </div>
						        <button class="form_submit1" type="submit">Submit</button>	
						    </form>
						</div>
				    </div>
		<!-- KHÓA HỌC CỦA BẠN -->
		
				    <div role="tabpanel" class="tab-pane fade Info_Content_text4" id="settings-Vertical">
				        <h4 class="tieude_text1 tieude_text_course">THÔNG TIN KHÓA HỌC CỦA BẠN</h4>
				              
					<div class="body">
					
					<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/web_ttth"
                           user="root"  password="123456"/>
 
				       <sql:query dataSource="${dbsource}" var="result">
				           select *
									from class,(select class_id
									from student_class	
									where account_id=<%=acc.getAccount_id() %>)as A
									where class.class_id=A.class_id ;
				       </sql:query>
					
					
				        <div class="table-header">
				        	<div class="pull-left">
				        		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a CourseName">
				        	</div>
				    	</div>
				        <table class="table table-hover" id="myTable">
				            <thead>
				            <tr style="cursor: pointer;" class="header">
				                <th><span class="sort-element" onclick="sortTable(0)">Tên Lớp Học</span></th>
				                <th><span class="sort-element" onclick="sortTable(1)">Tên Khóa Học</span></th>
				                <th><span class="sort-element">Ngày Bắt Đầu</span></th>
				                <th><span class="sort-element">Ngày Kết Thúc</span></th>
				                <th><span class="sort-element">Lịch Học</span></th>
				                <th><span class="sort-element">Tùy Chỉnh</span></th>
				            </tr>
				            </thead>
				            <tbody>
				            <c:forEach var="row" items="${result.rows}">
				            <tr style="display: table-row; cursor: pointer;">
				                <td data-field="#ID">${row.classname}</td>
				                 <sql:query dataSource="${dbsource}" var="result">
				          			select *
									from course
									where course_id=${row.course_id} ;
				 			      </sql:query>
				                
				                <c:forEach var="row1" items="${result.rows}">
				                <td data-field="name">${row1.coursename}</td>
				                </c:forEach>
				                <td data-field="date">${row.startday}</td>
				                <td data-field="date">${row.endday}</td>
				                <td data-field="status">${row.timestudy}</td>
				                 <sql:query dataSource="${dbsource}" var="result">
				          			select *
									from student_class
									where class_id=${row.class_id} and account_id=<%=acc.getAccount_id() %> ;
				      			 </sql:query>
				                
				                <c:forEach var="row2" items="${result.rows}">
				               
				                <td>
				              		<a class="button button-small list"  href="DeleteStudentClass?sc_id=${row2.sc_id}" title="Edit">
				                        <button>Hủy đăng kí </button>
					                </a>
				                </td>
				                </c:forEach>
				            </tr>
				            </c:forEach>
				            </tbody>
				        </table>
				        
				    </div>
				</div>
			</div>
		</div>
	</div>
	<!--
	==========================Footer================
	-->
	<div class="footer-wrapper">
		<div id="footer" class="footer-1">
			<div class="footer-main">
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<a href="#">
								<img alt class="logo_footer" src="images/TC.png">
							</a>
						</div>
						<div class="col-md-4">
							<div id="footerlst" class="widget">
								<h3 class="titlefooter">Navigation</h3>
								<div class="textwidget">
									<div class="row">
										<div class="col-md-6" style="padding-top: 17px;">
											<ul class="">
												<li><a class="non-textdecoration lstfooter" href="#">Trang chủ</a></li>
												<li style="padding-top: 15px;"><a class="non-textdecoration lstfooter" href="#">Khóa học</a></li>
												<li style="padding-top: 15px;"><a class="non-textdecoration lstfooter" href="#">Khai giảng</a></li>
											</ul>
										</div>
										<div class="col-md-6" style="padding-top: 17px;">
											<ul class="">
												<li><a class="non-textdecoration lstfooter" href="#">Thảo luận</a></li>
												<li style="padding-top: 15px;"><a class="non-textdecoration lstfooter" href="">Tin tức</a></li>
												<li style="padding-top: 15px;"><a class="non-textdecoration lstfooter" href="">Liên hệ</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div id="footerlst" class="widget2">
								<h3 class="titlefooter">Contact</h3>
									<div  style="padding-top: 17px;">
										<ul class="textwidget">
											<li style="font-size: 14px;"><i class="fa fa-map-marker" style="font-size:20px;color:#080707;"></i>&nbsp;&nbsp;Số 12, Trần Thái Tông, Thanh Xuân, Hà Nội</li>
											<li style="font-size: 14px;padding-top: 15px;"><i class="fa fa-phone" style="font-size:20px;color:#080707;"></i>&nbsp;&nbsp;(+84)1869123456</li>
											<li style="font-size: 14px;padding-top: 15px;"><i class="fa fa-envelope" style="font-size:20px;color:#080707;"></i>&nbsp;&nbsp;<a class="non-textdecoration lstfooter" href="#">itcenter2021@gmail.com</a></li>
										</ul>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<div class="footer-center">
						© Copyright 2021. All Rights Reserved</br>Powered and Designed by Nhóm 6 - CNPM
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--nút quay về đầu trang-->
	<div class="btn-top" >
		<a href="javascript:void(0);" title="Top" style="display: inline;">
			
			<i class="glyphicon glyphiconc glyphicon-chevron-up"></i>
		</a>
	</div>
</body>
</html>