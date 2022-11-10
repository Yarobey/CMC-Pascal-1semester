{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_27(input, output); 

function BooleanExpression: boolean;
var
    ok: boolean;
    c: char;
begin
    read(c);
    case c of
        't':begin
                read(c,c,c);
                BooleanExpression := true;
            end;
        'f':begin
                read(c,c,c,c);
                BooleanExpression := false;
             end;
        'n':begin
                read(c,c,c);
                BooleanExpression := not BooleanExpression;
                read(c);
            end;
        'a':begin
                read(c,c,c);
                ok := true;
                repeat
                   ok := ok and BooleanExpression;
                   read(c);
                until c = ')';
                BooleanExpression := ok;
            end;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_27');
    writeln;
    writeln('Please, set a boolean expression: ');
    writeln(BooleanExpression);
    writeln;
end.
{and(or(false,not(false)),true,not(true)))}