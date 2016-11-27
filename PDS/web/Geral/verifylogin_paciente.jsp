<%
    boolean activated = true;
    String type_login="p";
    if(activated)
        if((session.getAttribute("cod") == null)||(!(type_login.equals(session.getAttribute("tipo")))))
        {
            session.invalidate();
            response.sendRedirect("/PDS/index.jsp"); 
        }
%>