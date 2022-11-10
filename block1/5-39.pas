{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_39(input, output);

var
    F, A, B, C: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task5_39');
    writeln;
    writeln('------------------------');
    writeln('  A     B     C     F   ');
    writeln('------------------------');
    for A := true downto false do
        for B := true downto false do
            for C := true downto false do begin
                F := (A and B) or not(B or C);
                writeln(A:5, B:6, C:6, F:6);
                end;
    writeln;
end.
