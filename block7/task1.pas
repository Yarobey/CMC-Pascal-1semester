{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task1Block7(F, F1);

var
    F, F1: text;

procedure LettersInText(var F, F1: text);
var
    gl, sgl, gl1, gl2, sgl1: set of char;
    c, i: char;
    ok: boolean;
begin
    reset(F);
    rewrite(F1);
    sgl1 := ['a'..'z'] - ['a','e','i','o','u','y'];
    gl1 := ['a','e','i','o','u','y'];
    gl := [];
    gl2 := [];
    sgl := [];
    ok := true;
    while not eof(F) do begin
        while not eoln(F) do begin
            read(F,c);
            if (c in gl1) then begin
                if ok then
                    gl := gl + [c]
                else
                    gl2 := gl2 + [c];
            end
            else if c in sgl1 then
                sgl := sgl + [c];
        end;
        if not ok then
            gl := gl * gl2;
        ok := false;
        readln(F);
    end;
    close(F);
    for i := 'a' to 'z' do begin{пункт1}
        if i in sgl then
            write(F1, i, ' ');
    end;
    writeln(F1);
    for i := 'a' to 'z' do begin{пункт2}
        if not (i in sgl) and (i in sgl1) then
            write(F1, i, ' ');
    end;
    writeln(F1);
    for i := 'a' to 'z' do begin{пункт3}
        if i in gl then
            write(F1, i, ' ');
    end;
    writeln(F1);
    for i := 'a' to 'z' do begin{пункт4}
        if (i in (gl1 - gl)) then
            write(F1, i, ' ');
    end;
    close(F1);
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task1Block7');
    writeln;
    assign(F, 'words.txt');
    assign(F1, 'result.txt');
    LettersInText(F, F1);
    writeln;
end.