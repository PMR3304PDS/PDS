<%
    boolean activated = false;
    if(activated)
        if(session.getAttribute("cod") == null)
            response.sendRedirect("/index.jsp"); 
%>