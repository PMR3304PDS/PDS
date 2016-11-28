<%-- 
    *******PDSM005 - Visualização das indicações*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <%@ include file="/Geral/verifylogin.jsp" %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@ include file="/Geral/menu.jsp" %>
                </td>
                <td>
                    <br>
                    <br>
                    <br>
                    Histórico de Indicações:                    
                    <br>
                    <br>
                    <table>
                        <tr>
                            <th>Médico Indicante</th>
                            <th>Paciente</th>
                        </tr>
                        <% int cod = ((Integer) session.getAttribute("cod")).intValue();
                            transacoes.Indicacao ti = new transacoes.Indicacao();
                            java.util.Vector vm = new java.util.Vector();
                            vm = ti.pesquisarporCRM(cod);
                            if (vm.isEmpty() == false) {
                                for (int i = 0; i < vm.size(); i++) {
                                    data.UsuarioDO u1 = new data.UsuarioDO();
                                    transacoes.Usuario tu = new transacoes.Usuario();
                                    data.UsuarioDO u2 = new data.UsuarioDO();
                                    data.IndicacaoDO ido = new data.IndicacaoDO();
                                    ido = (data.IndicacaoDO) vm.elementAt(i);
                                    u1 = tu.pesquisarPorId(ido.getMedico_Usuario_Usu_cod_indicante());
                                    u2 = tu.pesquisarPorId(ido.getPaciente_Usuario_Usu_cod());
                                    if (u1!=null && u2!=null) {
                        %>  <tr>
                            <td><%=u1.getUsu_nome()%></td>
                            <td><%=u2.getUsu_nome()%></td>
                        </tr>    <%} else {
                        %> <td>Não há indicações!<td><%} 
                            }
                        } else {
                        %> Não há indicações!<%}
                        %>                        
                    </table>
                    <br>
                    <form action="IndicarPaciente.jsp" method="post">
                        <input type="submit" name="Fazer Indicação" value="Fazer Indicação" />
                    </form>
                </td> 
            </tr>                
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>
