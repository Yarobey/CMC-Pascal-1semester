{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program task1_var_1(input, output);  
const
    eps = 1e-12;
var
    sum, ans, el: real;
    i, k: integer;
begin
    writeln('task1_var_1');
    {решение задачи:}    
    
    sum := 0;
    i := 1;
    k := 1;
    el := k /i/(i+1)/(i+2)/(i+3)/(i+4);
    while abs(el) >= eps do begin
        sum  := sum + el;
        i := i  + 2;
        k := k*(-1);
        el := k /i/(i+1)/(i+2)/(i+3)/(i+4);
    end; 

    ans := arctan(1)*4 - 10/3 + 24*sum;
    writeln(ans:1:10);
end.
