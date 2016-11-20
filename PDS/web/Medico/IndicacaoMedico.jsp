<%-- 
    *******PDSM005 - Indicação de outros médicos para pacientes*********
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
                Histórico de Indicações
                <br>
                <table>
                    <tr>
                        <th>Paciente</th>
                        <th>Indicado por</th>
                    </tr>  
                    <tr>
                        <td>for</td>
                        <td>for</td>
                    </tr>
                </table>
                <br>
                Realizar Indicação:
                <br>
                Paciente: 
                    <form action="IndicacaoMedico.jsp" method="Get">          
                        RG<input type="radio" name="documento" value="RG">
                        CPF<input type="radio" name="documento" value="CPF">  
                        <input type="text" name="num_documento_paciente">
                        <br>
                Medico: 
                        <br>
                        CRM<input type="radio" name="CRM" value="CRM"> 
                        <input type="text" name="num_CRM_medico">
                        Estado <select name="estado">
                        <option value="estado1">estado1</option>
                        <option value="estado2">estado2</option>
                        </select>
                        <br>
                        <br>
                        <input type="submit" value="Indicar">
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
