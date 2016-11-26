<%-- 
    *******Logout*********
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <%@ include file="/Geral/verifylogin.jsp" %>
            <%
                String yes = request.getParameter("yes");
                String no = request.getParameter("no");
                String type;
                if (yes != null) {
                    session.invalidate();
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
                else if (no != null) {
                    type = (String) session.getAttribute("tipo");
                    if (type.equals("m"))
                        pageContext.forward("../Medico/Home.jsp");
                    else if (type.equals("t"))
                        pageContext.forward("../Tecnico/Home.jsp");
                    else if (type.equals("p"))
                        pageContext.forward("../Paciente/Home.jsp");
                    else
                        pageContext.forward("/temppage.jsp");
                }
                else {
            %>
                    <tr>
                        <%@ include file="/Geral/header.jsp" %>
                    </tr>
                    <center> Deseja Sair? </center>
                    <form method="post" action="logout.jsp">
                        <center>
                            <input type="submit" name="yes" value="Sim">
                            &nbsp;<input type="submit" name="no" value="Não">
                        </center>
                    </form>
                    <tr>
                        <%@ include file="/Geral/footer.jsp" %>
                    </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

