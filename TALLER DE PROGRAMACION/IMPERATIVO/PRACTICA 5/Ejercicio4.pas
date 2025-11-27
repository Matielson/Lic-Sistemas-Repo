program Ejercicio4;
type
	subGenero = 1..7;
	
	libro = record
		isbn: integer;
		codAutor: integer;
		genero: subGenero;
	end;
	
	regCodAutor = record
		codAutor: integer;
		cantLibros: integer;
	end;
	
	regCodGenero = record
		codGenero: subGenero;
		cantLibros: integer;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: regCodAutor;
		HI: arbol;
		HD: arbol;
	end;
	
	vGeneros = array[subGenero] of regCodGenero;
	
	procedure leerLibro (var li: libro);
	begin
		writeln('Ingrese el ISBN del libro: ');
		readln(li.isbn);
		if (li.isbn <> 0) then begin
			writeln('Ingrese el codigo del autor: ');
			readln(li.codAutor);
			writeln('Ingrese el codigo de genero del libro (1-7): ');
			readln(li.genero);
		end;
	end;
	
	procedure insertarArbol(var ar1: arbol; li: libro);
	var
		ra: regCodAutor;
	begin
		if (ar1 = nil) then begin
			new(ar1);
			ra.codAutor:= li.codAutor;
			ra.cantLibros:= 1;
			ar1^.dato:= ra;
			ar1^.HI:= nil;
			ar1^.HD:= nil;
		end
		else
			if (li.codAutor = ar1^.dato.codAutor) then begin
				ar1^.dato.cantLibros:= ar1^.dato.cantLibros + 1;
			end
			else
				if (li.codAutor < ar1^.dato.codAutor) then begin
					insertarArbol(ar1^.HI, li);
				end
				else
					insertarArbol(ar1^.HD, li);
	end;
	
	procedure inicializarVector (var v: vGeneros);
	var
		i: subGenero;
	begin
		for i:= 1 to 7 do begin
			v[i].codGenero:= i;
			v[i].cantLibros:= 0;
		end;
	end;
	
	procedure insertarVector (var v: vGeneros; li: libro);
	begin
		v[li.genero].cantLibros:= v[li.genero].cantLibros + 1;
	end;
	
	
	procedure cargarEstructuras (var ar1: arbol; var v: vGeneros);
	var
		li: libro;
	begin
		leerLibro(li);
		while (li.isbn <> 0) do begin
			insertarArbol(ar1, li);
			insertarVector(v, li);
			leerLibro(li);
		end;
	end;
	
	function ordenarYRetornar(v: vGeneros; dimL: integer): string;
	var
		i, j: integer; 
		actual: regCodGenero;
		vN: array [1..7] of string = ('literario', 'filosofía', 'arte', 'biología', 'computación', 'medicina','ingeniería');
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i-1;
			while (j > 0) and (v[j].cantLibros < actual.cantLibros) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
		ordenarYRetornar:= vN[v[1].codGenero];
	end;
	
	function retornarCantLibros (ar: arbol; cod1: integer; cod2: integer): integer;
	begin
		if (ar = nil) then
			retornarCantLibros := 0
		else
			if (ar^.dato.codAutor >= cod1) and (ar^.dato.codAutor <= cod2) then begin
				retornarCantLibros := 1 + retornarCantLibros(ar^.HI, cod1, cod2) + retornarCantLibros(ar^.HD, cod1, cod2);
			end
			else 
				if (ar^.dato.codAutor < cod1) then begin
					retornarCantLibros := retornarCantLibros(ar^.HD, cod1, cod2);
				end
				else
					retornarCantLibros := retornarCantLibros(ar^.HI, cod1, cod2);
	end;
	
var
	v: vGeneros;
	a: arbol;
	cod1, cod2: integer;
begin
	{Inciso A}
	inicializarVector(v);
	cargarEstructuras(a,v);
	
	{Inciso B}
	writeln('El genero con mayor cantidad de libros es: ', ordenarYRetornar(v, 7));
	
	{Inciso C}
	writeln('Ingrese 2 codigos de autor: ');
	readln(cod1);
	readln(cod2);
	writeln('La cantidad total de libros correspondientes a los codigos de autor entre: ', cod1, ' y ', cod2, ' es: ', retornarCantLibros(a,cod1,cod2));
end.
