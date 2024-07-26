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
	<h1>Add Employee</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.Employee">
		<input type="hidden" name="redirect" value="addemployee.jsp">
		<input type="hidden" name="operation" value="add">

		<div class="form_settings">
			<p>
				<span>Name</span><input class="contact" type="text" name="name"
					required="required"/>
			</p>
			<p>
				<span>User Name</span><input class="contact" type="text"
					name="username" required="required"/>
			</p>
			<p>
				<span>Password</span><input class="contact" type="password"
					name="password" required="required"/>
			</p>
			<p>
				<span>Mobile</span><input class="contact" type="text" name="mobile"
					required="required" pattern="[6789][0-9]{9}"/>
			</p>
			<p>
				<span>Email Address</span><input class="contact" type="email"
					name="email" required="required"/>
			</p>
			<p>
				<span>Address</span><textarea class="contact" name="address" required="required"></textarea>
			</p>
			<p>
				<span>Timings</span><input class="contact" type="text"
					name="timings" required="required"/>
			</p>
			<p>
				<span>Select Employee Type*</span> <select name="emptype" required="required">
					<option value="">--select--</option>
					<option value="employee">Employee</option>
					<option value="trainer">Trainer</option>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Employee"
					onclick="return validate()" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>