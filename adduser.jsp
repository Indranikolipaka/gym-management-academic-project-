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
	<h1>Add Customer</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform" enctype='multipart/form-data'>

		<div class="form_settings">

			<p>
				<span>Name*</span><input class="contact" type="text" name="name"
					value="" required="required"/>
			</p>
			<p>
				<span>Mobile*</span><input class="contact" type="text" name="mobile"
					value="" required="required" pattern="[6789][0-9]{9}"/>
			</p>
			<p>
				<span>Email*</span><input class="contact" type="email" name="email"
					value="" required="required"/>
			</p>
			
			<p>
				<span>Start Date*</span><input class="contact" type="date" name="startdate"
					value="" required="required"/>
			</p>
			<p>
				<span>End Date*</span><input class="contact" type="date" name="enddate"
					value="" required="required"/>
			</p>
			<p>
				<span>Photo*</span><input class="contact" type="file" name="photo"
					value="" required="required" accept="image/png, image/gif, image/jpeg"/>
			</p>
			<p>
				<span>Timings</span><input class="contact" type="text"
					name="timings" required="required"/>
			</p>
			<p>
				<span>Select Gender*</span> <select name="gender" required="required">
					<option value="">--select--</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Add Customer"
					onclick="return validate()" />
			</p>
		</div>
	</form>
</div>
<%@include file="footer.jsp"%>