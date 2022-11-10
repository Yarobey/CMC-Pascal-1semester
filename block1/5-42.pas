{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_42(input, output);

var
    x1, y1, xn, yn, r,maxlen, len: real;
    n, i: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task5_42');
    writeln;
    writeln('Please, set "n"');
    read(n);
    writeln;
    writeln('Please, set coordinates');
    read(x1, y1);
    len := sqr(x1) + sqr(y1);
    maxlen := len;
    for i := 1 to (n-1)do begin
        read(xn, yn);
        len := (sqr(xn) + sqr(yn));
        if len > maxlen then
            maxlen := len;
    end;
    r := sqrt(maxlen);
    writeln;
    writeln('This is the smallest length of r = ', r:3:2);
    writeln;
end.
  
