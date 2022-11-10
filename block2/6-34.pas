{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_34(input, output);

var
    c1, c2: char;
    summ: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_34');
    writeln;
    writeln('Please, set a sum that ends with a "." and has "+" or "-" between numbers');
    writeln;
    read(c1);
    summ := (ord(c1) - ord('0'));
    repeat
        read(c2);
        c1 := c2;
        if c2 = '-' then begin
            read(c2);
            summ := summ - (ord(c2) - ord('0'));
        end
        else if c2 = '+' then begin
            read(c2);
            summ := summ + (ord(c2) - ord('0'));
        end;
    until c2 = '.';
    writeln;
    writeln('The sum = ', summ);
    writeln;
end.
