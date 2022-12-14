{$mode TP}
{$codepage UTF-8}
{$R+,B+,X-}
// ---------------------------------------------------------------------
// ЗАДАЧА_2    (выход-7 от 11.12.2021)
// РЕШАТЬ САМОСТОЯТЕЛЬНО, А НЕ КОЛЛЕКТИВНО (КАЖДЫЙ РАБОТАЕТ НА СЕБЯ !)
// ---------------------------------------------------------------------
(* ПОЭТАПНАЯ РАБОТА СО СПИСКОМ
 Внимание! Можете описывать свои процедуры и функции как угодно 
 (итеративно или рекурсивно), это дело вашего вкуса
 ---------------------------------------------------------------------
 ЭТАП_1  (30 очков)
 По заданному неотрицательному целому числу n (n вводится с клавиатуры)
 построить линейный список L, образованный из цифр этого числа 
 (начиная со старшей цифры). Т.е. тип элементов списка: TE = 0..9
 Распечатать полученный список.
 Требования к ЭТАПУ_1:
 Описать функцию digits(n), значением которой является список, 
 построенный из цифр неотрицательного целого числа n (в первом звене -
 самая старшая цифра числа, в последнем звене - самая младшая цифра).
 Описать процедуру print(L), которая выводит на экран (через пробелы)
 элементы списка L (начиная с самого первого элемента и кончая самым
 последним элементом)
 Описать процедуру destroy(L), которая уничтожает звенья списка L 
 (с освобождением памяти) - выполняется в конце программы, т.е. 
 если сдаёте 1-ый этап, то в конце 1-го этапа (если сдаёте 2-ой этап,
 то в конце 2-го этапа и т.п.). Можно сдавать сразу все три этапа, 
 тогда процедуру destroy(L) надо будет выполнить один раз в самом 
 конце программы
 ----------------------------------------------------------------------
 ЭТАП_2 (20 очков)
 Перенести последний элемент списка L в его начало, например, если
 в списке L были элементы  (1, 2, 3, 4), то в результате изменений
 список L примет вид: (4, 1, 2, 3). Распечатать полученный список.
 Требования к ЭТАПУ_2:
 Описать процедуру move(L) для переноса последнего элемента непустого
 списка L в начало этого списка (в решении запрещено использовать 
 процедуры new и dispose, достаточно скорректировать некоторые ссылки).
 Для печати списка, полученного после работы процедуры move(L), 
 воспользооваться ранее написанной процедурой print(L) - см. ЭТАП_1.
 Для удаления списка (если на данном этапе завершается программа)
 воспользоваться ранее написанной процедурой destroy(L) - см. ЭТАП_1
 ----------------------------------------------------------------------
 ЭТАП_3 (20 очков)
 В полученном (после ЭТАПА_2) списке удалить все повторные вхождения
 его первого элемента, т.е. если список имел вид (5, 1, 5, 5, 2, 5), 
 то в результате преобразований он должен принять такой вид: (5, 1, 2)
 Требования к ЭТАПУ_3:
 Описать процедуру cut(L) для удаления в списке L повторных вхождений
 его первого элемента.
 Для печати списка, полученного после работы процедуры cut(L), 
 воспользооваться ранее написанной процедурой print(L) - см. ЭТАП_1.
 Для удаления списка (если на данном этапе завершается программа)
 воспользоваться ранее написанной процедурой destroy(L) - см. ЭТАП_1
 ----------------------------------------------------------------------
 ЭТАП_4 ДОПОЛНИТЕЛЬНЫЙ, можно сдать до 23.00 (20 очков)
 Перевернуть полученный после ЭТАПА_3 список, т.е. если список L имел
 вид (2, 4, 1, 8), то должен быть преобразован к виду (8, 1, 4, 2).
 Требования к ЭТАПУ_4:
 Описать НЕРЕКУРСИВНУЮ процедуру reverse(L), которая переворачивает 
 заданный список L, т.е. изменяет в нём ссылки так, чтобы его элементы
 оказались расположенными в обратном порядке. В решении запрещено 
 использовать процедуры New и Dispose (только скорректировать нужные 
 ссылки!!!). Pаспечатать полученный список (после чего освободить 
 память, если на этом завершается работа программы)
 ----------------------------------------------------------------------
 ЭТАП_5 ДОПОЛНИТЕЛЬНЫЙ, можно сдать до 23.00 (40 очков)
 Ввести с клавиатуры целое число k>0 и удалить из списка, полученного 
 после ЭТАПА_4 k-ый элемент с конца (если такой есть). Например, если
 список L был вида (3, 6, 1, 3, 6, 8, 4) и введено k=5, то список
 станет таким: (3, 6, 3, 6, 8, 4). При k = 8 (и больше) список L не
 изменится.
 Требования к ЭТАПУ_5:
 Описать процедуру del(L, k), которая удаляет в заданном списке L 
 k-ый элемент с конца. Решить задачу строго ЗА ОДИН ПРОХОД по списку L
 (решение за два прохода не принимается !!!)
 ----------------------------------------------------------------------
 СДАВАТЬ эту ЗАДАЧУ можно отдельными этапами, а можно сдать сразу все 
 3 обязательных этапа за один сеанс связи с проверяющим.
 ----------------------------------------------------------------------
 ТЕСТЫ задаёт проверяющий в режиме реального времени.
 Сдача дополнительных этапов возможна только после полной сдачи всех
 обязательных этапов.
 ---------------------------------------------------------------------
 Примечание: размер шрифта (в окне редактора и окне вывода следует 
 УВЕЛИЧИТЬ, чтобы проверяющему всё было ВИДНО ХОРОШО.
 ---------------------------------------------------------------------*)
program task_2(input, output);
uses heaptrc;
type
    integer = longint; {вводимые целые числа могут быть теперь от нуля и 
                        примерно до двух миллиардов}
    TE = 0..9;
    list = ^node;
    node = record
        elem: TE;
        next: list
    end;
var
    L: list;
    n {для этапа 1}, k {для этапа 5}, E: integer;
    
//////////////////////////////////////////////////////////////////////
////   далее располагаются описания ваших процедур и функций      ////
//////////////////////////////////////////////////////////////////////
function digits(n:integer): list;
var
    L, p: list;
begin
    L := nil;
    while n <> 0 do begin
        {if L = nil then begin
            new(L);
            L^.elem := n mod 10;
            L^.next := nil;
        end}
        {else begin}
            new(p);
            p^.next := L;
            p^.elem := n mod 10;
            L := p;
        {end;}
        n := n div 10;
    end;
    digits := L;
end;

procedure print(L: list);
begin
    if L <> nil then begin
        write(L^.elem,' ');
        {L := L^.next;}
        print(L^.next);
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

procedure move(var L: list);
var
    p: list;
begin
    p := L;
    if L^.next <> nil then begin
        while p^.next^.next <> nil do
            p := p^.next;
        p^.next^.next := L;
        L := p^.next;
        p^.next := nil;
    end;
end;

procedure cut(var L: list);
var
    p: list;
begin
    if L <> nil then begin
        if L^.elem = E then begin
            p := L;
            L := L^.next;
            dispose(p);
            cut(L);
        end
        else
            cut(L^.next);
    end;
end;

procedure reverse(var L: list);
var
    curr, prev, foll: list;
begin
    prev := nil;
    curr := L;
    while curr <> nil do begin
        foll := curr^.next;
        curr^.next := prev;
        prev := curr;
        curr := foll;
    end;
    L := prev;
end;

procedure del(var L: list; k: integer);
var
    prev, foll, p: list;
    i: integer;
    ok: boolean;
begin
    prev := L;
    foll := L;
    ok := false;
    if k < 8 then begin
        for i := 1 to k do begin
            if foll = nil then begin
                ok := true;
                write('error, setted "k" is bigger then list(!!!)  ');
            end
            else
                foll := foll^.next;
        end;
        if not ok then begin
            if foll = nil then begin 
                p := L;
                L := L^.next;
                dispose(p);
            end
            else begin
                while foll^.next <> nil do begin
                    foll := foll^.next;
                    prev := prev^.next;
                end;
                p := prev^.next;
                prev^.next := prev^.next^.next;
                dispose(p);
            end;
        end;
    end
    else
        write('error, setted "k" > 7(!!!)  ');
end;





begin
    {содержимое раздела операторов - менять с учётом сдаваемых этапов}
    {обязательно выводить название этапа, который сейчас выполняется}
    writeln('=====================');
    writeln('Task_2 (list actions)');
    writeln('=====================');
    writeln;
    {далее ваши операторы:}
    write('Please, enter "n": ');
    read(n);
    writeln('part_1');
    L := digits(n);
    print(L);
    writeln;
    {writeln('part_2');
    move(L);
    print(L);
    writeln;
    writeln('part_3');
    if L <> nil then begin
        E := L^.elem;
        cut(L^.next);
    end;
    print(L);
    writeln;
    writeln('part_4');
    reverse(L);
    print(L);
    writeln;}
    writeln('part_5');
    write('Please, enter "k": ');
    read(k);
    del(L,k);
    print(L);
    destroy(L);
    writeln;
    writeln;
end.
