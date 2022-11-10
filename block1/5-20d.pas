{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_20d(input, output);

const
    eps = 1E-5;
var
    x, xn, y1, y2: real;
    n: integer;
begin
    writeln;
    writeln('Gikalo Egor 110 Task5_20d');
    writeln;
    writeln('Please, set "|x| < 1"');
    read(x);
    n := 0;
    xn := x;
    y1 := x;
    y2 := arctan(x);
    repeat
        n := n + 1;
        xn := ((((-xn) * (x * x)) * (2*n - 1)) / ((2 * n) + 1));
        y1 := y1 + xn;
    until abs(xn) < eps;
    writeln;
    writeln('These are calculated values :', y2:8:4, y1:8:4);
    writeln;
end.
