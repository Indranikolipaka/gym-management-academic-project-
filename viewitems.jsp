<%@page import="com.voidmain.pojo.Item"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>
	
	<div id="content">
		<%
			String status = request.getParameter("status");
		
			if (status != null) {
		%>
		<h1><%=status%></h1>
		<%
			} else {
		%>
		<h1>View Gym Item'S</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Item Name</th>
				<th>Description</th>
				<th>Delete</th>
				
			</tr>
			<%
				for (Item item : HibernateDAO.getItems()) 
				{	
			%>
					<tr>
						<td><%=item.getName()%></td>
						<td><%=item.getDescription()%></td>
						<td> <a href="viewitems.jsp?itemid=<%=item.getId()%>">Delete</a></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<%
			String itemid=request.getParameter("itemid");
		
			if(itemid!=null)
			{
				if(HibernateTemplate.deleteObject(Item.class,new Integer(itemid))==1)
				{
					response.sendRedirect("viewitems.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewitems.jsp?status=failed");
				}	
			}
		%>
	</div>
<%@include file="footer.jsp"%>