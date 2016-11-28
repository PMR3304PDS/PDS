<%
if (!session.getAttributeNames().hasMoreElements())
{
%>
    <a href="/PDS/index.jsp"><img src= "/PDS/Images/Logo.png"></a>
<%
}
else
{
    String type_user = (String) session.getAttribute("tipo");
    if(type_user.equals("m"))
    {
    %>
        <a href="/PDS/Medico/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
    else if(type_user.equals("t"))
    {
    %>
        <a href="/PDS/Tecnico/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
    else if(type_user.equals("p"))
    {
    %>
        <a href="/PDS/Paciente/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
}
%>
<%//<%=getServletContext().getContextPath()_>/Images/Logo.png"></a>%>