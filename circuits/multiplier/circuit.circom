pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input a_in;
   signal input b_in;
   signal X_int;
   signal Y_int;

   signal output Q;

   component and--gate=AND();
   component or--gate=OR();
   component not--gate=NOT();

   and--gate.a <== a_in ;
   and--gate.b <== b_in ;
   X_int <== and--gate.out ;

   not--gate.in <== b_in ;
   Y_int <== not--gate.out;

   or--gate.a <== X_int;
   or--gate.b <== Y_int;
   Q <== or--gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
