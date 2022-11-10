{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_33(input, output);

var
    c: char;
    num, num1, st5: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_33');
    writeln;
    writeln('Please, set a sequence that ends with a " "');
    writeln;
    read(c);
    num1 := 0;
    writeln;
    writeln('This number has been converted from octal to quinary numeral system : ');
    repeat 
        num := (ord(c) - ord('0'));
        num1 := num1 * 8 + num;
        read(c);
    until c = ' ';
    st5 := 1;
    while num1 div st5 > 4 do
        st5 := st5 * 5;
    repeat
        write(chr(ord('0') + (num1 div st5))); 
        num1 := num1 mod st5;
        st5 := st5 div 5;
    until st5 = 0;
    writeln;
end.
