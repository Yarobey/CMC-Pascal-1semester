{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task1Block8(F1, F2, output);
uses heaptrc;

type
    TE = char;
    list = ^node;
    node = record
        elem: TE;
        next: list;
    end;

var
    F1, F2: text;
    L: list;
    ok, flag: boolean;

procedure create(var L: list; var ok: boolean);
var
    c: char;
    p: list;
begin
    L := nil;
    while not eoln(F1) do begin
        read(F1,c);
        if L = nil then begin
            new(L);
            L^.elem := c;
            p := L;
        end
        else begin
            new(p^.next);
            p := p^.next;
            p^.elem := c
        end
    end;
    if L <> nil then
        p^.next := nil;
    if p^.elem in ['0'..'9'] then
        if odd(ord(c) - ord('0')) then
            ok := true;
end;

procedure move(L: list);
begin
    if L <> nil then
        if L^.next <> nil then begin
            if flag then
                writeln(F2);
            while L <> nil do begin
                write(F2, L^.elem);
                L := L^.next;
            end;
        end;
end;

procedure destroy(var L: list);
var
    p: list;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
end;
begin
    writeln;
    writeln('Gikalo Egor 110 Task1Block8');
    writeln;
    assign(F1, 'file1.txt');
    assign(F2, 'file2.txt');
    reset(F1);
    rewrite(F2);
    flag := false;
    while not eof(F1) do begin
        ok := false;
        create(L,ok);
        if ok then begin
            move(L);
            flag := true;
        end;
        destroy(L);
        readln(F1);
    end;
    close(F1);
    close(F2);
    writeln;
end.