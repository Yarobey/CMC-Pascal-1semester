{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskBlock8Dop1(F, output);
uses heaptrc;
const
    z = 15;
type
    TE = packed array[1..z] of char;
    list = ^node;
    node = record
        elem: TE;
        next: list;
    end;

var
    F: text;
    L: list;
    n, k: integer;

procedure createlist(var F: text; var L: list);
var
    p: list;
    c: char;
    i, j: integer;
begin
    reset(F);
    L := nil;
    while not eof(F) do begin
        i := 1;
        if L = nil then begin
            new(L);
            while not eoln(F) do begin
                read(F,c);
                L^.elem[i] := c;
                i := i + 1;
            end;
            if i <= z then
                for j := i to z do
                    L^.elem[j] := ' ';
            p := L;
        end
        else begin
            new(p^.next);
            p := p^.next;
            while not eoln(F) do begin
                read(F,c);
                p^.elem[i] := c;
                i := i + 1;
            end;
            if i <= z then
                for j := i to z do
                    p^.elem[j] := ' ';
        end;
        readln(F);
    end;
    p^.next := L;
end;

procedure print(L: list);
var
    p: list;
begin
    n := 0;
    if L <> nil then begin
        p := L^.next;
        writeln(L^.elem);
        n := n + 1;
        while p <> L do begin
            writeln(p^.elem);
            n := n + 1;
            p := p^.next;
        end;
    end;
    writeln('n = ',n);
end;

procedure rhyme(var L: list; k: integer);
var
    p, q: list;
    i: integer;
begin
    p := L;
    for i := 1 to n - 1 do{заготовим указатель, если k = 1}
        p := p^.next;
    while n > 0 do begin
        for i := 1 to k - 1 do{ссылка на список, предшествующий удаляемому}
            p := p^.next;
        if n > 1 then begin
            if p^.next <> L then begin
                q := p^.next;
                p^.next := q^.next;
                writeln(q^.elem);
                dispose(q);
            end
            else begin{случай ссылки на голову}
                q := L;
                L := L^.next;
                p^.next := L;
                writeln(q^.elem);
                dispose(q);
            end;
        end
        else begin
            writeln(L^.elem);
            dispose(L);
        end;
        n := n - 1;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskBlock8Dop1');
    writeln;
    write('Please, set "k": ');
    read(k);
    assign(F, 'friends.txt');
    createlist(F,L);
    print(L);
    writeln;
    writeln('Knocked out people:');
    rhyme(L,k);
    close(F);
    writeln;
end.