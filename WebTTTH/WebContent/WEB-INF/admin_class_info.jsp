<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Admin Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    <script type="text/javascript">
		function Pager(tableName, itemsPerPage) {
			this.tableName = tableName;
			this.itemsPerPage = itemsPerPage;
			this.currentPage = 1;
			this.pages = 0;
			this.inited = false;
			this.showRecords = function(from, to) {
				var rows = document.getElementById(tableName).rows;
				// i starts from 1 to skip table header row
				for (var i = 1; i < rows.length; i++) {
					if (i < from || i > to)
						rows[i].style.display = 'none';
					else
					rows[i].style.display = '';
				}	
			}
			this.showPage = function(pageNumber) {
				if (! this.inited) {
					alert("not inited");
					return;
				}
				var oldPageAnchor = document.getElementById('pg'+this.currentPage);
				oldPageAnchor.className = 'btn btn-sm btn-icon';
				this.currentPage = pageNumber;
				var newPageAnchor = document.getElementById('pg'+this.currentPage);
				newPageAnchor.className = 'btn btn-info btn-fill';
				var from = (pageNumber - 1) * itemsPerPage + 1;
				var to = from + itemsPerPage - 1;
				this.showRecords(from, to);
			}
			this.prev = function() {
				if (this.currentPage > 1)
					this.showPage(this.currentPage - 1);
			}
			this.next = function() {
				if (this.currentPage < this.pages) {
					this.showPage(this.currentPage + 1);
				}
			}
			this.init = function() {
				var rows = document.getElementById(tableName).rows;
				var records = (rows.length - 1);
				this.pages = Math.ceil(records / itemsPerPage);
				this.inited = true;
			}
			this.showPageNav = function(pagerName, positionId) {
				if (! this.inited) {
				alert("not inited");
				return;
				}
				var element = document.getElementById(positionId);
				var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="btn btn-sm btn-icon"> ?? Prev </span> ';
				for (var page = 1; page <= this.pages; page++)
				pagerHtml += '<span id="pg' + page + '" class="btn btn-sm btn-icon" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';
				pagerHtml += '<span onclick="'+pagerName+'.next();" class="btn btn-sm btn-icon"> Next ??</span>';
				element.innerHTML = pagerHtml;
			}
		}
	</script>
	<!-- X??c nh???n x??a -->
    <script type="text/javascript">
            function getConfirmation(){
            	var comfirmBox;
        		comfirmBox = confirm("B???n c?? ch???c ch???n mu???n x??a gi???ng vi??n n??y ra kh???i l???p?");
        		if (comfirmBox == true) {
        			return true;
        		} else {
        			return false;
        		}
            }
     </script>
     <script type="text/javascript">
            function getConfirmation2(){
            	var comfirmBox;
        		comfirmBox = confirm("X??c nh???n th??m gi???ng vi??n?");
        		if (comfirmBox == true) {
        			return true;
        		} else {
        			return false;
        		}
            }
     </script>
</head>
<body>
<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="viewProfileAdmin" class="simple-text">
                    ITCENTER
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="viewProfileAdmin">
                        <i class="ti-user"></i>
                        <p>Th??ng tin c?? nh??n</p>
                    </a>
                </li>
                <li>
                    <a href="courseAdmin">
                        <i class="ti-book"></i>
                        <p>Qu???n l?? kh??a h???c</p>
                    </a>
                </li>
                <li class="active">
                    <a href="classAdmin">
                        <i class="ti-pin-alt"></i>
                        <p>Qu???n l?? l???p h???c</p>
                    </a>
                </li>
                <li>
                    <a href="accountAdmin">
                        <i class="ti-face-smile"></i>
                        <p>Qu???n l?? t??i kho???n</p>
                    </a>
                </li>
                <li>
                    <a href="newsAdmin">
                        <i class="ti-write"></i>
                        <p>Qu???n l?? tin t???c</p>
                    </a>
                </li>
                <li>
                    <a href="forumAdmin">
                        <i class="ti-world"></i>
                        <p>Qu???n l?? di???n ????n</p>
                    </a>
                </li>
                <li class="active-pro">
                    <a href="TrangChu">
                        <i class="ti-home"></i>
                        <p>Xem trang ch???</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Qu???n l?? l???p h???c</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="${adminAvatar}" class="img_avatar img-responsive" alt="Cinque Terre"/>
                                    <p>&nbsp;${adminName}&nbsp;</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="logout">????ng xu???t</a></li>
                                
                              </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
            	<div class="row">
               		<div class="btn-group" style=" padding-bottom: 15px;padding-left: 20px;">
                           <a href="classAdmin" type="button" class="btn btn-default">
                             <i class="ti-arrow-left"></i>&nbsp;&nbsp;Quay L???i
                           </a>
                    </div>
               	</div>
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                    	 <div class="card">
                            <div class="header" style="float: left;">
                                <h4 class="title">Gi???ng vi??n c???a l???p</h4>
                                <p class="category"></p>
                            </div>
                            
                            <div class="clearfix"></div>
                            <div class="content table-responsive table-full-width">
                            	<table class="table table-striped">
                            		<thead>
	                                        <th>T??n GV</th>
	                                        <th>Email</th>
	                                        <th>&nbsp;</th>
	                                    </thead>
                            		<tbody>
                                    	<c:forEach items="${listTeacher}" var="listTeacher">
                                    		<tr>
                                    			
	                                            <td>${listTeacher.name}</td>
	                                            <td>${listTeacher.mail}</td>
	                                            <td><a href="deleteTeacher_Class?tc_id=${listTeacher.tc_id}&classID=${classInfo.class_id}" onclick="return getConfirmation();"
	                                            style="font-size: 16px; color: #d45f31; padding-left: 30px;" class="ti-trash"></a></td>
                                        	</tr>
                                    	</c:forEach>
                                    </tbody>
                            	</table>
                            	<div style="text-align: center;">
                                    <a href="#" data-toggle="modal" data-target="#addTeacher" type="submit" class="btn btn-info btn-fill btn-wd">Th??m gi???ng vi??n</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">	
                        <div class="card">
                            <div class="header" style="float: left;">
                                <h4 class="title">Th??ng tin l???p h???c</h4>
                                <p class="category"></p>
                            </div>
                            
                            <div class="clearfix"></div>
                            <div class="content">
                                 <form action="updateClass" method="post">
                                 	<input type="hidden" name="class_id" value="${classInfo.class_id}" />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>T??n l???p h???c</label>
                                                <input type="text" class="form-control border-input" name="classname" value="${classInfo.classname}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                            	<label>Ng??y khai gi???ng</label>
                                                <input type="date" class="form-control border-input" name="startday" value="${classInfo.startday}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Ng??y k???t th??c kh??a h???c</label>
                                                <input type="date" class="form-control border-input" name="endday" value="${classInfo.endday}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Th???i gian h???c</label>
                                                <input type="text" class="form-control border-input" name="timestudy" value="${classInfo.timestudy}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>?????a ??i???m</label>
                                                <input type="text" class="form-control border-input" name="location" value="${classInfo.location}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Ng??y test</label>
                                                <input type="text" class="form-control border-input" name="testday" value="${classInfo.testday}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>S??? h???c vi??n</label>
                                                <input type="text" class="form-control border-input" name="number_of_students" value="${classInfo.number_of_students}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">C???p nh???p</button>
                                    </div>
                                    <div class="clearfix"></div>

                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        
        <!-- Modal th??m gi???ng vi??n -->
        <div class="modal fade" id="addTeacher" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="padding-top: 100px;">
            <form action="addTeacher_Class?classID=${classInfo.class_id}" method="post" onsubmit="return checkCheckBoxes(this)">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Danh s??ch gi???ng vi??n</h4>
                        </div>
                        <div class="modal-body" style="color: black;">
                            <div class="content table-responsive table-full-width">
                                <table id="tablepaging" class="table table-striped">
                                    <thead>
                                    	<th>&nbsp;</th>
                                        <th>T??n gi???ng vi??n</th>
                                        <th>Email</th>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${listAllTeacher}" var="listAllTeacher">
                                    		<tr>
                                    			<td>
                                    				<div class="checkbox icheck-primary">
                                    				<input type="checkbox" name="teacherDel[]" value="${listAllTeacher.account_id}"/>
                                    				</div>
                                    			</td>
                                    			<td>${listAllTeacher.name}</td>
	                                            <td>${listAllTeacher.mail}</td>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table> 
                                
                                <div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
                        	</div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default" onclick="return getConfirmation2();">Th??m</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">????ng</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <input type="hidden" id="message" value="${message}">
        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="viewProfileAdmin">
                            	ITCENTER
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a>Nh??m 6 - CNPM</a>
                </div>
            </div>
        </footer>
    </div>
</div>
<script type="text/javascript">
	var pager = new Pager('tablepaging', 3);
	pager.init();
	pager.showPageNav('pager', 'pageNavPosition');
	pager.showPage(1);
</script>
<script type="text/javascript">
(function () {
    var k = document.getElementById('message').value; //l???y th??ng b??o
    if(k != ""){
        alert(k);
    }  
    
})();
</script>
</body>
	<!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
	<script language="javascript" src="assets/js/changePass.js"></script>
	<script type="text/javascript" language="JavaScript">
	function checkCheckBoxes(theForm) {
		var test = document.getElementsByName("teacherDel[]");
		for(var i =0; i<test.length; i++){
		    if (test[i].checked == true) 
		    {
		    	return true;
		    } 
		}
    	alert ('B???n ch??a ch???n d??ng ????? th??m!!');
        return false;
	}
	</script>
</html>