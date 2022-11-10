//Вычислить с заданной точностью eps=1E-12 значение суммы
//Считать, что требуемая точность будет достигнута, как 
//только очередное слагаемое (в скобке) по абсолютной величине 
//станет меньше заданного eps. В ответе 10 знаков после точки 
program task1_var_1(input, output);  
    {описания имён:}
const
    eps = 1E-12;
var 
    pi, s1, s2, s3: real;
    n, k, i: integer;

begin
    writeln('task1_var_1');
    {решение задачи:}    
    i := 1;
    k := 1;
    s1 := 1/i/(i+1)/(i+2)/(i+3)/(i+4);
    s2 := 0;
    repeat
        s2 := s2 + s1;
        i := i + 2;
        k := (-1) * k;
        s1 := k/i/(i+1)/(i+2)/(i+3)/(i+4);
    until abs(s1) < eps;
    s3 := 4 * arctan(1) - (10/3) + 24 * s2;
    writeln;
    writeln(s3:8:10);
    writeln;
end.