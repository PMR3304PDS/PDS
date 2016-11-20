<%-- 
    *******PDSX006 - Editar cadastro médico ou tecnico*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ include file="/Geral/verifylogin.jsp" %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <form>
                        Nome: <input type="text" name="nome_Usuario">
                        <br>
                        RG: <input type="text" name="num_RG">
                        <br>
                        CPF: <input type="text" name="num_CPF">
                        <br>
                        Especialidade: <select name="especialidade">
                        <option value="especialidade1">especialidade1</option>
                        <option value="especialidade2">especialidade2</option>
                        </select>
                        <br>
                        Cidade (trabalho): <select name="Cidade">
                        <option value="Cidade1">Cidade1</option>
                        <option value="Cidade2">Cidade2</option>
                        </select>
                        <br>
                        Estado (trabalho): <select name="Estado">
                        <option value="Estado1">Estado1</option>
                        <option value="Estado2">Estado2</option>
                        </select>
                        <br>
                        Endereço de Atedimento 1: <select name="tipo_end_1">
                        <option value="rua">Rua</option>
                        <option value="av">Av</option>
                        <input type="text" name="endereco_1">
                        </select>
                        <select multiple>
                            <option value="particular">Particular</option>
                            <option value="convenio">Convênio</option>
                            <option value="publico">Público</option>
                        </select>
                        <br>
                        Endereço de Atedimento 2: <select name="tipo_end_2">
                        <option value="rua">Rua</option>
                        <option value="av">Av</option>
                        <input type="text" name="endereco_2">
                        </select>
                        <select multiple>
                            <option value="particular">Particular</option>
                            <option value="convenio">Convênio</option>
                            <option value="publico">Público</option>
                        </select>
                        <br>
                        Endereço de Atedimento 3: <select name="tipo_end_3">
                        <option value="rua">Rua</option>
                        <option value="av">Av</option>
                        <input type="text" name="endereco_3">
                        </select>
                        <select multiple>
                            <option value="particular">Particular</option>
                            <option value="convenio">Convênio</option>
                            <option value="publico">Público</option>
                        </select>
                        <br>
                        Telefone 1:
                        <input type="text" name="telefone 1">
                        <br>
                        Telefone 2:
                        <input type="text" name="telefone 2">
                        <br>
                        <%-- Foto --%>
                        <input type="submit" value="Salvar dados">
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
