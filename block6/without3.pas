{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskWithout3(input, output); 

var
    n: integer;

function Delete3(n: integer): integer;
begin
    if n < 10 then begin
        if n = 3 then
            Delete3 := 0
        else
            Delete3 := n;
    end
    else begin
        if (n mod 10) <> 3 then
            Delete3 := Delete3((n mod 10)) +  10 * Delete3((n div 10))
        else 
            Delete3 := Delete3((n div 10));
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskWithout3');
    writeln;
    write('Please, set a number: ');
    read(n);
    writeln;
    writeln('Your number without 3s: ', Delete3(n));
    writeln;
end.
