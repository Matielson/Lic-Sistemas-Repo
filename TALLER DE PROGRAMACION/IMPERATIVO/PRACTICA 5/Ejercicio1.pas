program Ejercicio1;
const
	maxOficinas = 300;
type
	
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vOficinas = array[1..maxOficinas] of oficina;
	
	procedure leerOficina(var o:oficina);
    begin
        writeln('Ingrese un codigo');
        readln(o.codigo);
        if(o.codigo <> 0) then begin 
            writeln('Ingrese un DNI');
            readln(o.dni);
            writeln('Ingrese un valor');
            readln(o.valor);
        end;
    end;
	
	procedure cargarVector (var v: vOficinas; var dimL: integer);
	var
		o: oficina;
	begin
		leerOficina(o);
		while (o.codigo <> 0) do begin
			dimL:= dimL + 1;
			v[dimL]:= o;
			leerOficina(o);
		end;
	end;
	
	procedure insercion (var v: vOficinas; dimL: integer);
	var
		i, j: integer; 
		actual: oficina;
	begin
		for i:= 2 to dimL do begin
			actual:= v[i];
			j:= i-1;
			while (j > 0) and (v[j].codigo > actual.codigo) do begin
				v[j+1]:= v[j];
				j:= j - 1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	function buscar(v: vOficinas; dimL: integer; valor: integer): integer;
	var
		pri, ult, medio: integer;
	begin
		buscar:= 0;
		pri:= 1;
		ult:= dimL;
		medio:= ((pri + ult) div 2);
		while (pri <= ult) and (valor <> v[medio].codigo) do begin
			if (valor < v[medio].codigo) then begin
				ult:= medio - 1;
			end
			else
				pri:= medio + 1;
				medio:= (pri + ult) div 2;
		end;
		if (pri <= ult) and (valor = v[medio].codigo) then begin
			buscar:= medio;
		end;
	end;
	
	function montoTotalAcumulado (v: vOficinas; dimL: integer): real;
	var
		
	begin
		
	end;
	
var
	
begin
	
end.


