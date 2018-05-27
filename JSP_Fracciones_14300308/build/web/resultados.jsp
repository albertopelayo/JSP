<%-- 
    Document   : resOpFracciones
    Created on : 26/05/2018, 10:19:34 PM
    Author     : Alberto Pelayo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    class Fraccion {
        public int numerador;
        public int denominador;

        public Fraccion (int n, int d){
            this.numerador = n;      
            this.denominador = d;
        }
        public Fraccion(){}

        public int returnNumerador() {
            return this.numerador;
        }
        public int returnDenominador() {
            return this.denominador;
        }
    }

    class OpFracciones {
        Fraccion F1;
        Fraccion F2;

        public OpFracciones(Fraccion I1,Fraccion I2) {
            this.F1 = I1;
            this.F2 = I2;
        }

        public Fraccion Suma() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 + t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Resta() {
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();     
            int t1 = this.F1.returnNumerador() * this.F2.returnDenominador();
            int t2 = this.F1.returnDenominador() * this.F2.returnNumerador();
            int resnum = t1 - t2;
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Multiplicacion() {
            int resnum = this.F1.returnNumerador() * this.F2.returnNumerador();
            int resden = this.F1.returnDenominador() * this.F2.returnDenominador();
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        public Fraccion Division() {
            int resnum = this.F1.returnNumerador() * this.F2.returnDenominador();
            int resden = this.F1.returnDenominador() * this.F2.returnNumerador();        
            Fraccion res = new Fraccion(resnum, resden);
            res = simplificar(res);
            return res;
        }

        private Fraccion simplificar(Fraccion temp) {
            if(temp.returnDenominador() == 0)
                return temp;
            int i;
            for(i = 2; i < 100; i++)
            {
                if((i == 2 || i == 3 || i == 5 || i == 7) || ((i % 2)!= 0 && (i % 3)
                        != 0 && (i % 5) != 0 && (i % 7) != 0))
                {
                    if(temp.returnNumerador() % i == 0 && temp.returnDenominador()
                            % i == 0)
                    {
                        temp.numerador /= i;
                        temp.denominador /= i;
                        i = 1;
                    }
                }
            }
            return temp;
        }
    }

    int num1 = Integer.parseInt(request.getParameter("num1"));
    int den1 = Integer.parseInt(request.getParameter("den1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));
    int den2 = Integer.parseInt(request.getParameter("den2"));

    Fraccion aux = new Fraccion();
    Fraccion fracc1 = new Fraccion(num1, den1);
    Fraccion fracc2 = new Fraccion(num2, den2);

    OpFracciones myOp = new OpFracciones(fracc1, fracc2);
    int higherFracc;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados JSP</title>
       
        
    </head>
    <style>
        body
	{
		background-color: #CEF6F5;
	}
    </style>
    <body>
        <h1 align="center">RESULTADOS OPERACIONES</h1><br><br><br>
        
        <table  style="width:100%">
           
                <tr>
                    <th>OPERACIÓN</th>
                    <th>FORMULA</th>
                    <th>SUSTITUCIÓN</th>
                    <th>RESULTADO</th>
                </tr>
           
                
                <tr align="center">
                    <th>SUMA</th>
                    <td>Fracción 1 + Fracción 2</td>
                    <%
                        aux = myOp.Suma();                        
                    %>
                    <td>
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%> + <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
                    </td>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr align="center">
                    <th>RESTA</th>
                    <td>Fracción 1 - Fracción 2</td>
                    <%
                        aux = myOp.Resta();     
                        if (aux.returnNumerador() > 0) 
                            higherFracc = 1;
                        else if (aux.returnNumerador() < 0)
                            higherFracc = 2;
                        else
                            higherFracc = 0;
                    %>
                    <td>
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%> - <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
                    </td>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr align="center">
                    <th>MULTIPLICACIÓN</th>
                    <td>Fracción 1 * Fracción 2</td>
                    <%
                        aux = myOp.Multiplicacion();                       
                    %>
                    <td>
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%> * <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
                    </td>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
                <tr align="center">
                    <th>DIVISIÓN</th>
                    <td>Fracción 1 / Fracción 2</td>
                    <%
                        aux = myOp.Division();                       
                    %>
                    <td>
                        <%= fracc1.returnNumerador()%>/<%= fracc1.returnDenominador()%> + <%= fracc2.returnNumerador()%>/<%= fracc2.returnDenominador()%>
                    </td>
                    <td>
                        <%= aux.returnNumerador()%>/<%= aux.returnDenominador()%>
                    </td>
                </tr>
            
        </table>
                    <br><br><br>
                    <div align="center"><a href="index.jsp"><button>REGRESAR</button></a></div>
    </body>
</html>
