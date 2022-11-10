{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_26(input, output); 

function F: integer;
var
    c: char;
    l, r: integer;

begin
    read(c);
    if (c >= '0') and (c <= '9') then
        F := ord(c) - ord('0')
    else
        case c of
            'M':begin
                    read(c);{после M всегда будет встречаться скобка}
                    l := F;
                    read(c);
                    r := F;
                    read(c);{закрывающая скобка}
                    if l > r then
                        F := l
                    else
                        F := r;
                end;
            'm':begin
                    read(c);{после m всегда будет встречаться скобка}
                    l := F;
                    read(c);
                    r := F;
                    read(c);{закрывающая скобка}
                    if l < r then
                        F := l
                    else
                        F := r;
                end;
        end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_26');
    writeln;
    writeln('Please, set an expression: ');
    writeln(F);
    writeln;
end.
{M(4,m(5,8))}
{m(4,M(5,8))}
{M(4,M(5,8))}