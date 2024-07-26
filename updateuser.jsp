<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>

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
	<h1>Update User</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" name="appform" method="post">

		<input type="hidden" name="type" value="com.voidmain.pojo.User">
		<input type="hidden" name="redirect" value="viewusers.jsp">
		<input type="hidden" name="operation" value="update">
		
		<%
			User user=HibernateDAO.getUserById(Integer.parseInt(request.getParameter("username")));
			
			if(user!=null)
			{
		%>
			
			<input type="hidden" name="id" value="<%=user.getId()%>">
			<input type="hidden" name="name" value="<%=user.getName()%>">
			<input type="hidden" name="email" value="<%=user.getEmail()%>">
			<input type="hidden" name="mobile" value="<%=user.getMobile()%>">
			<input type="hidden" name="startdate" value="<%=user.getStartdate()%>">
			<input type="hidden" name="photo" value="<%=user.getPhoto()%>">
			<input type="hidden" name="gender" value="<%=user.getGender()%>">
			
			<div class="form_settings">
				
				<p>
					<span>End Date*</span><input class="contact" type="date" name="enddate"
						value="<%=user.getEnddate()%>" required="required" />
				</p>
				<p>
					<span>Timings</span><input class="contact" type="text"
						name="timings" value="<%=user.getTimings()%>" required="required"/>
				</p>
		
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Update Customer"
						onclick="return validate()" />
				</p>
				
			</div>
		<%
			}
		%>
	</form>
</div>
<%@include file="footer.jsp"%>