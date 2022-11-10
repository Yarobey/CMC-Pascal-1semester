{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_23g(input, output);

var
    c1, c2: char;

begin
    writeln;
    writeln('Gikalo Egor 110 Task6_23g');
    writeln;
    writeln('Please, write a text that ends with a "."');
    writeln;
    read(c1);
    while c1 <> '.' do begin
        read(c2);
        if not ((c1 = 'p') and (c2 = 'h')) then begin
            write(c1);
            c1 := c2;
        end
        else begin
            write('f');
            read(c1);
        end;
    end;
    writeln;
end.
