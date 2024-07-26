<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@include file="header.jsp"%>

</head>

<div id="content">
	<!-- insert the page content here -->
	<%
		String status = request.getParameter("status");

		if (status != null) {
	%>
	<h1><%=status%></h1>
	<%
		} else {
	%>
	<h1>Add Gym Item</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Item">
		<input type="hidden" name="operation" value="add"> 
		<input type="hidden" name="redirect" value="additem.jsp">

		<div class="form_settings">

			<p>
				<span>Gym Item Name</span><input class="contact" type="text" name="name"
					required="required"/>
			</p>
			<p>
				<span>Description</span><textarea rows="10" cols="20" name="description" required="required"></textarea>
			</p>
			
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Gym Item"
					onclick="return validate()" />
			</p>
		</div>
	</form>
	
</div>

<%@include file="footer.jsp"%>