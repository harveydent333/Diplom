1. Сделать валидацию на проверку добавления темы. если выбранного раздела не существует.
если поле раздела пусто - то выключить поле темы

2. Создать дефолтный конфигурационные настройки, при (создании формы добавления темы, после нажатия и успешного добавления темы)

3. Добавить, при создании формы добавления темы и заполнения выпадающего списка, брался код раздела, который первый в списке выпадающего списка и появлялась кнопка и поле ввода названия темы,
а выключать его при стирании текста из выпадающего списка

4. Тоже самое для формы добавления раздела

5. !! Важное замечание, если удалили разделы и заходим в темы, там список уже сформирован, нужно сжделать так, что бы послед удаления раздела перезапускался список тем и ниже, т.е после удаления того, у кого что то в подчинении - эти таблицы перезапускать 

6. протестировать ввод символо в полях создания тем, глянуть как быстро прогружается

7. если уже есть пользователь "ученик" с ФИО 1 в 1 т.е два одинаковых, то к логину добавлять +1, начинать счет с 0

8. ПРИ изменении темы, проверять не меняется ли название темы на уже созданное название 	+

9. Отключать кнопки Редактировать, если Темы нет или Лекции и т д, на формах CRUD

10. Подумать, возможно ли сделать, что б во всем приложении было видно какая роль у авторизированного пользователя // если делать то прописать из конфига

11. Чуть переделать, когда Edit1 не видно, во время update и раздел пустой, сделать ддругую ошибку на это

12. Предусмотреть еще, закрытие формы через крестик

13. при редактировании раздела, сообщение об успешном добалвении

14. hint поправить на формах

15. проверка login на уникальность при регистрации учителя

16 Валидация для полей, во всей проге найти

17. отработать формы

18. убрать костыль с Группой на форме авторизации