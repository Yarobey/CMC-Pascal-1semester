{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_32(input, output);

var
    c: char;
    num, num1, maxnum, i: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_32');
    writeln;
    writeln('Please, set a sequence that ends with a "." and has " " between its elements');
    writeln;
    read(c);
    num := 0;
    num1 := 0;
    maxnum := 0;
    repeat
        num1 := 0;
        repeat 
            if c = ' ' then
                read(c)
            else begin
                num := (ord(c) - ord('0'));
                num1 := num1 * 7 + num;
                read(c);
            end;
        until (c = ' ') or (c = '.');
        if num1 > maxnum then
            maxnum := num1;
    until c = '.';
    writeln;
    writeln('Maximum number "converted from septenary numeral system to decimal numeral system" = ', maxnum);
    writeln;
end.
