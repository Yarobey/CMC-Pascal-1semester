{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_55(input, output);

const
    n = 10;
var
    x: array[1..n] of integer;
    i, j, k: integer;
    max, counter: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_55');
    writeln;
    writeln('Please, set an array:');
    max := 0;
    counter := 0;
    for k := 1 to n do
        read(x[k]);
    for i := 1 to n - 1 do begin
        for j := i + 1 to n do begin
            if (x[i] > x[j]) and (i < j) then
                counter := counter + 1;
        end;
    end;
    writeln;
    write('The amount of inversions in this array: ', counter);
    writeln;
end.
