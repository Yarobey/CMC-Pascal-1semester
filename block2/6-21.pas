{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_21d(input, output);

var
    counter: integer;
    c1, c2, c3: char;

begin
    writeln;
    writeln('Gikalo Egor 110 Task6_21');
    writeln;
    writeln('Please, write a text that ends with a "."');
    writeln;
    counter := 0;
    read(c1);
    if (c1 <> '.') then begin
        read(c2);
        if (c2 <> '.') then begin
            read(c3);
            if (c2 <> '.') then begin
                while (c3 <> '.') do begin
                    if ((c1 = 'a') and (c2 = 'b') and (c3 = 'c')) then
                        counter := counter + 1;
                    c1 := c2;
                    c2 := c3;
                    read(c3);
                end;
            end;
        end;
    end;
    writeln;
    write('The amount of "abc" = ', counter);
    writeln;
end.

    
    
