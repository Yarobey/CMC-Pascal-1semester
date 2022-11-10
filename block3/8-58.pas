{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_58(input, output);

const
    n = 10;
var
    x: array[1..n] of char;
    k, y, j, i: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_58');{знаю, что скорее всего это все неправильно, но я не очень понимаю условия задачи и доп условия}
    writeln;
    writeln('Please, write a text that ends with a ".":');
    for y := 1 to n do
        read(x[y]);
    k := 1;
    for i := 1 to n - 1 do begin
        j := i;
        repeat
            j := j + 1;
        until (x[i] = x[j]) or (j = n);
        if x[i] <> x[j] then
            k := k + 1;
    end;
    writeln;
    write(k);
    writeln;
end.
    
