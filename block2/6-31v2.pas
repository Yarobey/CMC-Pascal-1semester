{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_31(input, output);

var
    n, i, j, summ, b: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_31');
    writeln;
    writeln('Please, set a number "n"');
    b := 1;
    summ := 0;
    read(n);
    writeln;
    writeln('Theese are numbers from "0" to "n" that are converted into ternary numeral system:');
    for i := 0 to n do begin
        j := i;
        repeat
            summ := summ + (j mod 3) * b;
            j := j div 3;
            b := b * 10;
        until (j = 0);
        writeln;
        while b <> 1 do begin
            b := b div 10;
            write(chr(ord('0') + (summ div b)));
            summ := summ mod b;
        end;
    end;
    writeln;
end.
