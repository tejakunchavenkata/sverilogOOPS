class sample;
int a ;
int b ;
extern function void printA();   
extern function void printB();
endclass : sample

function void sample::printA;
    $display("print A");
endfunction : printA

function void sample::printB;
    $display("print B");
endfunction : printB

initial begin
     $display("TEJA begin block");
end