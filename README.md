# lab01- sumador 
laboratorio 01 introducción a HDL

Nombre: Paula Sofía Medina Díaz

El codígo
------

Lo primero en crear fue el sumador de 1 bit, que tiene como entrada tres cables que son A(bit 1), B(bit 2) y Ci (el carry de entrada). Como salida se tiene a S(suma) y Cout(carry de salida).

    module sum1bcc (A, B, Ci,Cout,S);
    input  A;
    input  B;
    input  Ci;
    output Cout;
    output S;

    wire [1:0] st;
    assign S = st[0];
    assign Cout = st[1];
    assign st  = 	A+B+Ci;
    endmodule
    
    
  ----------------------------------------------------------
  
  
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

    module sum4b_TB;

  // Inputs
  reg [3:0] xi;
  reg [3:0] yi;

  // Outputs
  wire co;
  wire [3:0] zi;

  // Instantiate the Unit Under Test (UUT)
  sum4b uut (
    .xi(xi), 
    .yi(yi), 
    .co(co), 
    .zi(zi)
  );

  initial begin
  // Initialize Inputs
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


![Imagen1]()




