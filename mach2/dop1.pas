{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program task4_var_1(input, output); 

type
    matrix = array[1..19, 1..19] of integer;
var
    c: matrix;
    Max: real;
    n, m, i, j, k: integer;

begin
    read(n,m);
    k := 0;
    
    for i := 1 to n do begin
    
        if (i mod 2) = 1 then begin
            for j := 1 to m do begin
                k := k + 1;
                c[i,j] := k;
            end;
        end
        else begin
            for j := m downto 1 do begin
                k := k + 1;
                c[i,j] := k;
            end;
        end;
    end;
    
    for i := 1 to n do begin
        for j := 1 to m do begin
            write(c[i,j]:3, ' ');
        end;
    writeln;
    end;
    writeln;
end.
