{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_16(input, output); 

procedure print;
var
    c: char;
begin
    read(c);
    if c <> '.' then begin
        print;
        write(c);
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_16');
    writeln;
    writeln('Please, set a sequence that ends with a ".": ');
    print;
    writeln;
end.