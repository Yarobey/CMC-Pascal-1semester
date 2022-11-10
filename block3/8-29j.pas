{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_29j(input, output);

const
    n = 10;
var
    x: array[1..n] of real;
    i, j, counter, k: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_29j');
    writeln;
    writeln('Please, set an array:');
    j := 1;
    for i := 1 to n do begin
        read(x[i]);
        if x[i] <> 0 then begin
            x[j] := x[i];
            write(x[j]:2:1, ' ');
            j := j + 1;
        end
    end;
    for k := j to n do begin
        x[k] := 0;
        write(x[k]:2:1, ' ');
    end;
    writeln;
    writeln;
end.
