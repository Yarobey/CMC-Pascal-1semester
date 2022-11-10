{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_28(input, output); 

procedure Print;
var
    c: char;
begin
    read(c);
    if c <> '(' then
        write(c)
    else begin
        Print;{смотрим скобки}
        read(c);{считываем знак}
        Print;
        write(c);{печатаем знак в постфиксной}
        read(c);
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_28');
    writeln;
    writeln('Please, set an expression that you want to translate from infix to postfix: ');
    Print;
    writeln;
end.
{((a+(b-c))*d) -> abc-+d*
a -> a
(a+b) -> ab+
((a+b)-(c*(d+e))) -> ab+cde+*-
((((a+b)+b)+c)+d) -> ab+b+c+d+}