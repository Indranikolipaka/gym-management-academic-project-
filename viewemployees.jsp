<%@page import="com.voidmain.pojo.Login"%>
<%@page import="com.mysql.jdbc.log.Log"%>
<%@page import="com.voidmain.pojo.Employee"%>
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
		<h1>View Employees</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>User Name</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Empoyee Type</th>
				<th>Timings</th>
				<th>Delete</th>
			</tr>

			<%
				String type=request.getParameter("type");
			
				if(type!=null && type.equals("all"))
				{
					for (Employee employee : HibernateDAO.getEmployees()) {
			%>
						<tr>
							<td><%=employee.getUsername()%></td>
							<td><%=employee.getName()%></td>
							<td><%=employee.getEmail()%></td>
							<td><%=employee.getMobile()%></td>
							<td><%=employee.getAddress()%></td>
							<td><%=employee.getEmptype()%></td>
							<td><%=employee.getTimings()%></td>
							<td><a href="viewemployees.jsp?employeename=<%=employee.getUsername()%>">delete</a></td>
						</tr>
			<%
					}
				}
			%>
			
			<%
				if(type!=null && type.equals("trainer"))
				{
					for (Employee employee : HibernateDAO.getEmployees()) {
						
						if(employee.getEmptype().equals(type))
						{
			%>
							<tr>
								<td><%=employee.getUsername()%></td>
								<td><%=employee.getName()%></td>
								<td><%=employee.getEmail()%></td>
								<td><%=employee.getMobile()%></td>
								<td><%=employee.getAddress()%></td>
								<td><%=employee.getEmptype()%></td>
								<td><%=employee.getTimings()%></td>
								<td><a href="viewemployees.jsp?employeename=<%=employee.getUsername()%>">delete</a></td>
							</tr>
			<%
						}
					}
				}
			%>
			
		</table>

		<%
			String employeeid = request.getParameter("employeename");

			if (employeeid != null) {
				if (HibernateTemplate.deleteObject(Employee.class, employeeid) == 1 && HibernateTemplate.deleteObject(Login.class, employeeid) == 1) {
					response.sendRedirect("viewemployees.jsp?status=success");
				} else {
					response.sendRedirect("viewemployees.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>