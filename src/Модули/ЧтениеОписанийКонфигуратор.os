///////////////////////////////////////////////////////////////////////////////
//
// Модуль для чтения описаний метаданных 1с из XML выгрузки
//
///////////////////////////////////////////////////////////////////////////////

#Использовать reflector

///////////////////////////////////////////////////////////////////////////////

Перем Рефлектор;

///////////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС
///////////////////////////////////////////////////////////////////////////////

// Выполняет чтение описания объекта с учетом параметров
//
// Параметры:
//   ТекстОписания - Строка - Описание объекта
//   ПараметрыЧтения - Структура - Настройки обработки полей
//
//  Возвращаемое значение:
//   Структура - Данные описания
//
Функция ПолучитьСвойства(ТекстОписания, ПараметрыЧтения = Неопределено) Экспорт

	СвойстваОписания = Новый Структура();

	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.УстановитьСтроку(ТекстОписания);
	
	ПрочитатьСвойстваXML(ЧтениеXML, СвойстваОписания, ПараметрыЧтения);
	
	ЧтениеXML.Закрыть();
	
	Если ПараметрыЧтения <> Неопределено Тогда
		
		СвойстваОписания = ВыполнитьОбработкуПрочитанныхСвойств(СвойстваОписания, ПараметрыЧтения);
		
	КонецЕсли;
	
	Возврат СвойстваОписания;
	
КонецФункции

// Выполняет чтение описания объекта с учетом параметров
//
// Параметры:
//   ИмяФайла - Строка - Путь к файлу описания
//   ПараметрыЧтения - Структура - Настройки обработки полей
//
//  Возвращаемое значение:
//   Структура - Данные описания
//
Функция ПрочитатьСвойстваИзФайла(ИмяФайла, ПараметрыЧтения = Неопределено) Экспорт

	СвойстваОписания = Новый Структура();

	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.ОткрытьФайл(ИмяФайла);
	
	ПрочитатьСвойстваXML(ЧтениеXML, СвойстваОписания, ПараметрыЧтения);
	
	ЧтениеXML.Закрыть();
	
	Если ПараметрыЧтения <> Неопределено Тогда
		
		СвойстваОписания = ВыполнитьОбработкуПрочитанныхСвойств(СвойстваОписания, ПараметрыЧтения);
		
	КонецЕсли;
	
	Возврат СвойстваОписания;

КонецФункции

// Читает файл Configuration
//
// Параметры:
//   ИмяФайла - Строка - Путь к файлу описания
//
//  Возвращаемое значение:
//   Структура - Описание конфигурации
//		* СвойстваКонфигурации - свойства конфигурации
//		* ОбъектыКонфигурации - коллекция объектов конфигурации
//
Функция ПрочитатьОписаниеКонфигурации(ИмяФайла) Экспорт
	
	СвойстваКонфигурации = Новый Структура;
	
	ОбъектыКонфигурации = СтруктурыОписаний.ТаблицаОписанияОбъектовКонфигурации();
	
	ПустаяСтрокаОбъектКонфигурации = СтруктурыОписаний.ОписаниеОбъектаКонфигурацииЗначенияПоУмолчанию();
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.ОткрытьФайл(ИмяФайла);

	Пока ЧтениеXML.Прочитать() Цикл
		
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.Имя = "Properties" Тогда

			// Настройки
			Пока НЕ (ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.Имя = "Properties") Цикл

				ЧтениеXML.Прочитать();
				КлючСвойства = "";
				Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда

					Если ЧтениеXML.Имя = "RequiredMobileApplicationPermissions" Тогда // атрибуты мобильного приложения

						Пока НЕ (ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.Имя = "RequiredMobileApplicationPermissions") Цикл
								
							ЧтениеXML.Прочитать();

						КонецЦикла;

					Иначе

						КлючСвойства = ЧтениеXML.Имя;
						ЧтениеXML.Прочитать();
							
						Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда // вложенный элемент
							
							Если ЧтениеXML.Имя = "v8:item" Тогда // надо найти элемент с именем v8:content

								Пока ЧтениеXML.Имя <> "v8:content" Цикл
									
									ЧтениеXML.Прочитать();

								КонецЦикла;
								ЧтениеXML.Прочитать();

							Иначе // просто ищем значение

								Пока ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Цикл
									
									ЧтениеXML.Прочитать();

								КонецЦикла;

							КонецЕсли;
							
						КонецЕсли;
						
						СвойстваКонфигурации.Вставить(КлючСвойства, ЧтениеXML.Значение);						

					КонецЕсли;

				КонецЕсли;

			КонецЦикла;

		ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.Имя = "ChildObjects" Тогда

			ЧтениеXML.Прочитать();
			// подчиненные элементы (первый уровень)
			Пока ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Цикл
				
				НовСтрока = ОбъектыКонфигурации.Добавить();
				ЗаполнитьЗначенияСвойств(НовСтрока, ПустаяСтрокаОбъектКонфигурации);
				НовСтрока.Тип = ТипыОбъектовКонфигурации.НормализоватьИмя(ЧтениеXML.Имя);
				ЧтениеXML.Прочитать();
				НовСтрока.Наименование = ЧтениеXML.Значение;
				НовСтрока.ПолноеНаименование = НовСтрока.Тип + "." + НовСтрока.Наименование;
				ЧтениеXML.Прочитать();				
				ЧтениеXML.Прочитать();

			КонецЦикла  			
					
		КонецЕсли;
		
	КонецЦикла;
	
	ЧтениеXML.Закрыть();
	
	Возврат Новый Структура("СвойстваКонфигурации, ОбъектыКонфигурации" ,СвойстваКонфигурации , ОбъектыКонфигурации);
			
КонецФункции

///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЙ ПРОГРАММНЫЙ ИНТЕРФЕЙС
///////////////////////////////////////////////////////////////////////////////

#Область МетодыЧтения

// Читает строку на разных языках
//
// Параметры:
//   ЧтениеXML - ЧтениеXML - Читатель данных
//
//  Возвращаемое значение:
//   Строка - Данные строки
//
Функция МногоязычнаяСтрока(Знач ЧтениеXML) Экспорт
	
	Имя = ЧтениеXML.Имя;

	Пока ЧтениеXML.Имя <> "v8:content" Цикл
		
		Если ЧтениеXML.Имя = Имя И ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента Тогда
			
			Возврат "";
			
		КонецЕсли;

		ЧтениеXML.Прочитать();
		
	КонецЦикла;
	
	ЧтениеXML.Прочитать();
	Значение = ЧтениеXML.Значение;
	
	ЧтениеXML.Прочитать();

	Возврат Значение;

КонецФункции

// Читает описание типа
//
// Параметры:
//   ЧтениеXML - ЧтениеXML - Читатель данных
//
//  Возвращаемое значение:
//   Строка - Значение типа
//
Функция ПолучитьТип(Знач ЧтениеXML) Экспорт
	
	Пока ЧтениеXML.Имя <> "v8:Type" Цикл
									
		ЧтениеXML.Прочитать();
		
	КонецЦикла;
	
	ЧтениеXML.Прочитать();
	Значение = ЧтениеXML.Значение;

	Пока ЧтениеXML.Имя <> "Type" Цикл
		
		ЧтениеXML.Прочитать();

	КонецЦикла;
	
	Возврат ЧтениеОписанийБазовый.ПреобразоватьТип(Значение);

КонецФункции

Функция ЗначениеБулево(Знач Значение) Экспорт
	
	Возврат СтрСравнить(Значение, "true") = 0;
	
КонецФункции

#КонецОбласти

// Читает состав подсистемы
//
// Параметры:
//   ЧтениеXML - ЧтениеXML - Читатель данных
//
//  Возвращаемое значение:
//   Массив - Состав подсистемы
//
Функция ПрочитатьСостав(Знач ЧтениеXML) Экспорт
	
	Значение = Новый Массив();
	
	Пока ЧтениеXML.Прочитать() И НЕ (ЧтениеXML.Имя = "Content" И ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента)  Цикл
		
		Если ЧтениеXML.ИмеетЗначение Тогда
			
			Строка = ЧтениеXML.Значение;
			
			Позиция = СтрНайти(Строка, ".");

			Если Позиция > 0 Тогда
				
				Значение.Добавить(ТипыОбъектовКонфигурации.НормализоватьИмя(Лев(Строка, Позиция - 1)) + Сред(Строка, Позиция));

			Иначе
				
				Значение.Добавить(ЧтениеXML.Значение);
				
			КонецЕсли
			
		КонецЕсли;

	КонецЦикла;
	
	Возврат Значение;
	
КонецФункции

///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ
///////////////////////////////////////////////////////////////////////////////

Функция ВыполнитьОбработкуПрочитанныхСвойств(СырыеДанные, ПараметрыЧтения)
	
	СвойстваОписания = Новый Структура();
	
	Для Каждого Параметр Из ПараметрыЧтения Цикл
		
		Значение = Неопределено;
		
		Если НЕ СырыеДанные.Свойство(Параметр.Значение.Поле, Значение) Тогда
			
			Значение = "";
			
		КонецЕсли;

		Значение = ОбработатьСвойство(Значение, Параметр.Значение);

		СвойстваОписания.Вставить(Параметр.Ключ, Значение);
		
	КонецЦикла;
	
	Возврат СвойстваОписания;
	
КонецФункции

Функция ОбработатьСвойство(Значение, Параметр)
	
	Если ПустаяСтрока(Значение) И Параметр.Коллекция Тогда
		
		Возврат Новый Массив();
		
	ИначеЕсли ПустаяСтрока(Значение) Тогда
		
		Возврат Значение;
		
	ИначеЕсли Параметр.Коллекция И ТипЗнч(Значение) <> Тип("Массив") Тогда
		
		Результат = Новый Массив();
		Результат.Добавить(Значение);
		Значение = Результат;

	КонецЕсли;
	
	Возврат Значение;
	
КонецФункции

Функция ПрочитатьСвойстваXML(ЧтениеXML, Данные, ПараметрыЧтения)
	
	ОбработчикиПолей = Новый Структура();
	
	Если ПараметрыЧтения <> Неопределено Тогда
		
		Для Каждого Элемент Из ПараметрыЧтения Цикл
			
			Параметр = Элемент.Значение;
			Если ПустаяСтрока(Параметр.ФункцияПреобразования) И Параметр.Многоязычный Тогда
				
				ОбработчикиПолей.Вставить(ВРег(Параметр.Поле), "МногоязычнаяСтрока");
				
			ИначеЕсли НЕ ПустаяСтрока(Параметр.ФункцияПреобразования) Тогда
				
				ОбработчикиПолей.Вставить(ВРег(Параметр.Поле), Параметр.ФункцияПреобразования);
				
			КонецЕсли;
			
		КонецЦикла;
		
	КонецЕсли;

	Пока ЧтениеXML.Прочитать() Цикл
		
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента И ЧтениеXML.Имя = "Properties" Тогда

			Уровень = ЧтениеXML.КонтекстПространствИмен.Глубина;
			// Настройки
			Пока НЕ (ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.Имя = "Properties") Цикл

				ЧтениеXML.Прочитать();
				КлючСвойства = "";
				Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда

					Если ЧтениеXML.Имя = "RequiredMobileApplicationPermissions" Тогда // атрибуты мобильного приложения

						Пока НЕ (ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.Имя = "RequiredMobileApplicationPermissions") Цикл
								
							ЧтениеXML.Прочитать();

						КонецЦикла;

					Иначе

						КлючСвойства = ЧтениеXML.ЛокальноеИмя;
						
						Если ОбработчикиПолей.Свойство(ВРег(КлючСвойства)) Тогда
							
							ЗначениеВМассиве = Новый Массив();
							ЗначениеВМассиве.Добавить(ЧтениеXML);
							
							Значение = Рефлектор.ВызватьМетод(ЭтотОбъект, ОбработчикиПолей[КлючСвойства], ЗначениеВМассиве);
							
						Иначе

							ЧтениеXML.Прочитать();
							
							Уровень = ЧтениеXML.КонтекстПространствИмен.Глубина;
							Пока ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Цикл
									
								ЧтениеXML.Прочитать();
								
							КонецЦикла;

							Значение = ЧтениеXML.Значение;

							Пока Уровень < ЧтениеXML.КонтекстПространствИмен.Глубина Цикл
									
								ЧтениеXML.Прочитать();
								
							КонецЦикла;

						КонецЕсли;

						Данные.Вставить(КлючСвойства, Значение);						

					КонецЕсли;

				КонецЕсли;

			КонецЦикла;

		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Данные;

КонецФункции

Рефлектор = Новый Рефлектор();