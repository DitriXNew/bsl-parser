///////////////////////////////////////////////////////////////////////////////
//
// Содержит НСИ для разбора конфигураций
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС
///////////////////////////////////////////////////////////////////////////////

#Область КоллекцииОбъектов

Функция ТаблицаОписанияОбъектовКонфигурации() Экспорт
	
	ОбъектыКонфигурации = Новый ТаблицаЗначений;
	ОбъектыКонфигурации.Колонки.Добавить("Наименование");
	ОбъектыКонфигурации.Колонки.Добавить("Тип");
	ОбъектыКонфигурации.Колонки.Добавить("ПутьКФайлуСОписанием");
	ОбъектыКонфигурации.Колонки.Добавить("ПутьККаталогу");
	ОбъектыКонфигурации.Колонки.Добавить("Подсистемы");
	ОбъектыКонфигурации.Колонки.Добавить("Описание");
	ОбъектыКонфигурации.Колонки.Добавить("Родитель");

	Возврат ОбъектыКонфигурации;
	
КонецФункции

Функция ТаблицаОписанияМодулей() Экспорт
	
	МодулиКонфигурации = Новый ТаблицаЗначений;
	МодулиКонфигурации.Колонки.Добавить("ТипМодуля");
	МодулиКонфигурации.Колонки.Добавить("Родитель");
	МодулиКонфигурации.Колонки.Добавить("ПутьКФайлу");	
	МодулиКонфигурации.Колонки.Добавить("НаборБлоков");
	МодулиКонфигурации.Колонки.Добавить("Содержимое");
	МодулиКонфигурации.Колонки.Добавить("РодительФорма");
	МодулиКонфигурации.Колонки.Добавить("РодительКоманда");	
	МодулиКонфигурации.Колонки.Добавить("ОписаниеМодуля");
	
	Возврат МодулиКонфигурации;
	
КонецФункции

Функция ТаблицаОписанияПодсистем() Экспорт

	ОписаниеПодсистем = Новый ТаблицаЗначений;
	ОписаниеПодсистем.Колонки.Добавить("ОбъектМетаданных");
	ОписаниеПодсистем.Колонки.Добавить("Имя");
	ОписаниеПодсистем.Колонки.Добавить("Представление");
	ОписаниеПодсистем.Колонки.Добавить("ПодсистемаОписание");
	ОписаниеПодсистем.Колонки.Добавить("Визуальная");
	ОписаниеПодсистем.Колонки.Добавить("Родитель");
	ОписаниеПодсистем.Колонки.Добавить("ПредставлениеКратко");
	ОписаниеПодсистем.Колонки.Добавить("ИмяКратко");
	
	Возврат ОписаниеПодсистем;
	
КонецФункции

#КонецОбласти

#Область ОписанияОбъектовКонфигурации

Функция ОписаниеКонстанты() Экспорт
	
	ДанныеОписания = БазовоеОписание();
	ДобавитьВОписание(ДанныеОписания, "Тип", "type", , "ПолучитьТип");
	ДобавитьВОписание(ДанныеОписания, "Пояснение", "Explanation", Истина);
	
	Возврат ДанныеОписания;
	
КонецФункции

Функция ОписаниеКонфигурации() Экспорт
	
	ДанныеОписания = БазовоеОписание();
	ДобавитьВОписание(ДанныеОписания, "АвторскиеПрава", "Copyright", Истина);
	ДобавитьВОписание(ДанныеОписания, "АдресИнформацииОКонфигурации", "ConfigurationInformationAddress", Истина);
	ДобавитьВОписание(ДанныеОписания, "АдресИнформацииОПоставщике", "VendorInformationAddress", Истина);
	ДобавитьВОписание(ДанныеОписания, "АдресКаталогаОбновлений", "UpdateCatalogAddress");
	ДобавитьВОписание(ДанныеОписания, "ВариантВстроенногоЯзыка", "ScriptVariant");
	ДобавитьВОписание(ДанныеОписания, "Версия", "Version");
	ДобавитьВОписание(ДанныеОписания, "ВключатьСправкуВСодержание", "IncludeHelpInContents");
	ДобавитьВОписание(ДанныеОписания, "ДополнительнаяФормаКонстант", "AuxiliaryConstantsForm");
	ДобавитьВОписание(ДанныеОписания, "ДополнительныеСловариПолнотекстовогоПоиска", "AdditionalFullTextSearchDictionaries");
	ДобавитьВОписание(ДанныеОписания, "Заставка", "Splash");
	ДобавитьВОписание(ДанныеОписания, "ИнтерфейсКлиентскогоПриложения", "ClientApplicationInterface");
	ДобавитьВОписание(ДанныеОписания, "ИспользоватьОбычныеФормыВУправляемомПриложении", "UseOrdinaryFormInManagedApplication");
	ДобавитьВОписание(ДанныеОписания, "ИспользоватьУправляемыеФормыВОбычномПриложении", "UseManagedFormInOrdinaryApplication");
	ДобавитьВОписание(ДанныеОписания, "КартинкаОсновногоРаздела", "MainSectionPicture");
	ДобавитьВОписание(ДанныеОписания, "КомандныйИнтерфейс", "CommandInterface");
	ДобавитьВОписание(ДанныеОписания, "КомандныйИнтерфейсОсновногоРаздела", "MainSectionCommandInterface");
	ДобавитьВОписание(ДанныеОписания, "КраткаяИнформация", "BriefInformation", Истина);
	ДобавитьВОписание(ДанныеОписания, "Логотип", "Logo");
	ДобавитьВОписание(ДанныеОписания, "МодульВнешнегоСоединения", "ExternalConnectionModule");
	ДобавитьВОписание(ДанныеОписания, "МодульОбычногоПриложения", "OrdinaryApplicationModule");
	ДобавитьВОписание(ДанныеОписания, "МодульСеанса", "SessionModule");
	ДобавитьВОписание(ДанныеОписания, "МодульУправляемогоПриложения", "ManagedApplicationModule");
	ДобавитьВОписание(ДанныеОписания, "НазначениеРасширенияКонфигурации", "ConfigurationExtensionPurpose");
	ДобавитьВОписание(ДанныеОписания, "НазначенияИспользования", "UsePurposes");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаВариантаОтчета", "DefaultReportVariantForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаКонстант", "DefaultConstantsForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаНастроекДинамическогоСписка", "DefaultDynamicListSettingsForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаНастроекОтчета", "DefaultReportSettingsForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаОтчета", "DefaultReportForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнаяФормаПоиска", "DefaultSearchForm");
	ДобавитьВОписание(ДанныеОписания, "ОсновнойИнтерфейс", "DefaultInterface");
	ДобавитьВОписание(ДанныеОписания, "ОсновнойРежимЗапуска", "DefaultRunMode");
	ДобавитьВОписание(ДанныеОписания, "ОсновнойСтиль", "DefaultStyle");
	ДобавитьВОписание(ДанныеОписания, "ОсновнойЯзык", "DefaultLanguage");
	ДобавитьВОписание(ДанныеОписания, "ОсновныеРоли", "DefaultRoles");
	ДобавитьВОписание(ДанныеОписания, "ПодробнаяИнформация", "DetailedInformation", Истина);
	ДобавитьВОписание(ДанныеОписания, "Поставщик", "Vendor");
	ДобавитьВОписание(ДанныеОписания, "ПрефиксИмен", "NamePrefix");
	ДобавитьВОписание(ДанныеОписания, "ПринадлежностьОбъекта", "ObjectBelonging");
	ДобавитьВОписание(ДанныеОписания, "РабочаяОбластьНачальнойСтраницы", "HomePageWorkArea");
	ДобавитьВОписание(ДанныеОписания, "РежимАвтонумерацииОбъектов", "ObjectAutonumerationMode");
	ДобавитьВОписание(ДанныеОписания, "РежимИспользованияМодальности", "ModalityUseMode");
	ДобавитьВОписание(ДанныеОписания, "РежимИспользованияСинхронныхВызововРасширенийПлатформыИВнешнихКомпонент", "SynchronousPlatformExtensionAndAddInCallUseMode");
	ДобавитьВОписание(ДанныеОписания, "РежимОсновногоОкнаКлиентскогоПриложения", "MainClientApplicationWindowMode");
	ДобавитьВОписание(ДанныеОписания, "РежимСовместимости", "CompatibilityMode");
	ДобавитьВОписание(ДанныеОписания, "РежимСовместимостиИнтерфейса", "InterfaceCompatibilityMode");
	ДобавитьВОписание(ДанныеОписания, "РежимСовместимостиРасширенияКонфигурации", "ConfigurationExtensionCompatibilityMode");
	ДобавитьВОписание(ДанныеОписания, "РежимУправленияБлокировкойДанных", "DataLockControlMode");
	ДобавитьВОписание(ДанныеОписания, "РодительскиеКонфигурации", "ParentConfigurations");
	ДобавитьВОписание(ДанныеОписания, "Справка", "Help");
	ДобавитьВОписание(ДанныеОписания, "ТребуемыеРазрешенияМобильногоПриложения", "RequiredMobileApplicationPermissions");
	ДобавитьВОписание(ДанныеОписания, "ФрагментКомандногоИнтерфейса", "CommandInterfaceFragment");
	ДобавитьВОписание(ДанныеОписания, "ХранилищеВариантовОтчетов", "ReportsVariantsStorage");
	ДобавитьВОписание(ДанныеОписания, "ХранилищеНастроекДанныхФорм", "FormDataSettingsStorage");
	ДобавитьВОписание(ДанныеОписания, "ХранилищеОбщихНастроек", "CommonSettingsStorage");
	ДобавитьВОписание(ДанныеОписания, "ХранилищеПользовательскихНастроекДинамическихСписков", "DynamicListsUserSettingsStorage");
	ДобавитьВОписание(ДанныеОписания, "ХранилищеПользовательскихНастроекОтчетов", "ReportsUserSettingsStorage");
	
	ДобавитьВОписание(ДанныеОписания, "HTTPСервисы", "HTTPServices", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "WebСервисы", "WebServices", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "WSСсылки", "WSReferences", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "БизнесПроцессы", "businessProcesses", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ВнешниеИсточникиДанных", "ExternalDataSources", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ГруппыКоманд", "CommandGroups", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Документы", "Documents", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ЖурналыДокументов", "DocumentJournals", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Задачи", "Tasks", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Интерфейсы", "Interfaces", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Константы", "Constants", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "КритерииОтбора", "FilterCriteria", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "НумераторыДокументов", "DocumentNumerators", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Обработки", "DataProcessors", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеКартинки", "CommonPictures", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеКоманды", "CommonCommands", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеМакеты", "CommonTemplates", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеМодули", "CommonModules", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеРеквизиты", "CommonAttributes", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОбщиеФормы", "CommonForms", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ОпределяемыеТипы", "DefinedTypes", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Отчеты", "Reports", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПакетыXDTO", "XDTOPackages", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПараметрыСеанса", "SessionParameters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПараметрыФункциональныхОпций", "FunctionalOptionsParameters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Перечисления", "Enums", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПланыВидовРасчета", "ChartsOfCalculationTypes", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПланыВидовХарактеристик", "ChartsOfCharacteristicTypes", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПланыОбмена", "ExchangePlans", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПланыСчетов", "ChartsOfAccounts", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ПодпискиНаСобытия", "EventSubscriptions", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Подсистемы", "Subsystems", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Последовательности", "Sequences", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "РегистрыБухгалтерии", "AccountingRegisters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "РегистрыНакопления", "AccumulationRegisters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "РегистрыРасчета", "CalculationRegisters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "РегистрыСведений", "InformationRegisters", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "РегламентныеЗадания", "ScheduledJobs", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Роли", "Roles", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Справочники", "Catalogs", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Стили", "Styles", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ФункциональныеОпции", "FunctionalOptions", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ХранилищаНастроек", "SettingsStorages", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "ЭлементыСтиля", "StyleItems", , , Истина);
	ДобавитьВОписание(ДанныеОписания, "Языки", "Languages", , , Истина);

	Возврат ДанныеОписания;
	
КонецФункции

Функция ОписаниеПодсистемы() Экспорт
	
	ДанныеОписания = БазовоеОписание();
	
	ДобавитьВОписание(ДанныеОписания, "ВключатьВКомандныйИнтерфейс", "IncludeInCommandInterface");
	ДобавитьВОписание(ДанныеОписания, "ВключатьВСодержимоеСправки", "IncludeHelpInContents");
	ДобавитьВОписание(ДанныеОписания, "Пояснение", "Explanation", Истина);
	ДобавитьВОписание(ДанныеОписания, "Картинка", "Picture");
	ДобавитьВОписание(ДанныеОписания, "Состав", "Content", , "ПрочитатьСостав", Истина);

	Возврат ДанныеОписания;
	
КонецФункции

Функция БазовоеОписание()
	
	ДанныеОписания = Новый Структура();
	ДобавитьВОписание(ДанныеОписания, "Наименование", "Name");
	ДобавитьВОписание(ДанныеОписания, "Синоним", "Synonym", Истина);
	ДобавитьВОписание(ДанныеОписания, "Комментарий", "Comment");
	
	Возврат ДанныеОписания;
	
КонецФункции

#КонецОбласти

Функция ИменаТиповМетаданных() Экспорт
	
	Возврат 
	"languages,
	|subsystems,
	|commonPictures,
	|sessionParameters,
	|roles,
	|commonTemplates,
	|filterCriteria,
	|commonModules,
	|commonAttributes,
	|exchangePlans,
	|xDTOPackages,
	|webServices,
	|httpServices,
	|eventSubscriptions,
	|scheduledJobs,
	|functionalOptions,
	|functionalOptionsParameters,
	|definedTypes,
	|commonCommands,
	|commandGroups,
	|constants,
	|commonForms,
	|catalogs,
	|enums,
	|reports,
	|dataProcessors,
	|informationRegisters,
	|chartsOfCharacteristicTypes";
	
КонецФункции

Функция ОписаниеОбъектаКонфигурацииЗначенияПоУмолчанию() Экспорт
	
	Возврат Новый Структура(
	"Наименование, Тип, ПутьКФайлуСОписанием, ПутьККаталогу, Подсистемы, Описание, Родитель", 
	"", "", "", "", Новый Массив);
	
КонецФункции


///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ
///////////////////////////////////////////////////////////////////////////////

Процедура ДобавитьВОписание(Описание, Имя, ИмяПоля, Многоязычный = Ложь, ФункцияПреобразования = Неопределено, Коллекция = Ложь)
	
	Описание.Вставить(Имя, Новый Структура("Поле, Многоязычный, ФункцияПреобразования, Коллекция", ИмяПоля, Многоязычный, ФункцияПреобразования, Коллекция));
	
КонецПроцедуры