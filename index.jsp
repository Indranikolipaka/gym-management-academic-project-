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
				
					<li><a href="index.jsp">Login</a></li>
					<li><a href="equipments.jsp">Gym Equipments</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status=request.getParameter("status");
									
					if(status!=null)
					{
				%>
						<h1><%=status%></h1>
				<%		
					}
					else
					{
				%>
						<h1>Login Here</h1>
				<%		
					}
				%>
				
				<form action="LoginServlet">
					<div class="form_settings">
						<p>
							<span>User Name :</span><input class="contact" type="text"
								name="username" required="required"/>
						</p>
						<p>
							<span>Password :</span><input class="contact" type="password"
								name="password" required="required"/>
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Login" /><br/><a href="forgotpassword.jsp">forgot password?</a>
						</p>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>
