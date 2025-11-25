program Ejercicio3;
type
	
	compra = record
		codigoJuego: integer;
		codigoCliente: integer;
		mes: integer;
	end;
	
	compraNueva = record
		codigoCliente: integer;
		mes: integer;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: compraNueva;
		sig: lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		codJuego: integer;
		dato: lista;
		HI: arbol;
		HD: arbol;
	end;
	
	procedure leerCompra (var c: compra);
	begin
		c.codigoCliente:= Random(200);
		if (c.codigoCliente <> 0) then begin
			c.mes:= Random(12) + 1;
			c.codigoJuego:= Random(200) + 1000;
		end;
	end;
	
	procedure agregarAdelante(var l: lista; cn: compraNueva);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato:= cn;
		nue^.sig:= l;
		l:= nue;
	end;
	
	procedure insertarArbol (var ar: arbol; c: compra);
	var
		cn: compraNueva;
	begin
		if (ar = nil) then begin
			new(ar);
			ar^.codJuego:= c.codigoJuego;
			ar^.dato:= nil;
			cn.codigoCliente:= c.codigoCliente;
			cn.mes:= c.mes;
			agregarAdelante(ar^.dato, cn);
			ar^.HI:= nil;
			ar^.HD:= nil;
		end
		else
			if (ar^.codJuego = c.codigoJuego) then begin
				cn.codigoCliente:= c.codigoCliente;
				cn.mes:= c.mes;
				agregarAdelante(ar^.dato, cn);
			end
			else
				if (c.codigoJuego < ar^.codJuego) then begin
					insertarArbol(ar^.HI, c);
				end
				else
					insertarArbol(ar^.HD, c);
	end;
	
	procedure cargarArbol (var ar: arbol);
	var
		c: compra;
	begin
		leerCompra(c);
		while (c.codigoCliente <> 0) do begin
			insertarArbol(ar, c);
			leerCompra(c);
		end;
	end;
	
	function retornarComprasJuego (ar: arbol; codigo: integer): lista;
	begin
		if (ar = nil) then begin
			retornarComprasJuego:= nil;
		end
		else
			if (ar^.codJuego = codigo) then begin
				retornarComprasJuego:= ar^.dato;
			end
			else
				if (codigo < ar^.codJuego) then begin
					retornarComprasJuego:= retornarComprasJuego (ar^.HI, codigo);
				end
				else
					retornarComprasJuego:= retornarComprasJuego (ar^.HD, codigo);
	end;
	
	function retornarCantClientes (l: lista; mes: integer): integer;
	begin
		if (l = nil) then begin
			retornarCantClientes:= 0;
		end
		else
			if (l^.dato.mes = mes) then begin
				retornarCantClientes:= 1 + retornarCantClientes(l^.sig, mes)
			end
			else
				retornarCantClientes:= retornarCantClientes(l^.sig,mes);
	end;
	
var
	ar: arbol;
	codigo, mes: integer;
begin
	{Inciso A}
	cargarArbol(ar);
	
	{Inciso B}
	writeln('Ingrese un codigo (1000-1200): ');
	readln(codigo);
	
	{Inciso C}
	writeln('Ingrese un mes: ');
	readln(mes);
	writeln('La cantidad de clientes que tuvo el juego con codigo ', codigo , ' en el mes numero: ', mes ,' fue de: ', retornarCantClientes(retornarComprasJuego(ar, codigo), mes));
end.
