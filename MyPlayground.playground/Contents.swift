//Домашнее задание №1
 /*
  1. Решить квадратное уровнение.
  2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
  3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через Х лет.
 */
 import Darwin

 print("1. Решить квадратное уровнение.")
 // ax2+bx+c=0
 let a:Double = 1
 let b:Double = 12
 let c:Double = 36
 print("Коэффициенты a=\(a) b=\(b) c=\(c)")
//Находим дискриминант D
 let D = pow(b, 2) - 4 * a * c
 print("D=", D)
 // Если D < 0, корней нет
 // Если D = 0, есть ровно один корень
 // Если D > 0, корней будет два
 if D < 0 {
    print("Корней нет D<0")
 }
 else if D == 0{
    let x:Double = -b/(2*a)
    print("Корень один D=0")
    print("x=" ,x)
 }
 else if D > 0{
    let x1:Double = (-b + sqrt(D))/(2*a)
    let x2:Double = (-b - sqrt(D))/(2*a)
    print("Корей два D>0")
    print("x1=" , x1)
    print("x2=" , x2)
 }

print("2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.")
let katet1:Float = 3 //Катет 1
let katet2:Float = 3 //Катет 2
print("Длина катета1:",katet1," Длина катета2:",katet2)
//Площадь
let S:Float = 0.5 * katet1 * katet2
print("Площадь прямоугольного тркугольника:",S)
let G:Float = sqrt(pow(katet1, 2) + pow(katet2,2))
print("Длина гипотенузы:",G)
let P:Float = katet1 + katet2 + G
print("Периметр треугольника:",P)

print("3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через Х лет.")
let summ:Float = 5000.0
let proc:Float = 6.5
let years:Int  = 5
print("Сумма вклада \(summ). Годовой процент \(proc). Количество лет \(years)")
let resultSumm:Float = pow((1 + proc/100),Float(years)) * summ
print("Итоговая сумма вклада ",resultSumm)
