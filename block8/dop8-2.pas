{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskBlock8Dop2(F1, F2, output);

uses heaptrc;

type
    TE = char;{Илона Владимировна, если Вы читаете это, то значит я доделал эту задачу и не умер, прошу Вас принять ее, иначе я сойду с ума}
    list = ^node;
    node = record
        elem: TE;
        next: list;
        prev: list;
    end;

var
    F1, F2: text;

{procedure destroy(var L: list);
var
    p: list;
begin
    if L <> nil then begin
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
end;}

procedure DeleteOfCells(var F1,F2: text);
var
    L, p, q, b: list;
    flag, ok: boolean;

procedure deletechain(var p: list);
begin
    if p <> nil then begin
        if (p^.prev = nil) and (p^.next = nil) and (p^.elem = '#') then begin
            {flag := false;}
            L^.next := nil;
            L^.prev := nil;
            dispose(p);
        end
        else if p^.prev = nil then begin
            if p^.next <> nil then begin
                L^.next := p^.next;
                p^.next^.prev := nil;
            end; 
            dispose(p);
        end
        else begin
            p^.prev^.next := p^.next;
            if p^.next <> nil then
                p^.next^.prev := p^.prev;
            dispose(p);
        end;
    end
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
    reset(F1);
    rewrite(F2);
    ok := false;
    flag := false;
    new(L);{создаем заглавное звено(1)}
    while not eof(f1) do begin
        {ok := false;}
        if ok and flag then begin
            writeln(F2);
        end;
        while eoln(f1) do
            readln(f1);
        new(p);{создаем заглавное звено(продолжние)}
        p^.next := nil;
        p^.prev := nil;
        L^.next := p;
        L^.prev := p;
        while not eoln(f1) do begin
            read(f1, p^.elem);
            if not eoln(f1) then begin
                new(q);
                p^.next := q;
                q^.prev := p;
                p := p^.next;
            end
            else {if p^.next <> nil then} begin
                p^.next := nil;
                L^.prev := p;
            end;
        end;
        p := L^.next;
        while p <> nil do begin
            if p^.elem = '#' then begin
                q := p^.prev;
                deletechain(q);
                q := p^.next;
                deletechain(p);
                p := q;
            end
            else
                p := p^.next;
        end;
        p := L^.next;
        {writeln('(!!!)');
        if flag then begin
            while p <> nil do begin
                write(F2, p^.elem);
                p := p^.next;
            end;
            destroy(L^.next);
            flag := true;
        end
        else
            destroy(L);}   {решил оставить комментарий ниже, как напоминание о победе над этой задачей, извините!}
        ok := false;
        while p <> nil do begin{Я НЕНАВИЖУ ЭТУ ЗАДАЧУ, Я ПОТРАТИЛ НА НЕЕ БОЛЬШЕ 5 ЧАСОВ}
            write(F2, p^.elem);
            p := p^.next;
            ok := true;
        end;
        flag := true; 
        {if ok then begin
            writeln(F2);
        end;}
        destroy(L^.next);
        readln(F1);
    end;
    destroy(L);
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskBlock8Dop2');
    writeln;
    assign(F1, 't1.txt');
    assign(F2, 't2.txt');
    DeleteOfCells(f1,f2);
    close(F1);
    close(F2);
    writeln('Done...');
    writeln;
end.