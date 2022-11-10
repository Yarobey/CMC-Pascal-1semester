{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_51(input, output);

const
    n = 10;
var
    x: array[1..n] of integer;
    i, j, k, maxi, mini: integer;
    max, min, summ: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_51');
    writeln;
    writeln('Please, set an array:');
    read(x[1]);
    max := x[1];
    min := x[1];
    maxi := 1;
    mini := 1;
    summ := 0;
    for i := 2 to n do begin
        read(x[i]);
        if max < x[i] then begin
            max := x[i];
            maxi := i;
        end;
        if min > x[i] then begin
            min := x[i];
            mini := i;
        end;
    end;
    writeln(max, ' ', min, ' ', maxi, ' ', mini);
    if mini < maxi then begin
        for j := mini to maxi do
            summ := summ + x[j];
    end
    else begin
        for k := maxi to mini do
            summ := summ + x[k];
    end;
    writeln;
    write('Sum between the biggest and the smallest number in array: ', summ);
    writeln;
end.
        
    
