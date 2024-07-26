<!DOCTYPE HTML>
<html>

<head>
<title>Gym Management</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<center><a href="#">Gym<span class="logo_colour"> Management</span></a></center>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");

						if (role.equals("admin")) {
					%>
						<li><a href="addemployee.jsp">Add Employee</a></li>
						<li><a href="viewemployees.jsp?type=all">Employees</a></li>
					<%
						}
					%>
					<%
						if (role.equals("employee")) {
					%>
						<li><a href="additem.jsp">Add Item</a></li>
						<li><a href="viewitems.jsp">View Items</a></li>
						
						<li><a href="adduser.jsp">Add Customer</a></li>
						<li><a href="viewusers.jsp?type=customers">Customers</a></li>
						<li><a href="viewusers.jsp?type=pending">Pending Users</a></li>
						<li><a href="viewemployees.jsp?type=trainer">Trainers</a></li>
						
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">