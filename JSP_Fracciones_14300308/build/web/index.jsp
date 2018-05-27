<%-- 
    Document   : indexc
    Created on : 26/05/2018, 09:48:27 PM
    Author     : Alberto Pelayo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fracciones JSP</title>
      
        
    </head>
    <style>
        body
	{
		background-color: #CEF6F5;
	}
    </style>
    <body ba>
        <h1 align="center">Operaciones con Fracciones</h1>      
        <div align="center">
        <h3>Ingrese las fracciones a calcular</h3>
        <form  action="resultados.jsp" method="POST">
            <section id="fracc">
                <section id="fracc1">
                    <label>Fracción 1</label>
                    <section>
                        <input  type="text" name="num1" placeholder="N" required autocomplete="off" required pattern="[0-9]{1,5}" title="Numerador: Puros Dígitos, máximo 5 dígitos" style="width:40px;"/><br>
                        <input  type="text" name="den1" placeholder="D" required autocomplete="off" required pattern="[0-9]{1,5}" title="Denominador: Puros Dígitos, máximo 5 dígitos"  style="width:40px;"/>
                    </section>
                </section>
                <br><br><br>
                <section >
                    <label>Fracción 2</label>
                    <section >                                           
                        <input  type="text" name="num2" placeholder="N" required autocomplete="off" required pattern="[0-9]{1,5}" title="Numerador: Puros Dígitos, máximo 5 dígitos" style="width:40px;"/><br>
                        <input  type="text" name="den2" placeholder="D" required autocomplete="off" required pattern="[0-9]{1,5}" title="Denominador: Puros Dígitos, máximo 5 dígitos" style="width:40px;"/>
                    </section>
                </section>
                <br><br>
            </section>
            <section id="Btns">            
                <input type="reset" value="RESET" name="Reset" />
                <input type="submit" value="CALCULAR" name="send" />
            </section>
        </form>
        </div>
    </body>
</html>
