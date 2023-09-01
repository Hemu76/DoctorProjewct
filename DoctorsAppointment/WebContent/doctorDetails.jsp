<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<% 
	String img=request.getParameter("img").toString();
	System.out.println(img);
	String name=""+request.getParameter("name");
	String qual=""+request.getParameter("qual");
	String exp=""+request.getParameter("exp");
	String desp=""+request.getParameter("desg");
	%>
	<div class="card" style="width: 18rem;">
  <img src="doctor.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h6><b>Name:</b><%=name %></h6>
    <h6><b>Qual:</b><%=qual %></h6>
    <h6><b>Expp:</b><%=exp %></h6>
    <h6><b>Desg:</b><%=desp %></h6>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
</body>
</html>