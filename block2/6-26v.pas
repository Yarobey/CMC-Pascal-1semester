{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_26v(input, output);

var
    c1, c2: char;
    counter, counter1: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task6_26v');
    writeln;
    writeln('Please, write a text that ends with a "." and has "," between words');
    writeln;
    counter := 0;
    repeat
        read(c1);
        counter1 := 0;
        repeat
            read(c2);
            if ((c2 = ',') or (c2 = '.')) and (counter1 = 0) then
                counter := counter + 1;
            if (c2 = c1) then
                counter := counter + 1;
            counter1 := counter1 + 1;
        until ((c2 = ',') or (c2 = '.'));
    until c2 = '.';
    writeln;
    write('The amount of words that start and end with the same letter = ', counter);
    writeln;
end.
    
