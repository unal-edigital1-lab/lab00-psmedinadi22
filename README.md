# lab01- sumador 

Nombre: Paula Sofía Medina Díaz

El codígo
------

Lo primero en crear fue el sumador de 1 bit, que tiene como entrada tres registros que son A(bit 1), B(bit 2) y Ci (el carry de entrada). Como salida se tiene a S(suma) y Cout(carry de salida).

    module sum1bcc (A, B, Ci,Cout,S);
    input  A;
    input  B;
    input  Ci;
    output Cout;
    output S;
    
    wire [1:0] st;
    assign S = st[0];
    assign Cout = st[1];
    assign st  = A+B+Ci;
    endmodule
    
    
  ----------------------------------------------------------
  
 Luego se creo el modulo sum4b, el cual instanciaba cuatro veces el sumador de 1 bit. Este modulo tiene como entrada dos registros, que son los números de 4 bits a sumar, esto son "xi" (de 4 bits) y "yi" (de 4 bits) y finalmente tenemos dos salidas que son: "zi" que es de 4 bits y es la suma; tenemos a la salida "co" que es el carry de salida de la suma de los bits más significativos de los números de entrada.
 Este modulo es el Top del proyecto.
 
    module sum4b(xi, yi,co,zi);
     input [3 :0] xi;
     input [3 :0] yi;
     output co;
     output [3 :0] zi;
     wire c1,c2,c3;
     sum1bcc s0 (.A(xi[0]), .B(yi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
     sum1bcc s1 (.A(xi[1]), .B(yi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
     sum1bcc s2 (.A(xi[2]), .B(yi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
     sum1bcc s3 (.A(xi[3]), .B(yi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));
    endmodule

-----------------------------------------------------

Finalmente se creo el archivo sum4b_TB, que es el TechBench y tiene dos entradas que son dos registros de 4 bits y dos salidas que son dos cables, uno "zi" que es la suma de los cuatro bits y "co" que es el carry de salida de la suma de los primeros bits más significativos. 

    module sum4b_TB;
     reg [3:0] xi;
     reg [3:0] yi;

     wire co;
     wire [3:0] zi;
     
 A continuacín se instancia el sumador de 4 bits 
 
    sum4b uut (
      .xi(xi), 
      .yi(yi), 
      .co(co), 
      .zi(zi)
    );


Luego se inicializan las entradas "xi" y "yi" y se crea un txt para visualizar la suma de una manera más fácil.
    
    initial begin
     xi=0;
	 for (yi = 0; yi < 16; yi = yi + 1) begin
      if (yi==0)
        xi=xi+1;
      #5 $display("el valor de %d + %d = %d", xi,yi,zi) ;
    end
    end      
    initial begin: TEST_CASE
     $dumpfile("sum4b_TB.vcd");
     $dumpvars(-1, uut);
     #(1280) $finish;
    end
    endmodule

Resultados
-------------------


![Imagen1](https://github.com/unal-edigital1-lab/lab00-psmedinadi22/blob/master/imagen.png)




