{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_41b(input, output);

const
    n = 15;
var
    x: array[1..n] of real;
    i, j, k, z, counter: integer;
    r: real;
    flag: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_41b');
    writeln;
    writeln('Please, set an array:');
    flag := true;
    z := n;
    counter := 0;
    for j := 1 to n do
        read(x[j]);
    while (z <> 0) and flag do begin
        flag := false;
        for i := 1 to z-1 do begin
            if x[i] > x[i+1] then begin
                r := x[i+1];
                x[i+1] := x[i];
                x[i] := r;
                flag := true;
            end;
        end;
        z := z - 1;
    end;
    writeln('This array is sorted in non-decreasing order:');
    for k := 1 to n do 
        write(x[k]:2:1, ' ');
    writeln;
end.
