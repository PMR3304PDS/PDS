<%
    boolean activated = true;
    if(activated)
        if(session.getAttribute("cod") == null)
        {
            session.invalidate();
            response.sendRedirect("/PDS/index.jsp"); 
        }
%>