{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task6_23v(input, output);

var
    c1, c2: char;

begin
    writeln;
    writeln('Gikalo Egor 110 Task6_23v');
    writeln;
    writeln('Please, write a text that ends with a "."');
    writeln;
    read(c1);
    while c1 <> '.' do begin
        read(c2);
        if not ((c1 = 'c') and (c2 = 'b')) then begin
            write(c1);
            c1 := c2;
        end;
    end;
    writeln;
end.
