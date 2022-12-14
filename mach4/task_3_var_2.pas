{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//=====================================================================
// ЗАДАЧА 3 (вариант 2)  25 очков
//=====================================================================
// Описать рекурсивную функцию Multiply (a,b) для моделирования операции
// умножения двух целых чисел a и b, то есть операции «a*b» (считать, 
// что произведение не выйдет из диапазона  представимости  типа integer).  

// Требования к написанию функции:  1) нельзя использовать операции 
// умножения (*) и деления (div), нельзя использовать вещественную 
// арифметику и какие-либо стандартные функции;  2) в теле функции 
// запрещено использовать глоб. переменные, операторы цикла и перехода.

// В основной программе:  ввести два числа и вывести их произведение, 
// вычисленное с помощью  функции Multiply(a,b).  Затем (через знак = )
// напечатать  ответ, полученный традиционно, с использованием операции
// умножения, т.е. c помощью  a*b. В случае правильного решения – 
// ответы совпадут.  

// ПРИМЕРЫ: 
// 1) 30 50 --> 1500,  2) -30 50 --> -1500, 3) 30 -50 --> -1500,
// 4) -30 -50 --> 1500, 5) 0 -5 --> 0,  6) 5 0 --> 0, 7) 1 -100 --> -100,
// 8) 20 -1 --> -20
// (сдавать программу на этих примерах)
//=====================================================================

program task_3_var_2(input,output);  
type
    integer = longint; {расширили диапазон целых средствами Free Pascal}
   {теперь вместо диапазона -32768..+32767 имеем более широкий диапазон:
     -2147483648..+2147483647 для удобства тестирования программы}
var
    a, b: integer;

{описание функции Multiply(a,b) для моделирования операции умножения:}
function Multiply(a,b:integer):integer;
begin
    if (a = 0) or (b = 0) then
        Multiply := 0
    else if ((a < 0) and (b < 0)) or (b = (-1)) then
        Multiply := (-1) * a + Multiply(a, (b + 1))
    else if b < 0 then
        Multiply := a + Multiply(a, (b + 1))
    else
        Multiply := a + Multiply(a, (b - 1));
end;



begin
    writeln('=======================');
    writeln('Task_3_var_2 (Multiply)');
    writeln('=======================');
    writeln;
    
{применение функции Multiply(a,b) для решения задачи:}
    write('Please, set "a" and "b": ');
    read(a,b);
    writeln('"a" times "b" = ', (a * b), '=', Multiply(a,b));
    writeln;

end.
