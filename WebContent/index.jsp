
<%@page import="java.util.Enumeration"%><html>
<head>
	<title>Load Balancer Test</title>
</head>
<body>
<p>Local address: <%= request.getLocalAddr() %></p>
<p>Local name: <%= request.getLocalName() %></p>
<p>Server name: <%= request.getServerName() %></p>
<h2>Page view counter (for testing failover)</h2>
<%
	Integer viewCount = (Integer)session.getAttribute("LoadBalancerViewCount");
	if(null == viewCount) {
		viewCount = 0;
	}
	viewCount++;
	session.setAttribute("LoadBalancerViewCount", viewCount);
%>
Number of views: <%= viewCount %>
<h2>Headers:</h2>
<%
Enumeration e = request.getHeaderNames();
while(e.hasMoreElements()) {
	String headerName = e.nextElement().toString();
	String headerValue = request.getHeader(headerName);
%>
	<p><%= headerName %>: <%= headerValue %></p>
<% } %>
<h2>Cookies</h2>
<%
Cookie[] cookies = request.getCookies();
for(int i = 0, n = cookies.length; i < n; i++) {
%>
	<p><%= cookies[i].getName() %>: <%= cookies[i].getValue() %></p>
<% } %>

</body>
</html>