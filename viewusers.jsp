<%@page import="com.voidmain.service.AppService"%>
<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>

<div id="site_content">
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
		<h1>View Customer's</h1>
		<%
			}
		%>
		
		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Name</th>
				<th>Mobile</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Photo</th>
				<th>Timings</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			
			<%
				String type=request.getParameter("type");
			
				if(type!=null && type.equals("customers"))
				{
				
					for (User user : HibernateDAO.getUsers()) {
			%>
						<tr>
							<td><%=user.getName()%></td>
							<td><%=user.getMobile()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getGender()%></td>
							<td><%=user.getStartdate()%></td>
							<td><%=user.getEnddate()%></td>
							<td><img src="./documents/<%=user.getPhoto()%>" height="100" width="100"><%=user.getPhoto()%></td>
							<td><%=user.getTimings()%></td>
							<td><a href="updateuser.jsp?username=<%=user.getId()%>">update</a></td>
							<td><a href="viewusers.jsp?username=<%=user.getId()%>">delete</a></td>
						</tr>
			<%
					}
				}
			%>
			
			<%
				if(type!=null && type.equals("pending"))
				{
				
					for (User user : HibernateDAO.getUsers()) {
						
						if(AppService.isSubscriptionCompleted(user.getEnddate()))
						{
			%>
							<tr>
								<td><%=user.getName()%></td>
								<td><%=user.getMobile()%></td>
								<td><%=user.getEmail()%></td>
								<td><%=user.getGender()%></td>
								<td><%=user.getStartdate()%></td>
								<td><%=user.getEnddate()%></td>
								<td><img src="./documents/<%=user.getPhoto()%>" height="100" width="100"></td>
								<td><%=user.getTimings()%></td>
								<td><a href="updateuser.jsp?username=<%=user.getId()%>">update</a></td>
								<td><a href="viewusers.jsp?username=<%=user.getId()%>">delete</a></td>
							</tr>
			<%
						}
					}
				}
			%>
			
		</table>

		<%
			String userid = request.getParameter("username");

			if (userid != null) {
				if (HibernateTemplate.deleteObject(User.class, Integer.parseInt(userid)) == 1) {
					response.sendRedirect("viewusers.jsp?status=success");
				} else {
					response.sendRedirect("viewusers.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>