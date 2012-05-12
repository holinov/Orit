Примеры запросов и ответов


Краткие выписки
ЮЛ
1. SendShortULRequest.xml - Запрос краткой выписки по ЮЛ
2. SendShortULRequestResponse.xml - Ответ на запрос краткой выписки по ЮЛ
3. SendShortULRequestFault_81 - Квитанция - несовпадение ЭЦП
4. SendShortULRequestResponse_01.xml - Ответ на запрос краткой выписки по ЮЛ - данные не найдены
5. SendShortULRequestResponse_99.xml - Сообщение о внутренней ошибке ПО


ФЛ
1. SendShortFLRequest.xml - Запрос краткой выписки по ИП
2. SendShortFLRequestResponse.xml - Ответ на запрос краткой выписки по ИП (закрытые сведения)
3. SendShortFLRequestResponse_PUBLIC.xml - Ответ на запрос краткой выписки по ИП (открытые сведения)
4. SendShortFLRequestFault_81 - Квитанция - несовпадение ЭЦП
5. SendShortFLRequestResponse_01.xml - Ответ на запрос краткой выписки по ИП - данные не найдены
6. SendShortFLRequestResponse_99.xml - Сообщение о внутренней ошибке ПО


Полные выписки
ЮЛ
1. SendFullULRequest.xml - Регистрация запроса на получение полной выписки по ЮЛ
2. SendFullULRequestResponse.xml - Ответ на регистрацию запроса полной выписки по ЮЛ (квитанция)
3. GetFullULResponse.xml - Получение результата обработки запроса полной выписки по ЮЛ
4.1 GetFullULResponseResponse.xml - Полная выписка ЮЛ (закрытые сведения)
4.2 GetFullULResponseResponse_PUBLIC.xml - Полная выписка ЮЛ (открытые сведения)
4.3 GetFullULResponseResponseFault_52.xml - Сообщение о неготовности выписки 
4.4 GetFullULResponseResponseFault_99.xml - Сообщение о внутренней ошибке ПО


Полные выписки
ИП
1. SendFullFLRequest.xml - Регистрация запроса на получение полной выписки по ИП
2. SendFullFLRequestResponse.xml - Ответ на регистрацию запроса полной выписки по ИП (квитанция)
3. GetFullFLResponse.xml - Получение результата обработки запроса полной выписки по ИП
4.1 GetFullFLResponseResponse.xml - Полная выписка ИП (закрытые сведения)
4.2 GetFullFLResponseResponse_PUBLIC.xml - Полная выписка ИП (открытые сведения)
4.3 GetFullFLResponseResponseFault_52.xml - Сообщение о неготовности выписки 
4.4 GetFullFLResponseResponseFault_99.xml - Сообщение о внутренней ошибке ПО

Квитанции
1. SendConfirmRequest.xml - квитанция о приеме ответа
2. SendConfirmRequestResponse.xml - ответ о приеме квитанции сервисом
3. SendConfirmResponseFault_83.xml - ошибка при приеме квитанции сервисом - документ не найден

Диагностика
1. TestRequest.xml - Проверка доступности сервиса
2. TestRequest.xml - Ответ на запрос на проверку доступности сервиса



FNS-EGRWS-TEST-SUITE-soapui-project.xml
Готовый проект для тестирования с помощью утилиты soapUI


Адреса точек доступа:

СМЭВ
http://46.61.162.210:7777/gateway/services/SID0003285?wsdl

Тестовый контур ЗАО "Юнисофт"
Выписки - закрытые сведения
http://94.125.90.50:6336/FNSEGRWS/FNSEGRService?wsdl
Выписки - открытые сведения
http://94.125.90.50:6336//FNSEGRWS?wsdl 
