INSERT INTO ORDERS(TOTAL_PRICE,ORDER_DATE)
VALUES
(101,'28/04/2021'),
(110,'28/04/2021'),
(119,'29/04/2021'),
(106,'29/04/2021'),
(109,'29/04/2021'),
(105,'30/04/2021'),
(102,'30/04/2021'),
(104,'30/04/2021'),
(108,'02/05/2021'),
(110,'02/05/2021'),
(118,'02/05/2021'),
(112,'02/05/2021'),
(105,'04/05/2021'),
(107,'04/05/2021'),
(111,'06/05/2021'),
(112,'07/05/2021'),
(116,'07/05/2021'),
(103,'07/05/2021'),
(112,'09/05/2021'),
(101,'12/05/2021');

INSERT INTO PAYMENT(ORDER_ID, PAYMENT_METHOD, TOTAL_PRICE, CREDIT_CARD_NO,EXPIRY_DATE,SECURITY_NO,OWNER_NAME, DATE_PAID)
VALUES
(100, 'card', 20 ,'4929173930006460','08/21','313','Gilberto Boyd', '16/04/2021'),
(116, 'card', 401 ,'4539739839449860','02/23','730','Mabel Osborne', '24/04/2021'),
(115, 'card', 21 ,'5292168973269617','06/22','894','Frankie Wong', '27/01/2021'),
(117, 'card', 35,'6011869167040429','07/22','828','Jenny Barton', '18/04/2021'),
(114, 'card', 25 ,'373543407522463','08/22','232','Bert Cross', '05/05/2021'),
(113, 'card', 40 ,'372670995228475','11/23','913','Jean Meyer', '01/01/2021'),
(101, 'card', 256 ,'6011685489117996','01/24','039','Amos Bryan', '13/03/2021'),
(118, 'card', 34 ,'5148885120269846','01/24','734','Archie Adkins', '15/05/2021'),
(119, 'card', 423 ,'4556171645221465','04/23','705','Craig Austin', '01/01/2021'),
(112, 'card', 56 ,'4539762109128519','08/24','489','Michael Steele', '28/03/2021'),
(102, 'card', 234 ,'4024007138918270','10/25','996','Pamela Ford', '07/03/2021'),
(111, 'card', 34 ,'6011296043284676','02/23','958','Beulah Curry', '20/04/2021'),
(103, 'other', 324 ,'5499926173256135','09/22','966','Percy Chambers', '05/02/2021'),
(110, 'other', 23 ,'5199004694447600','07/22','847','Daisy Baker', '22/04/2021'),
(104, 'other', 52 ,'5460429054649267','05/21','416','Kara Gibson', '02/05/2021'),
(109, 'other', 35 ,'6011551047373317','03/23','515','Micheal Colon', '19/03/2021'),
(108, 'other', 53 ,'342275735127842','04/24','810','Nichole Perez', '10/03/2021'),
(105, 'other', 23 ,'6011970342978788','05/22','865','Lela Jensen', '08/03/2021'),
(107, 'other', 53 ,'343247561690929','03/22','284','Nadine Moran', '30/01/2021'),
(106, 'other', 56 ,'349714273935797','07/23','602','Sheri Fletcher', '23/02/2021');


insert into CUSTOMER("Customer Email","Customer Password","Customer Firstname","Customer Lastname", "Customer PhoneNum", "Customer Address", "Customer DOB", "Customer Point")
values
('Jan@gmail.com','456','Jane','Murphy','0417864508','256 Bankstown st','2020-04-16',0),
('Feb@gmail.com','789','Februa','Murphy','0785655708','298 Punchbowl st','2020-07-26',0),
('March@gmail.com','153','March','Murphy','0415565708','125 Chullola st','2021-04-16',0),
('April@gmail.com','723','April','Murphy','0427781508','299 Canterbury st','2021-02-06',0),
('May@gmail.com','423','May','Murphy','0415661708','412 Redfern st','2020-07-11',0),
('June@gmail.com','754','June','Murphy','0466887068','299 Campsie st','2020-09-15',0),
('July@gmail.com','173','July','Murphy','0445681508','299 Sydnhem st','2021-04-17',0),
('August@gmail.com','183','August','Murphy','0422456808','299 Wolli Creek st','2020-05-26',0),
('September@gmail.com','153','September','Murphy','0415641708','299 Lakemba st','2020-09-16',0),
('test9@gmail.com','Quy!1234','Otobers','Murphy','0415651708','299 Macqueries field st','2021-07-12',0),
('October@gmail.com','103','Otobers','Murphy','0415651708','299 Macqueries field st','2021-07-12',0);

insert into STAFF("Staff Email","Staff Password","Staff Firstname","Staff Lastname", "Staff PhoneNum", "Staff Address", "Staff DOB")
values
('Jane.Murphy@gmail.com','456','Jane','Murphy','0417864508','256 Bankstown st','2020-04-16'),
('Februa.Murphy@gmail.com','789','Februa','Murphy','0785655708','298 Punchbowl st','2020-07-26'),
('March.Murphy@gmail.com','153','March','Murphy','0415565708','125 Chullola st','2021-04-16'),
('April.Murphy@gmail.com','723','April','Murphy','0427781508','299 Canterbury st','2021-02-06'),
('May.Murphy@gmail.com','423','May','Murphy','0415661708','412 Redfern st','2020-07-11'),
('June.Murphy@gmail.com','754','June','Murphy','0466887068','299 Campsie st','2020-09-15'),
('July.Murphy@gmail.com','173','July','Murphy','0445681508','299 Sydnhem st','2021-04-17'),
('August.Murphy@gmail.com','183','August','Murphy','0422456808','299 Wolli Creek st','2020-05-26'),
('September.Murphy@gmail.com','153','September','Murphy','0415641708','299 Lakemba st','2020-09-16'),
('October.Murphy@gmail.com','103','Otobers','Murphy','0415651708','299 Macqueries field st','2021-07-12'),
('November.Murphy@gmail.com','103','November','Murphy','0415651708','Wollongong st','2021-07-12'),
('December.Murphy@gmail.com','Quy!1235','December','Murphy','0415651708','Arthur st','2021-07-12'),
('test4@gmail.com','Quy!1235','December','Murphy','0415651708','Arthur st','2021-07-12');

insert into Items("Item ID", "Item Name","Item Price","Item Quantity","Item ReceivedDate", "Item Region", "Item Description")
values
(1, 'Milk 1L',1.36,100,'2020-04-16','NSW','Fresh Milk'),
(2, 'Milk 2L',2.36,100,'2020-04-16','NSW','Fresh Milk'),
(3, 'Cookie Choc',7.54,100,'2020-04-16','QLD','Chocolate Cookies'),
(4, 'Rosted Chic',10,100,'2020-04-16','NSW','Roasted Chicken'),
(5, 'Sandwich',1.36,100,'2020-04-16','NSW','Sandwich');