<%
    boolean activated = false;
    if(activated)
        if(session.getAttribute("user_name") == null)
            response.sendRedirect("../index.jsp"); 
%>