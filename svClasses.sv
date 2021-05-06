class parent_class;
    // variables declarations 
    int a;
    int b;
    static int c = 4;
    // constructor 
    function new();
     this.a = 100;
     this.b = 100;
    endfunction 

    virtual  function void display;
        $display("From parent class : %d",this.a+this.b);
    endfunction
endclass 

class child_class extends parent_class;
    // variables declarations 
    int a;
    int b;
    static int c = 5;
    // constructor 
    function new();
     this.a = 200;
     this.b = 200;
    endfunction 
    
     function void display;
        $display("From child class : %d",this.a+this.b);
    endfunction
endclass 

module classes;
initial begin
    parent_class p1;
    parent_class p2;
    parent_class p3;
    parent_class p4;

    child_class c1;
    child_class c2;
    child_class c3;
    child_class c4;
    
    $display("New Trial 1");
    // both the class handles have pointers now 
    c1 = new();
    p1 = new();

    c1.display();
    p1.display();
    p1 = c1; 
    //c1 = p1;
    c1.display();
    p1.display();

    $display("New Trial 2");
    c2 = new();
    c2.display();
    p2 = c2;
    p2.display();
    c2.display(); 
    //c2 = p2;
    p2 = new();
    p2.display();

    $displayh("New Trial 3");
    p3 = new();
    //p3 = c3; //  The object at dereference depth 0 is being used before it was constructed/allocated.
    p3.display();
    
    $displayh("New Trial 4");
    p4 = c4;
    $display("p4c = ",p4.c);
    $display("c4c = ",c4.c);
    
    c4 = new();
    $display("p4c = ",p4.c);
    $display("c4c = ",c4.c);
    
    p4 = c4;
    $display("p4c = ",p4.c);
    $display("c4c = ",c4.c);
    
    
    //p4.display();
    //c4.display();
end

initial begin
end
endmodule 

/*
c2 = p2;
  Expression 'p2' on rhs is not a class or a compatible class and hence cannot
  be assigned to a class handle on lhs.
  Source type: class $unit::parent_class
  Target type: class $unit::child_class
  Please make sure that the lhs and rhs expressions are compatible.
*/
