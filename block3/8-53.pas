{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_53(input, output);

const
    n = 10;
var
    x: array[1..n] of real;
    y: array[1..n] of real;
    i, j, k, maxi, maxj: integer;
    max, curr: real;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_53');
    writeln;
    writeln('Please, set an array:');
    max := 0;
    maxi := 1;
    maxj := 1;
    for k := 1 to n do
        read(x[k],y[k]);
    for i := 1 to n - 1 do begin
        for j := i + 1 to n do begin
            curr := sqr(x[i] - x[j]) + sqr(y[i] - y[j]);
            if curr > max then begin
                max := curr;
                maxi := i;
                maxj := j;
            end;
        end;
    end;
    writeln;
    write('Indices of the points that are located at the maximum distance from each other: ', maxi, ';', maxj);
    writeln;
end.
            
            
