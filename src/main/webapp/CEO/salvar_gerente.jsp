<%@page import="banco.CEOBD"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de CEO</title>
    </head>
    <body>
        <%
        HttpSession sessao = request.getSession();
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String RG=request.getParameter("RG");
        String cod ;
        
        if(sessao.isNew()){
            response.sendRedirect("http://localhost:8080/Company/index.jsp");
        }else{
            Funcionario ger = (Funcionario) sessao.getAttribute("Gerente");
           if(ger==null){
               response.sendRedirect("http://localhost:8080/Company/index.jsp");
           }
           else{
            cod=ger.getID_departamento();
            Funcionario fun=new Funcionario();
            fun.setID_departamento(cod);
            fun.setRG(RG);
            fun.setNome(nome);
                
            fun.setEmail(email);
            fun.setEmpresa(ger.getEmpresa());
            fun.setStatus_GERENTE(false);
            CEOBD.Cadastrar_Funcionario(fun);
             response.sendRedirect("http://localhost:8080/Company/Menu_Gerente.jsp?Erro=SUCESSO");
                       
           }
            }
            
                
        %>
        
</html>