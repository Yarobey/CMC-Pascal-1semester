{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_54(input, output);

const
    n = 10;
var
    x: array[1..n] of integer;
    y: array[1..n] of integer;
    i, j, k, z: integer;
    min, curr: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_54');
    writeln;
    writeln('Please, set the first array:');
    for i := 1 to n do
        read(x[i]);
    writeln;
    writeln('Please, set the second array:');
    for j := 1 to n do
        read(y[j]);
    min := MaxInt;
    for k := 1 to n do begin
        for z := 1 to n do begin
            if x[k] = y[z] then begin
                curr := x[k];
                if min > curr then
                    min := curr;
            end;
        end;
    end;
    writeln;
    write('The minimum number from the first array that is also included in the second array: ', min);
    writeln;
end.
                
                
        
