<%
if (!session.getAttributeNames().hasMoreElements())
{
%>
    <a href="/PDS/index.jsp"><img src= "/PDS/Images/Logo.png"></a>
<%
}
else
{
    String type = (String) session.getAttribute("tipo");
    if(type.equals("m"))
    {
    %>
        <a href="/PDS/Medico/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
    else if(type.equals("t"))
    {
    %>
        <a href="/PDS/Tecnico/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
    else if(type.equals("p"))
    {
    %>
        <a href="/PDS/Paciente/Home.jsp"><img src= "/PDS/Images/Logo.png"></a>
    <%
    }
}
%>
<%//<%=getServletContext().getContextPath()_>/Images/Logo.png"></a>%>