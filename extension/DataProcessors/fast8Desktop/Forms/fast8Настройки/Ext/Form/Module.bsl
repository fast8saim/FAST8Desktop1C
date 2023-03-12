// MIT License
//
// Copyright (c) 2023 FAST8.RU
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Параметры.Свойство("fast8ИмяПользователя", fast8ИмяПользователя);
	 
	fast8КаталогКластера = ХранилищеОбщихНастроек.Загрузить("fast8КаталогКластера", "fast8Desktop");
	 
	Реквизиты = fast8СписокСохраняемыхРеквизитов();
	Для Каждого Реквизит Из Реквизиты Цикл
		ЭтотОбъект[Реквизит] = ХранилищеОбщихНастроек.Загрузить(Реквизит, "fast8Desktop",, fast8ИмяПользователя);
	КонецЦикла;
	fast8ПорядокВиджетов.Загрузить(ХранилищеОбщихНастроек.Загрузить("fast8ПорядокВиджетов", "fast8Desktop",, fast8ИмяПользователя));
	
КонецПроцедуры // ПриСозданииНаСервере()

#КонецОбласти // ОбработчикиСобытийФормы

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура fast8СохранитьНастройки(Команда)
	
	fast8СохранитьНастройкиНаСервере();
	Закрыть("fast8НастройкиИзменены");
	
КонецПроцедуры // fast8СохранитьНастройки()

#КонецОбласти // ОбработчикиКомандФормы

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура fast8СохранитьНастройкиНаСервере()
	
	ХранилищеОбщихНастроек.Сохранить("fast8КаталогКластера", "fast8Desktop", fast8КаталогКластера);
	
	Реквизиты = fast8СписокСохраняемыхРеквизитов();
	Для Каждого Реквизит Из Реквизиты Цикл
		ХранилищеОбщихНастроек.Сохранить(Реквизит, "fast8Desktop", ЭтотОбъект[Реквизит],, fast8ИмяПользователя);
	КонецЦикла;
	
	ХранилищеОбщихНастроек.Сохранить("fast8ПорядокВиджетов", "fast8Desktop", fast8ПорядокВиджетов.Выгрузить(),, fast8ИмяПользователя);
	
КонецПроцедуры // fast8СохранитьНастройкиНаСервере()

&НаСервере
Функция fast8СписокСохраняемыхРеквизитов()
	
	Реквизиты = Новый Массив;
	Реквизиты.Добавить("fast8ВысотаВиджета");
	Реквизиты.Добавить("fast8ЗапускатьАвтоматически");
	Реквизиты.Добавить("fast8КоличествоВиджетовПоВертикали");
	Реквизиты.Добавить("fast8КоличествоВиджетовПоГоризонтали");
	Реквизиты.Добавить("fast8ПериодАвтообновления");
	Реквизиты.Добавить("fast8ШиринаВиджета");
	Реквизиты.Добавить("fast8ЗакрыватьТолькоПоКнопке");
	
	Возврат Реквизиты;
	
КонецФункции // fast8СписокСохраняемыхРеквизитов()

#КонецОбласти // СлужебныеПроцедурыИФункции
