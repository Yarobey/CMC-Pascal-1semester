{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_17(input, output); 

procedure print;
var
    n: integer;
begin
    read(n);
    if n < 0 then begin
        write(n, ' ');
        print;
    end
    else if n > 0 then begin
        print;
        write(n, ' ');
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_17');
    writeln;
    writeln('Please, set a sequence of whole numbers that ends with a "0" and has " " between numbers: ');
    print;
    writeln;
end.
