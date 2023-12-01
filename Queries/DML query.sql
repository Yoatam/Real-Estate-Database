--1
Insert Into Property
 Values
('P001', 5000000,'Addis Ababa', 400, 'rented'),
('P002', 12000000, 'Addis Ababa', 200, 'available'),
('P003', 11000000, 'Addis Ababa', 700, 'rented'),
('P004', 4700000, 'Addis Ababa', 500, 'available'),
('P005', 4500000, 'Addis Ababa', 400, 'sold'),
('P006', 10000000, 'Addis Ababa', 600, 'available'),
('P007', 5200000, 'Addis Ababa', 200, 'rented'),
('P008', 7000000, 'Addis Ababa', 400, 'available'),
('P009', 9000000, 'Addis Ababa', 400, 'sold'),
('P010', 10000000, 'Addis Ababa', 400, 'available'),
('P011', 5000000, 'Addis Ababa', 600, 'rented'),
('P012', 6270000, 'Addis Ababa', 400, 'rented'),
('P013', 12000000, 'Addis Ababa', 400, 'sold'),
('P014', 4950000, 'Addis Ababa', 700, 'available'),
('P015', 5600000, 'Addis Ababa', 700, 'available'),
('P016', 5650000, 'Addis Ababa', 800, 'sold'),
('P017', 4700000, 'Addis Ababa', 800, 'sold'),
('P018', 4600000, 'Addis Ababa', 400, 'available'),
('P019', 3500000, 'Addis Ababa', 400, 'sold'),
('P020', 3000000, 'Addis Ababa', 400, 'available'),
('P021', 11000000, 'Addis Ababa',700, 'rented'),
('P022', 6700000, 'Addis Ababa', 400, 'available'),
('P023', 5300000, 'Addis Ababa', 400, 'sold'),
('P024', 6607000, 'Addis Ababa', 500, 'available'),
('P025', 8600000, 'Addis Ababa', 400, 'available'),
('P026', 8500000, 'Addis Ababa', 440, 'sold'),
('P027', 9500000, 'Addis Ababa', 850, 'available'),
('P028', 7800000, 'Addis Ababa', 460, 'rented'),
('P029', 8500000, 'Addis Ababa', 670, 'available'),
('P030', 9500000, 'Addis Ababa', 740, 'sold'),
('P031', 8000000, 'Addis Ababa', 650, 'rented'),
('P032', 3500000, 'Addis Ababa', 420, 'rented'),
('P033', 6500000, 'Addis Ababa', 470, 'sold'),
('P034', 10500000, 'Addis Ababa', 670, 'sold'),
('P035', 2500000, 'Addis Ababa', 370, 'sold'),
('P036', 4500000, 'Addis Ababa', 570, 'available'),
('P037', 8200000, 'Addis Ababa', 660, 'rented'),
('P038', 5500000, 'Addis Ababa', 560, 'rented'),
('P039', 11500000, 'Addis Ababa',800, 'sold'),
('P040', 3540000, 'Addis Ababa', 470, 'rented');



--2
 INSERT INTO property_type
 VALUES
('PT001', 'P001' , 'house'),
('PT002', 'P002', 'apartment'),
('PT003', 'P003', 'house'),
('PT004', 'P004', 'house'),
('PT005', 'P005', 'apartment'),
('PT006', 'P006', 'house'),
('PT007', 'P007', 'apartment'),
('PT008', 'P008', 'apartment'),
('PT009', 'P009', 'house'),
('PT010', 'P010', 'house'),
('PT011', 'P011', 'apartment'),
('PT012', 'P012', 'apartment'),
('PT013', 'P013', 'house'),
('PT014', 'P014', 'apartment'),
('PT015', 'P015','apartment'),
('PT016', 'P016', 'apartment'),
('PT017', 'P017', 'apartment'),
('PT018', 'P018', 'apartment'),
('PT019', 'P019', 'house'),
('PT020', 'P020', 'apartment'),
('PT021', 'P021', 'apartment'),
('PT022', 'P022', 'house'),
('PT023', 'P023', 'apartment'),
('PT024', 'P024', 'house'),
('PT025', 'P025', 'apartment'),
('PT026', 'P026', 'apartment'),
('PT027', 'P027', 'house'),
('PT028', 'P028', 'house'),
('PT029', 'P029', 'apartment'),
('PT030', 'P030', 'house'),
('PT031', 'P031', 'apartment'),
('PT032', 'P032', 'house'),
('PT033', 'P033', 'apartment'),
('PT034', 'P034', 'house'),
('PT035', 'P035', 'house'),
('PT036', 'P036', 'apartment'),
('PT037', 'P037', 'house'),
('PT038', 'P038', 'apartment'),
('PT039', 'P039', 'apartment'),
('PT040', 'P040', 'house');

--3
INSERT INTO property_feature
VALUES
(1, 'P001', 'not available', 'available', 'not available', 'not available', 'available', 'available'),
(2, 'P002', 'not available', 'not available', 'not available', 'available', 'not available', 'not available'),
(3, 'P003', 'available', 'available', 'available', 'not available', 'available', 'available'),
(4, 'P004', 'not available', 'not available', 'not available', 'available', 'available', 'not available'),
(5, 'P005', 'available', 'available', 'not available', 'available', 'available', 'available'),
(6, 'P006', 'not available', 'available', 'available', 'not available', 'not available', 'available'),
(7, 'P007', 'not available', 'available', 'available', 'not available', 'not available', 'available'),
(8, 'P008', 'available', 'not available', 'available', 'not available', 'available', 'available'),
(9, 'P009', 'not available', 'not available', 'available', 'not available', 'not available', 'available'),
(10, 'P010', 'not available', 'not available', 'available', 'available', 'available', 'not available'),
(11, 'P011', 'available', 'not available', 'not available', 'not available', 'available', 'not available'),
(12, 'P012', 'available', 'available', 'not available', 'not available', 'available', 'available'),
(13, 'P013', 'available', 'available', 'not available', 'not available', 'available', 'not available'),
(14, 'P014', 'available', 'not available', 'available', 'available', 'not available', 'not available'),
(15, 'P015', 'not available', 'not available', 'not available', 'not available', 'available', 'available'),
(16, 'P016', 'not available', 'available', 'available', 'not available', 'not available', 'not available'),
(17, 'P017', 'not available', 'not available', 'available', 'not available', 'not available', 'available'),
(18, 'P018', 'not available', 'available', 'available', 'not available', 'available', 'not available'),
(19, 'P019', 'not available', 'not available', 'available', 'not available', 'available', 'available'),
(20, 'P020', 'available', 'available', 'available', 'available', 'available', 'available'),
(21, 'P021', 'not available', 'not available', 'not available', 'available', 'not available', 'available'),
(22, 'P022', 'not available', 'not available', 'not available', 'available', 'available', 'available'),
(23, 'P023', 'available', 'available', 'not available', 'available', 'available', 'available'),
(24, 'P024', 'not available', 'not available', 'not available', 'available', 'available', 'available'),
(25, 'P025', 'not available', 'not available', 'not available', 'not available', 'not available', 'not available'),
(26, 'P026', 'available', 'available', 'available', 'not available', 'not available', 'not available'),
(27, 'P027', 'not available', 'not available', 'available', 'available', 'available', 'available'),
(28, 'P028', 'available', 'available', 'available', 'available', 'available', 'available'),
(29, 'P029', 'not available', 'not available', 'available', 'available', 'not available', 'available'),
(30, 'P030', 'not available', 'not available', 'available', 'not available', 'available', 'available'),
(31, 'P031', 'available', 'not available', 'available', 'available', 'available', 'not available'),
(32, 'P032', 'not available', 'available', 'not available', 'not available', 'not available', 'not available'),
(33, 'P033', 'not available', 'not available', 'available', 'not available', 'available', 'available'),
(34, 'P034', 'available', 'available', 'available', 'not available', 'not available', 'available'),
(35, 'P035', 'available', 'not available', 'available', 'not available', 'not available', 'not available'),
(36, 'P036', 'not available', 'not available', 'not available', 'available', 'available', 'available'),
(37, 'P037', 'available', 'not available', 'available', 'not available', 'not available', 'not available'),
(38, 'P038', 'not available', 'not available', 'not available', 'not available', 'available', 'not available'),
(39, 'P039', 'not available', 'not available', 'available', 'not available', 'available', 'available'),
(40, 'P040', 'available', 'available', 'not available', 'not available', 'available', 'available');


--4
INSERT INTO Buyer
VALUES
('B001', 'P005', 'Abdi', 'Ahmed', 'abdiahmed@email.com', '+251912345678'),
('B002', 'P009', 'Alemayehu', 'Gebre', 'alemayehugebre@email.com', '+251922345678'),
('B003', 'P013', 'Asnakech', 'Tadesse', 'asnakechtadesse@email.com', '+251932345678'),
('B004', 'P016', 'Bekele', 'Mulugeta', 'bekelemulugeta@email.com', '+251942345678'),
('B005', 'P017', 'Dawit', 'Teshome', 'dawitteshome@email.com', '+251952345678'),
('B006', 'P019', 'Eyerusalem', 'Assefa', 'eyerusalemassefa@email.com', '+251962345678'),
('B007', 'P023', 'Fikadu', 'Haile', 'fikaduhaile@email.com', '+251972345678'),
('B008', 'P026', 'Gelila', 'Yohannes', 'gelilayohannes@email.com', '+251982345678'),
('B009', 'P030', 'Habtamu', 'Getachew', 'habtamugetachew@email.com', '+251992345678'),
('B010', 'P033', 'Imane', 'Negash', 'imanenegash@email.com', '+251912345689'),
('B011', 'P034', 'Jemberu', 'Alemu', 'jemberualemu@email.com', '+251912345690'),
('B012', 'P035', 'Kaleab', 'Berhanu', 'kaleabberhanu@email.com', '+251912345691'),
('B013', 'P039', 'Lemlem', 'Adane', 'lemlemadane@email.com', '+251912345692');

--5
INSERT INTO buyer_transaction
VALUES
('BT001', 'B001', 'P005', 5000000, '2023-08-10'),
('BT002', 'B002', 'P009', 9000000, '2023-07-14'),
('BT003', 'B003', 'P013', 12000000, '2023-03-20'),
('BT004', 'B004', 'P016', 5650000, '2023-08-05'),
('BT005', 'B005', 'P017', 4700000, '2023-02-25'),
('BT006', 'B006', 'P019', 3500000, '2023-04-11'),
('BT007', 'B007', 'P023', 5300000, '2023-01-19'),
('BT008', 'B008', 'P026', 8500000, '2023-07-06'),
('BT009', 'B009', 'P030', 9500000, '2023-08-06'),
('BT010', 'B010', 'P033', 6500000, '2023-06-10'),
('BT011', 'B011', 'P034', 10500000, '2023-08-10'),
('BT012', 'B012', 'P035', 2500000, '2023-02-25'),
('BT013', 'B013', 'P039', 11500000, '2023-08-03');

--- this for the trigger to show if it works or not
insert into buyer_transaction
values
('BT014', 'B013', 'P027', 11500000, '2023-08-03');


--6
Insert Into MaintenanceRequest
 Values
('MR001', 'P007', 'Broken light', '2023-07-01','in progress' ),
('MR002', 'P020', 'Pipe leak', '2023-06-02','in progress' ),
('MR003', 'P003', 'Power shortage', '2023-05-03','Pending' ),
('MR004', 'P002', 'mouse infestation', '2023-04-04','Completed' ),
('MR005', 'P018', 'malfunctioning AC', '2023-03-05','Completed' ),
('MR006', 'P019', 'clogged sink', '2023-02-06','Completed' ),
('MR007', 'P016', 'malfunctioning AC', '2023-01-07','Completed' ),
('MR008', 'P023', 'clogged sink', '2023-08-08','Completed' ),
('MR009', 'P034', 'Pipe leak', '2023-09-09','Completed' ),
('MR010', 'P011', 'Pipe leak', '2023-10-10','Completed' ),
('MR011', 'P027', 'broken light', '2023-11-11','Completed' ),
('MR012', 'P022', 'running toilet', '2023-12-12','Completed' ),
('MR013', 'P010', 'Pipe leak', '2023-07-13','Completed' ),
('MR014', 'P039', 'Power shortage', '2023-06-14','Completed' ),
('MR015', 'P002', 'Power shortage', '2023-05-15','Completed' ),
('MR016', 'P034', 'broken light', '2023-04-16','Completed' ),
('MR017', 'P005', 'Pipe leak', '2023-03-17','Completed' ),
('MR018', 'P008', 'Power shortage', '2023-02-18','Completed' ),
('MR019', 'P004', 'Pipe leak', '2023-01-19','Completed' ),
('MR020', 'P014', 'Power shortage', '2023-08-20','Completed' ),
('MR021', 'P025', 'Power shortage', '2023-09-21','Completed' ),
('MR022', 'P021', 'broken window', '2023-10-22','Completed' ),
('MR023', 'P030', 'running toilet', '2023-11-23','Completed' ),
('MR024', 'P029', 'loose doorknob', '2023-12-24','Completed' ),
('MR025', 'P008', 'broken window', '2023-01-25','Completed' ),
('MR026', 'P028', 'Pipe leak', '2023-02-26','Completed' ),
('MR027', 'P006', 'malfunctioning AC', '2023-03-27','Completed' ),
('MR028', 'P013', 'broken light', '2023-04-28','Completed' ),
('MR029', 'P019', 'Pipe leak', '2023-05-29','Completed' ),
('MR030', 'P001', 'malfunctioning AC', '2023-06-30','Completed' );


--7
INSERT INTO Tenant
VALUES
('TE001', 'Berhe', 'Habtom', '+251911111117'),
('TE002', 'Daniel', 'Bade', '+251911111118'),
('TE003', 'Asefa', 'Bade', '+251911111119'),
('TE004', 'Abdullah', 'Bade', '+251911711121'),
('TE005', 'Anwar', 'Mohammed', '+251913111120'),
('TE006', 'Mohammed', 'Nuru', '+251917111122'),
('TE007', 'Nuredin', 'Ahmed', '+251911111123'),
('TE008', 'Nasir', 'Ali', '+251911111124'),
('TE009', 'Yohannes', 'Berhanu', '+251911111125'),
('TE010', 'Maritu', 'Legesse', '+251911111126'),
('TE011', 'Melat', 'Bedelu', '+251911111127'),
('TE012', 'Chaltu', 'Tola', '+251911111128');



--8
Insert Into Landlord
Values
('LL001', 'Rimon', 'Mussie', '+251911111111', 'rimon@gmail.com' ),
('LL002', 'haile', 'Gutema', '+251911122222', 'gutema@gmail.com' ),
('LL003', 'Rimon', 'Mesay', '+251911133333', 'mesay@gmail.com' ),
('LL004', 'Gudina', 'Aloro', '+251911111444', 'aloro@gmail.com' ),
('LL005', 'Meti', 'Aloro', '+251911115555', 'meti@gmail.com' ),
('LL006', 'Maletay', 'Abebe', '+251911666666', 'abebe@gmail.com' ),
('LL007', 'Tsion', 'Sisema', '+251913333333', 'tsion@gmail.com' ),
('LL008', 'Belay', 'Mussie', '+251912222222', 'belay@gmail.com' ),
('LL009', 'Getayawkal', 'Melese', '+251955555555', 'geta@gmail.com' ),
('LL010', 'Biruktawit', 'Haile', '+251911653242', 'birr@gmail.com' ),
('LL011', 'Samuel', 'Sileshi', '+251911235235', 'silsa@gmail.com' ),
('LL012', 'Selam', 'Yimer', '+251911112233', 'selam@gmail.com');

--9
INSERT INTO RentedProperties 
VALUES
('RP001', 'P001', 'TE001', 'LL001', '2023-07-13'),
('RP002', 'P003', 'TE002', 'LL002', '2023-06-13'),
('RP003', 'P007', 'TE003', 'LL003', '2023-07-14'),
('RP004', 'P011', 'TE004', 'LL004', '2023-07-15'),
('RP005', 'P012', 'TE005', 'LL005', '2023-07-16'),
('RP006', 'P021', 'TE006', 'LL006', '2023-07-17'),
('RP007', 'P028', 'TE007', 'LL007', '2023-06-14'),
('RP008', 'P031', 'TE008', 'LL008', '2023-07-13'),
('RP009', 'P032', 'TE009', 'LL009', '2023-06-17'),
('RP010', 'P037', 'TE010', 'LL010', '2023-05-13'),
('RP011', 'P038', 'TE011', 'LL011', '2023-04-13'),
('RP012', 'P040', 'TE012', 'LL012', '2023-04-14');

--- this for the trigger to show if it works or not
insert into RentedProperties
values
('RP013', 'P020', 'TE012', 'LL012', '2023-04-14');

--10
INSERT INTO rp_transaction 
VALUES
('RPT001', 'RP001', 'P001', 18000, '2023-07-13'),
('RPT002', 'RP002', 'P003', 19000, '2023-06-13'),
('RPT003', 'RP003', 'P007', 17500, '2023-07-14'),
('RPT004', 'RP004', 'P011', 18500, '2023-07-15'),
('RPT005', 'RP005', 'P012', 19500, '2023-07-16'),
('RPT006', 'RP006', 'P021', 17000, '2023-07-17'),
('RPT007', 'RP007', 'P028', 18000, '2023-06-14'),
('RPT008', 'RP008', 'P031', 18500, '2023-07-13'),
('RPT009', 'RP009', 'P032', 17500, '2023-06-17'),
('RPT010', 'RP010', 'P037', 19000, '2023-05-13'),
('RPT011', 'RP011', 'P038', 19500, '2023-04-13'),
('RPT012', 'RP012', 'P040', 17000, '2023-04-14');

--11
INSERT INTO LeaseAgreement
VALUES
('LA001', 'RP001', 18000, '2023-07-13', '2024-07-13'),
('LA002', 'RP002', 19000, '2023-06-13', '2025-06-13'),
('LA003', 'RP003', 17500, '2023-07-14', '2024-01-14'),
('LA004', 'RP004', 18500, '2023-07-15', '2025-01-15'),
('LA005', 'RP005', 19500, '2023-07-16', '2025-08-16'),
('LA006', 'RP006', 17000, '2023-07-17', '2024-08-17'),
('LA007', 'RP007', 18000, '2023-06-14', '2024-08-14'),
('LA008', 'RP008', 18500, '2023-07-13', '2024-08-13'),
('LA009', 'RP009', 17500, '2023-06-17', '2025-08-17'),
('LA010', 'RP010', 19000, '2023-05-13', '2024-08-13'),
('LA011', 'RP011', 19500, '2023-04-13', '2025-08-13'),
('LA012', 'RP012', 17000, '2023-04-14', '2024-08-14');











