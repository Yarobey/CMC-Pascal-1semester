{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task4Block7(F, F1{, output});
uses heaptrc;
type 
    str = packed array[1..10] of char;
    stud =  record { информация об одном студенте }
                fn: record 
                        fam, name: str;
                    end; { фамилия, имя }
                sex: (M,W); { пол: муж (M), жен (W) }
                marks: array[1..5] of 2..5 { пять оценок }
            end;
    course = file of stud;
    list = ^node;
    node =record
            elem: stud;
            next: list;
        end;
var
    F: course;
    F1: text;
    L, p: list;
    x: stud;
    i: integer;

function GoodStudent(var x: stud): boolean;
var
    i, sum: integer;
    ok: boolean;
begin
    ok := true;
    sum := 0;
    i := 1;
    with x do begin
        while ok and (i <= 5) do begin
            sum := sum + marks[i];
            if (marks[i] < 4) or (sum = 25) then {если у хорошистов хотя бы одна 5, то нужно добавить "or (sum = 20)"}
                ok := false;
            i := i + 1;
        end;
    end;
    GoodStudent := ok;
end;
    
procedure Ins(var L: list; E: stud);
var
    p: list;
begin
    if L = nil then begin
        new(L);
        L^.elem := E;
        L^.next := nil;
    end
    else if E.fn.fam > L^.elem.fn.fam then
        Ins(L^.next, E)
    else begin
        new(p);
        p^.elem := E;
        p^.next := L;
        L := p;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task4Block7');
    writeln;
    assign(F, 'course.bin');
    assign(F1, 'ans.txt');
    L := nil;
    reset(F);
    while not eof(F) do begin
        read(F,x);
        if GoodStudent(x) then begin
            {with x, fn do begin
                write(fam,' ');
                write(name,' ');
                write(sex, ' ');
                for i := 1 to 5 do
                    write(marks[i], ' ');
            end;
            writeln;}
            Ins(L,x);
        end;
    end;
    rewrite(F1);
    if L <> nil then begin 
        p := L;
        while p <> nil do begin
            with p^.elem, fn do begin
                write(F1, fam,' ');
                write(F1, name,' ');
                case sex of
                    M: write(F1, 'M',' ');
                    W: write(F1, 'W',' ');
                end;
                for i := 1 to 5 do
                    write(F1, marks[i], ' ');
            end;
            p := p^.next;
            if p <> nil then
                writeln(F1);
        end;
        while L <> nil do begin
            p := L;
            L := L^.next;
            dispose(p);
        end;
        dispose(L);{не уверен, что это нужно, так как и без этого все было нормально, но вроде так правильнее, а может и нет}
    end
    else
        write(F1, 'no good students');
    close(F);
    close(F1);
    writeln;
end.