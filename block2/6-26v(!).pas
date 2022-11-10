{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_26v(input, output);

var
    c, c1, c2: char;
    counter: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_26v');
    writeln;
    writeln('Please, write a text that ends with a "." and has "," between words');
    writeln;
    counter := 0;
    repeat
        read(c);
        c1 := c;
        repeat
            c2 := c;
            read(c);
        until ((c2 = ',') or (c2 = '.'));
        if c1 = c2 then
            counter := counter + 1;
    until c2 = '.';
    writeln;
    write('The amount of words that start and end with the same letter = ', counter);
    writeln;
end.