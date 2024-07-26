<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Item"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
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

					<li><a href="index.jsp">Login</a></li>
					<li><a href="equipments.jsp">Gym Equipments</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>View Equipment's</h1>
				<%
					}
				%>

				<table style="width: 100%; border-spacing: 0;">
					<tr>
						<th>Item Name</th>
						<th>Description</th>

					</tr>
					<%
						for (Item item : HibernateDAO.getItems()) {
					%>
						<tr>
							<td><%=item.getName()%></td>
							<td><%=item.getDescription()%></td>
						</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
