<%
    boolean activated = true;
    String type_login="m";
    if(activated)
        if((session.getAttribute("cod") == null)||(type_login.equals(session.getAttribute("tipo"))))
        {
            session.invalidate();
            response.sendRedirect("/PDS/index.jsp"); 
        }
%>