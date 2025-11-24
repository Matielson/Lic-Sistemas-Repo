program Ejercicio2;
type

	anios = 2015..2024;
	
	auto = record
		patente: integer;
		fabricacion: anios;
		marca: string;
		color: string;
		modelo: string;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
	datosAuto = record
		patente: integer;
		color: string;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: datosAuto;
		sig: lista;
	end;
	
	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record
		marca: string;
		dato: lista;
		HI: arbol2;
		HD: arbol2;
	end;
	
	listaAnios = ^nodoListaAnios;
	
	nodoListaAnios = record
		dato: auto;
		sig: listaAnios;
	end;
	
	vAnios = array[anios] of listaAnios;
	
	
	procedure leerAuto (var a: auto);
	begin
		writeln('Ingrese la marca: ');
		readln(a.marca);
		if (a.marca <> 'MMM') then begin
			writeln('Ingrese el año de fabricacion: ');
			readln(a.fabricacion);
			writeln('Ingrese la patente: ');
			readln(a.patente);
			writeln('Ingrese el color: ');
			readln(a.color);
			writeln('Ingrese el modelo: ');
			readln(a.modelo);
		end
	end;
	
	
	procedure insertarArbol(var ar1: arbol; a: auto);
	begin
		if (ar1 = nil) then begin
			new(ar1);
			ar1^.dato:= a;
			ar1^.HI:= nil;
			ar1^.HD:= nil;
		end
		else
			if (a.patente < ar1^.dato.patente) then begin
				insertarArbol(ar1^.HI, a);
			end
			else
				insertarArbol(ar1^.HD, a);
	end;
	
	
	procedure agregarAdelante(var l: lista; d: datosAuto);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= d;
		nue^.sig:= l;
		l:= nue;
	end;
	
	
	procedure insertarArbol2 (var ar2: arbol2; a: auto);
	var
		dA: datosAuto;
	begin
		if (ar2 = nil) then begin
			new(ar2);
			ar2^.marca:= a.marca;
			ar2^.dato:= nil;
			dA.patente:= a.patente;
			dA.color:= a.color;
			agregarAdelante(ar2^.dato, dA);
			ar2^.HI:= nil;
			ar2^.HD:= nil;
		end
		else
			if (a.marca = ar2^.marca) then begin
				dA.patente := a.patente;
				dA.color := a.color;
				agregarAdelante(ar2^.dato, dA);
			end
			else begin
				if (a.marca < ar2^.marca) then begin
					insertarArbol2(ar2^.HI, a);
				end
				else
					insertarArbol2(ar2^.HD, a);
			end;
	end;
		
		
	procedure cargarArboles (var ar1: arbol; var ar2: arbol2);
	var
		a: auto;
	begin
		leerAuto(a);
		while (a.marca <> 'MMM') do begin
			insertarArbol(ar1, a);
			insertarArbol2(ar2, a);
			leerAuto(a);
		end;
	end;
	
	function retornarCantAutos (ar1: arbol; marca: string): integer;
	begin
		if (ar1 = nil) then begin
			retornarCantAutos:= 0
		end
		else
			if (marca = ar1^.dato.marca) then begin
				retornarCantAutos:= 1 + retornarCantAutos(ar1^.HI, marca) + retornarCantAutos(ar1^.HD, marca);
			end
			else
				if (marca < ar1^.dato.marca) then
					retornarCantAutos:= retornarCantAutos(ar1^.HI, marca)
				else
					retornarCantAutos:= retornarCantAutos(ar1^.HD, marca);
	end;
	
	function contarNodosLista (l: lista): integer;
	begin
		contarNodosLista:= 0;
		while (l <> nil) do begin
			contarNodosLista:= contarNodosLista + 1;
			l:= l^.sig;
		end;
	end;
	
	function retornarCantAutos2 (ar2: arbol2; marca: string): integer;
	begin
		if (ar2 = nil) then begin
			retornarCantAutos2:= 0
		end
		else
			if (marca = ar2^.marca) then begin
				retornarCantAutos2:= contarNodosLista(ar2^.dato);
			end
			else
				if (marca < ar2^.marca) then begin
					retornarCantAutos2:= retornarCantAutos2(ar2^.HI, marca)
				end
				else
					retornarCantAutos2:= retornarCantAutos2(ar2^.HD, marca);
	end;
	
	procedure inicializarVector (var v: vAnios);
	var
		i: integer;
	begin
		for i:= 2015 to 2024 do begin
			v[i]:= nil;
		end; 
	end;
	
	procedure agregarAdelanteAuto(var l: listaAnios; a: auto);
	var
		nue: listaAnios;
	begin
		new(nue);
		nue^.dato:= a;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure recorrerArbolYAgrupar (ar1: arbol; var v: vAnios);	
	begin
		if (ar1 <> nil) then begin
			recorrerArbolYAgrupar (ar1^.HI, v);
			agregarAdelanteAuto(v[ar1^.dato.fabricacion], ar1^.dato);
			recorrerArbolYAgrupar (ar1^.HD, v);
		end;
	end;
	
	function devolverModeloAuto (ar1: arbol; patente: integer): string;
	begin
		if (ar1 = nil) then begin
			devolverModeloAuto:= 'No se encontro la patente solicitada en el sistema.';
		end
		else
			if (ar1^.dato.patente = patente) then begin
				devolverModeloAuto:= ar1^.dato.modelo;
			end
			else
				if (patente < ar1^.dato.patente) then begin
					devolverModeloAuto:= devolverModeloAuto(ar1^.HI, patente);
				end
				else 
					devolverModeloAuto:= devolverModeloAuto(ar1^.HD, patente);
	end;
	
	function buscarColor (l: lista; patente: integer): string;
	var
		aux: boolean;
	begin
		aux:= false;
		buscarColor:= 'No se encontro la patente solicitada en el sistema.';
		while ((l <> nil) and (not aux)) do begin
			if (l^.dato.patente = patente) then begin
				buscarColor:= l^.dato.color;
				aux:= true;
			end
			else
				l:= l^.sig;
		end;
	end;
	
	procedure devolverColorAuto (ar2: arbol2; patente: integer; var color: string);
	begin
		if (ar2 <> nil) then begin
			devolverColorAuto(ar2^.HI, patente, color);
			if (color = 'No se encontro la patente solicitada en el sistema.') then
				color := buscarColor(ar2^.dato, patente);
			devolverColorAuto(ar2^.HD, patente, color);
		end;
	end;
	
	
var
	ar1: arbol;
	ar2: arbol2;
	marca, color: string;
	patente: integer;
	v: vAnios;
begin
	ar1:= nil;
	ar2:= nil;
	
	{Inciso A}
	cargarArboles(ar1, ar2);
	
	{Inciso B}
	writeln('Ingrese una marca a buscar en el sistema: ');
	readln(marca);
	writeln(retornarCantAutos(ar1, marca));
	
	{Inciso C}
	writeln('Ingrese una marca a buscar en el sistema: ');
	readln(marca);
	writeln(retornarCantAutos2(ar2, marca));
	
	{Inciso D}
	inicializarVector(v);
	recorrerArbolYAgrupar(ar1, v);
	
	{Inciso E}
	writeln('Ingrese una patente a buscar en el sistema: ');
	readln(patente);
	writeln(devolverModeloAuto(ar1,patente));
	
	{Inciso F}
	writeln('Ingrese una patente a buscar en el sistema: ');
	readln(patente);
	color := 'No se encontro la patente solicitada en el sistema.';
	devolverColorAuto(ar2,patente, color);
	writeln(color)
end.
