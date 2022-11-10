{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_25(input, output); 

function F: integer;
var
    c, op: char;
    l, r: integer;

begin
    read(c);
    if (c >= '0') and (c <= '9') then
        F := ord(c) - ord('0')
    else begin
        l := F;
        read(op);
        r := F;
        read(c);
        writeln(l);
        case op of
            '+': F := l + r;
            '-': F := l - r;
            '*': F := l * r;
        end;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_25');
    writeln;
    writeln('Please, set a boolean expression: ');
    writeln(F);
    writeln;
end.