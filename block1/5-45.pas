{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_45(input, output);

var
    n, max1, max2, max3, n1, n2, n3: integer;
    
begin 
    {max1 := -2;
    max2 := -1;
    max3 := -0:
    read(x);
    while x <> 0 do begin
        if x > max3 then begin
            max1 := max2;
            max2 := max3;
            max3 := x
        end
        else if x > max2 then begin
            max1 := max2;
            max2 := x
        end
        else if x > max1 then
           max1 := x;
        read(x);
    end;}
    writeln;
    writeln('Gikalo Egor 110 Task5_45');
    writeln;
    writeln('Please, set a sequence that ends with a "0"');
    read(n1, n2, n3);
    if (n1 > n2) and (n2 > n3) then begin
        max1 := n1;
        max2 := n2;
        max3 := n3;
    end;
    if (n1 > n2) and (n2 < n3) then begin
        max1 := n1;
        max2 := n3;
        max3 := n2;
    end;
    if (n1 < n2) and (n2 < n3) then begin
        max1 := n3;
        max2 := n2;
        max3 := n1;
    end;
    if (n1 < n2) and (n2 > n3) then begin
        max1 := n2;
        if n1 < n3 then begin
            max2 := n3;
            max3 := n1;
        end
        else if n1 > n3 then begin
            max2 := n1;
            max3 := n3;
        end;
    end;
    read(n);
    while n <> 0 do begin
        if n > max1 then begin
            max3 := max2;
            max2 := max1;
            max1 := n;
        end;
        if (n > max2) and (n <> max1) then
            max2 := n;
        if (n > max3) and (n <> max1) and (n <> max2) then
            max3 := n; 
        read(n);
    end;
    writeln;
    writeln('These are three maximum numbers in the setted sequance:', max1:4, max2:4, max3:4);
    writeln;
end.


