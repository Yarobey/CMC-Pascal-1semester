{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_24(input, output);

const
    eps = 1E-5;

var
    l, r, x, x1, pi, e: real;
    
begin{не понимаю, что нужно делать}
    pi := 4 * arctan(1);
    e := exp(1);
    writeln;
    writeln('Gikalo Egor 110 Task5_24');
    writeln;
    l := -1;
    r := 10;
    repeat
        x := (l+r) / 2;
        if ((pi * x * sqr(x)) - (e * sqr(x)) + ((2 * e + 1) * x) + sqr(pi)) > 0 then
            r := x
        else
            l := x;
    until (r-l) < eps;
    x1 := (l+r) / 2;
    writeln('x = ',(x1):2:4);
    writeln;
end.
