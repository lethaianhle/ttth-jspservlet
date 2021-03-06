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
        		comfirmBox = confirm("B???n c?? ch???c ch???n mu???n x??a? (sau khi x??a s??? kh??ng th??? Ctrl Z)");
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
                        <i class="ti-view-list-alt"></i>
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
                             <i class="ti-arrow-left"></i>&nbsp;&nbsp;back
                           </a>
                    </div>
               	</div>
               	<div class="row">
               		<div class="col-md-12">
               			<div class="card">
               				<div class="header" style="float: left;">
                                <h4 class="title">Th??ng tin l???p h???c</h4>
                                
                            </div>
                            <div class="clearfix"></div>
                            <div class="content" style="padding-top: 30px; padding-left: 20px;">
                            	<div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>T??n l???p h???c&nbsp;</label>
                                            <span>${classInfo.classname}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Kh??a h???c&nbsp;</label>
                                            <span>${classInfo.coursename}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Ng??y khai gi???ng&nbsp;</label>
                                            <span>${classInfo.startday}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Ng??y k???t th??c&nbsp;</label>
                                            <span>${classInfo.endday}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Th???i gian h???c&nbsp;</label>
                                            <span>${classInfo.timestudy}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>?????a ??i???m&nbsp;</label>
                                            <span>${classInfo.location}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Ng??y ki???m tra&nbsp;</label>
                                            <span>${classInfo.testday}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>S??? h???c vi??n&nbsp;</label>
                                            <span>${classInfo.number_of_students}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
               			</div>
               		</div>
               		<div class="col-md-12">
               			<div class="card card-plain">
               				<div class="header" style="float: left;">
                                <h4 class="title">Danh s??ch h???c vi??n</h4>
                                <p class="category">Hi???n c?? ${classInfo.number_of_students} h???c vi??n trong l???p n??y</p>
                            </div>
                            <div class="btn-group" style="margin-left: 10px; float: right; padding-right: 20px; padding-top: 20px;">
                            	<button type="submit" form="form1" class="btn btn-default" onclick="return getConfirmation();"/><span class="ti-trash"></span>&nbsp;&nbsp;X??a</button>
                    		</div>
                            <div class="clearfix"></div>
                            <form action="deleteStudent_Class?classID=${classInfo.class_id}" id="form1" method="post" onsubmit="return checkCheckBoxes(this)">
	                            <div class="content table-responsive table-full-width">
	                                <table id="tablepaging" class="table table-hover">
	                                    <thead>
	                                    	<th>&nbsp;</th>
	                                        <th>H???c vi??n</th>
	                                        <th>Ng??y sinh</th>
	                                        <th>Gi???i t??nh</th>
	                                        <th>S??T</th>
	                                        <th>Email</th>
	                                        <th>??i???m</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${listStudent}" var="listStudent">
	                                    		<tr>
	                                    			<td>
	                                    				<div class="checkbox icheck-primary">
	                                    				<input type="checkbox" name="studentDel[]" value="${listStudent.sc_id}"/>
	                                    				</div>
	                                    			</td>
	                                    			<td>
	                                    				<div >
	                                                    <span>
	                                                        <span class="avatar">
	                                                            <img class="avatar" src="${listStudent.avatar}">
	                                                        </span>
	                                                        ${listStudent.name}
	                                                    </span>
	                                                </div>
	                                    			</td>
		                                            <td>${listStudent.birthday}</td>
		                                            <td>${listStudent.sex}</td>
		                                            <td>${listStudent.phonenumber}</td>
		                                            <td>${listStudent.mail}</td>
		                                            <td>${listStudent.point}</td>
	                                        	</tr>
	                                    	</c:forEach>
	                                    </tbody>
	                                </table> 
	                                
	                                <div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
	                        	</div>
                        	</form>
                        </div>
               		</div>
               	</div>
			</div>
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
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a>Nh??m 6</a>
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
	var kk = document.getElementById('message').value; //l???y th??ng b??o
    if(kk != ""){
        alert(kk);
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
		var test = document.getElementsByName("studentDel[]");
		for(var i =0; i<test.length; i++){
		    if (test[i].checked == true) 
		    {
		    	return true;
		    } 
		}
    	alert ('H??y ch???n d??ng ????? x??a!');
        return false;
	}
	</script>
</html>