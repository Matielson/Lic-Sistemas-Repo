{ Correo Argentino desea analizar la información de los paquetes enviados durante 2024. De cada paquete enviado se conoce: código de envío, DNI del emisor, DNI del receptor, cantidad de objetos en el paquete y peso del paquete en gramos. Realice un programa que contenga e invoque a:

a. Un módulo que lea la información de paquetes enviados y retorne una estructura con todos los paquetes leídos.
La estructura debe ser eficiente para buscar por peso del paquete en gramos. La lectura finaliza al leer un paquete con código de envío 0.

b. Un módulo que reciba la estructura generada en a) y dos valores, y retorne una lista con todos los paquetes enviados cuyo peso está entre los dos valores recibidos.

c. Un módulo que reciba la estructura generada en a) y retorne toda la información del paquete enviado con mayor cantidad de objetos. }

program Parcial07042025;
type

	paquete = record
		codEnvio: integer;
		dniEmisor: integer;
		dniRecept: integer;
		cantObjetos: integer;
		pesoPaquete: real;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: paquete;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: paquete;
		sig: lista;
	end;
	
	procedure leerPaquete (var p: paquete);
	begin
		writeln('Ingrese el codigo de envio: ');
		readln(p.codEnvio);
		if (p.codEnvio <> 0) then begin
			writeln('Ingrese el DNI del emisor: ');
			readln(p.dniEmisor);
			writeln('Ingrese el DNI del receptor: ');
			readln(p.dniRecept);
			writeln('Ingrese la cantidad de objetos en el paquete: ');
			readln(p.cantObjetos);
			writeln('Ingrese el peso del paquete: ');
			readln(p.pesoPaquete);
		end;
	end;
	
	procedure insertarArbol (var ar: arbol; p: paquete);
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.dato:= p;
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (p.pesoPaquete < ar^.dato.pesoPaquete) then begin
				insertarArbol(ar^.HI, p);
			end
			else
				insertarArbol(ar^.HD, p);
	end;
	
	procedure cargarArbol (var ar: arbol);
	var
		p: paquete;
	begin
		leerPaquete(p);
		while (p.codEnvio <> 0) do begin
			insertarArbol(ar, p);
			leerPaquete(p);
		end;
	end;
	
	procedure agregarAdelante (var l: lista; p: paquete);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= p;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure retornarLista(ar: arbol; valor1: real; valor2: real; var l: lista);
	begin
		if (ar = nil) then begin
			l:= nil;
		end
		else
			if (ar^.dato.pesoPaquete >= valor1) and (ar^.dato.pesoPaquete <= valor2) then begin
				agregarAdelante(l, ar^.dato);
			end
			else
				if (ar^.dato.pesoPaquete < valor1) then begin
					retornarLista (ar^.HI, valor1, valor2, l);
				end
				else
					retornarLista (ar^.HD, valor1, valor2, l);
	end;
	
	procedure obtenerMaximo(ar: arbol; var maxValor: real; var maxPaq: paquete);
	begin
		if (ar <> nil) then begin
			obtenerMaximo(ar^.HI, maxValor, maxPaq);
			if (ar^.dato.cantObjetos > maxValor) then begin
				maxValor := ar^.dato.cantObjetos;
				maxPaq := ar^.dato;
			end;
			obtenerMaximo(ar^.HD, maxValor, maxPaq);
		end;
	end;	
	
var
	ar: arbol;
	l: lista;
	valor1, valor2: real;
	maxValor: real;
	maxPaquete: paquete;
begin
	{Inciso A}
	ar:= nil;
	cargarArbol(ar);
	
	{Inciso B}
	l:= nil;
	writeln('Ingrese 2 pesos de paquete en gramos: ');
	readln(valor1);
	readln(valor2);
	retornarLista(ar,valor1,valor2,l);
	
	{Inciso C}
	obtenerMaximo(ar,maxValor,maxPaquete);
end.
