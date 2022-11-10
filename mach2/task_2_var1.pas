{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program task2_var_1(input, output);
var
    High: array['A'..'Z'] of 0..MaxInt;
    Low: array['a'..'z'] of 0..MaxInt;
    c, k:char;
 
begin
    writeln('task2_var_1');
    for c := 'a' to 'z' do 
        Low[c] := 0;
    for c := 'A' to 'Z' do
        High[c] := 0;
    read(c);
    while c <> '.' do begin
        if (c >= 'a') and (c <= 'z') then
            low[c] := low[c] + 1;
        if (c >= 'A') and (c <= 'Z') then
            high[c] := high[c] + 1;
        read(c);
    end;
    c := 'a';
    k := 'A';
    while c < succ('z') do begin
        if (low[c] = high[k]) and (low[c] > 0) then
            write(c);
        c := succ(c);
        k := succ(k);
    end;
    writeln;
end.
{ ТЕСТЫ, на которых надо сдавать задачу:
1) as1dAAsaFdfw2fFy?Fof.  ---> af            
2) asdAAS12SS. --->    
3) a!F. --->    
4) y5*wBdtbbkCT+rBcK. ---> bckt 
5). --->
}    
