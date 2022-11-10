{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//=====================================================================
// ЗАДАЧА 4 (вариант 2)  20 очков 
//=====================================================================
(*
Ввести (с клавиатуры) непустую последовательность натуральных чисел 
(признак конца последовательности – 0, причём ноль в состав 
последовательности не входит). Вывести минимальное число этой 
последовательности и количество его вхождений. Требование: 
запрещено пользоваться операторами цикла, перехода, массивами, файлами
(т.е. решать задачу надо рекурсивно).

В конце текста программы (после точки) представлены тесты, на которых
будет проверяться работа этой программы (тесты не удалять!)
*)
//=====================================================================


program Task_4_var_2(input,output);
{здесь, кроме имеющихся, располагаются другие необходимые описания}
var
    min {минимум}, count {число его вхождений}, n: integer;
procedure MinFind;
begin
    if n <> 0 then begin
        if n < min then begin
            min := n;
            count := 1;
        end
        else if n = min then
            count := count + 1;
        read(n);
        MinFind;
    end;
end;

begin
    writeln('=======================');
    writeln('Task_4_var_2 (CountMin)');
    writeln('=======================');
   
    {здесь расположите необходимые операторы для решения задачи}
    read(n);
    count := 0;
    min := n;
    MinFind;
    writeln('minimum ', min, ' is included ', count, ' times' )
end.
{
test 1:

1 4 5 6 1 8 90 1 1 1 2 0

min = 1  count = 5

---------------------------------------------------
test 2:

1 0

min = 1     count = 1

---------------------------------------------------
test 3:

5 5 10 34 78 90 5 5 5 5 0

min = 5    count = 6

----------------------------------------------------
}

