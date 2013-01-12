<cfajaxproxy cfc="service/user" jsclassname="UserServiceProxy" />

<!doctype html>
<html lang="en" ng-app="Vision">
	<head>
		<title>Oculus</title>

		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" type="text/css" href="css/darkstrap.css">
		<link rel="stylesheet" type="text/css" href="css/application.css">

		<script src="lib/jquery/jquery.min.js"></script>
		<script src="lib/bootstrap/js/bootstrap.min.js"></script>
		<script src="lib/angular/angular.min.js"></script>
		<script src="lib/angular/angular-bootstrap.min.js"></script>
		<script src="lib/angular/angular-bootstrap-prettify.min.js"></script>
		<script src="lib/angular/angular-loader.min.js"></script>
		<script src="lib/angular/angular-resource.min.js"></script>

		<script src="js/application.js"></script>
		<script src="js/services.js"></script>
		<script src="js/controllers.js"></script>
		<script src="js/filters.js"></script>
		<script src="js/directives.js"></script>
	</head>

	<body ng-controller="MainCtrl">
		<div class="navbar navbar-inverse" style="position: static;">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="/">Oculus</a>
					<ul class="nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Dev <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#" ng-click="context='view/rootscope.html'">$rootScope</a></li>
								<li><a href="#" ng-click="context='view/rootscope.html'">Nuther</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Admin <b class="caret"></b>
							</a>
							<ul>
								<li><a href="#">Dates Settings</a></li>
								<li><a href="#">Available Assessments</a></li>
								<li><a href="#">User Accounts</a></li>
								<li><a href="#">Account Access</a></li>
								<li><a href="#">Site Settings</a></li>
								<li><a href="#">Directory</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Data <b class="caret"></b>
							</a>
							<ul>
								<li><a href="#">Areas of Study</a></li>
								<li><a href="#">Courses</a></li>
								<li><a href="#">CAS</a></li>
								<li><a href="#">Course Assessments</a></li>
								<li><a href="#">Learning Settings</a></li>
								<li><a href="#">Crossover Settings</a></li>
								<li><a href="#">Learning Relationships</a></li>
								<li><a href="#">Learning Resources</a></li>
								<li><a href="#">Funding Descriptions</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Documents <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Reports <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li>
					</ul>
					
					<div ng-controller="AccountCtrl" class="pull-left">
						<form class="form-inline navbar-search" ng-show="!loggedIn()" ng-submit="login()">
							<input autofocus class="input-small search-query" placeholder="Username" type="text">
							<input type="password" class="input-small search-query" placeholder="Password">
							<button type="submit">login</button>
						</form>
						<div class="text-info" ng-show="loggedIn()">
							Logged in as {{user.fullName}}
						</div>
					</div>

					<div ng-controller="StudentCtrl" class="pull-right">
						<form class="form-inline" ng-show="loggedIn()" ng-submit="">
							<select class="input-small span2" ng-change="selectStudent()" ng-model="currentStudent" ng-options="student.name for student in students"></select>

							<select class="input-small span2" ng-change="selectSemester()" ng-model="currentSemester" ng-options="semester.name for semester in semesters"></select>
						</form>
					</div>
				</div>
			</div>
		</div>
    	<hr>
    	Context = {{context}}
		<div ng-include src="context"></div>
		<hr>
	</body>
</html>