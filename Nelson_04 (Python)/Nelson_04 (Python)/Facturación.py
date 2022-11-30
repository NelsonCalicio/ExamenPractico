print("############VENTA DE PANTALONES############\n");

nombre=str(input("Ingrese su nombre: "));
cantPantalones=int(input("Ingrese la cantidad de pantalones a llevar: "));

pantalon=160.50;
subTotal=float(pantalon*cantPantalones);

if 10 < cantPantalones :
    descuento=0.25;
    porsent="25%";
    Total= float(subTotal*descuento);
elif 7 < cantPantalones :
    descuento=0.10;
    porsent="10%";
    Total= float(subTotal*descuento);
elif 700 < subTotal :
    descuento=0.05;
    porsent="5%";
    Total= float(subTotal*descuento);

print("++++++++++++FACTURA++++++++++++\n");

print("Subtotal: "+str(subTotal));
print("Descuento: "+str(porsent));
print("Total a pagar: "+str(Total));
