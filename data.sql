SET SEARCH_PATH TO ticketschema, public;

INSERT INTO Venue (v_id, name, city, address) VALUES
    (0, 'Massey Hall', 'Toronto', '178 Victoria Street'),
    (1, 'Roy Thomson Hall', 'Toronto', '60 Simcoe St'),
    (2, 'ScotiaBank Arena', 'Toronto', '40 Bay St');

INSERT INTO Owner (o_id, phone, name) VALUES
    (0, 123456789, 'The Corporation of Massey Hall and Roy Thomson Hall'),
    (1, 987654321, 'Maple Leaf Sports & Entertainment');
    
INSERT INTO Owns (v_id, o_id) VALUES
    (0, 0),
    (1, 0),
    (2, 1);

INSERT INTO Seats (seat_id, seat_name, accessible, section, v_id) VALUES
    (1, 'A1', true, 'floor', 0),
    (2, 'A2', true, 'floor', 0),
    (3, 'A3', true, 'floor', 0),
    (4, 'A4', false, 'floor', 0),
    (5, 'A5', false, 'floor', 0),
    (6, 'A6', false, 'floor', 0),
    (7, 'A7', false, 'floor', 0),
    (8, 'A8', true, 'floor', 0),
    (9, 'A9', true, 'floor', 0),
    (10, 'A10', true, 'floor', 0),
    (11, 'B1', false, 'floor', 0),
    (12, 'B2', false, 'floor', 0),
    (13, 'B3', false, 'floor', 0),
    (14, 'B4', false, 'floor', 0),
    (15, 'B5', false, 'floor', 0),
    (16, 'B6', false, 'floor', 0),
    (17, 'B7', false, 'floor', 0),
    (18, 'B8', false, 'floor', 0),
    (19, 'B9', false, 'floor', 0),
    (20, 'B10', false, 'floor', 0),
    (21, 'C1', false, 'balcony', 0),
    (22, 'C2', false, 'balcony', 0),
    (23, 'C3', false, 'balcony', 0),
    (24, 'C4', false, 'balcony', 0),
    (25, 'C5', false, 'balcony', 0),
    (30, 'AA1', false, 'main hall', 1),
    (31, 'AA2', false, 'main hall', 1),
    (32, 'AA3', false, 'main hall', 1),
    (33, 'BB1', false, 'main hall', 1),
    (34, 'BB2', false, 'main hall', 1),
    (35, 'BB3', false, 'main hall', 1),
    (36, 'BB4', false, 'main hall', 1),
    (37, 'BB5', false, 'main hall', 1),
    (38, 'BB6', false, 'main hall', 1),
    (39, 'BB7', false, 'main hall', 1),
    (40, 'BB8', false, 'main hall', 1),
    (41, 'CC1', false, 'main hall', 1),
    (42, 'CC2', false, 'main hall', 1),
    (43, 'CC3', false, 'main hall', 1),
    (44, 'CC4', false, 'main hall', 1),
    (45, 'CC5', false, 'main hall', 1),
    (46, 'CC6', false, 'main hall', 1),
    (47, 'CC7', false, 'main hall', 1),
    (48, 'CC8', false, 'main hall', 1),
    (49, 'CC9', false, 'main hall', 1),
    (50, 'CC10', false, 'main hall', 1),
    (60, 'row 1, seat 1', true, '100', 2),
    (61, 'row 1, seat 2', true, '100', 2),
    (62, 'row 1, seat 3', true, '100', 2),
    (63, 'row 1, seat 4', true, '100', 2),
    (64, 'row 1, seat 5', true, '100', 2),
    (65, 'row 2, seat 1', true, '100', 2),
    (66, 'row 2, seat 2', true, '100', 2),
    (67, 'row 2, seat 3', true, '100', 2),
    (68, 'row 2, seat 4', true, '100', 2),
    (69, 'row 2, seat 5', true, '100', 2),
    (70, 'row 1, seat 1', false, '200', 2),
    (71, 'row 1, seat 2', false, '200', 2),
    (72, 'row 1, seat 3', false, '200', 2),
    (73, 'row 1, seat 4', false, '200', 2),
    (74, 'row 1, seat 5', false, '200', 2),
    (75, 'row 2, seat 1', false, '200', 2),
    (76, 'row 2, seat 2', false, '200', 2),
    (77, 'row 2, seat 3', false, '200', 2),
    (78, 'row 2, seat 4', false, '200', 2),
    (79, 'row 2, seat 5', false, '200', 2),
    (80, 'row 1, seat 1', false, '300', 2),
    (81, 'row 1, seat 2', false, '300', 2),
    (82, 'row 1, seat 3', false, '300', 2),
    (83, 'row 1, seat 4', false, '300', 2),
    (84, 'row 1, seat 5', false, '300', 2),
    (85, 'row 2, seat 1', false, '300', 2),
    (86, 'row 2, seat 2', false, '300', 2),
    (87, 'row 2, seat 3', false, '300', 2),
    (88, 'row 2, seat 4', false, '300', 2),
    (89, 'row 2, seat 5', false, '300', 2);

INSERT INTO Concert (c_id, name) VALUES
    (0, 'Ron Sexsmith'),
    (1, 'Womens Blues Review'),
    (2, 'Mariah Carey - Merry Christmas'),
    (3, 'Mariah Carey - Merry Christmas'),
    (4, 'TSO - Elf in Concert'),
    (5, 'TSO - Elf in Concert'),
    (6, 'TSO - Elf in Concert');

INSERT INTO Booking (c_id, v_id, datetime) VALUES
    (0, 0, '2022-12-03 19:30'),
    (1, 0, '2022-11-25 20:00'),
    (2, 2, '2022-12-09 20:00'),
    (3, 2, '2022-12-11 20:00'),
    (4, 1, '2022-12-09 19:30'),
    (5, 1, '2022-12-10 14:30'),
    (6, 1, '2022-12-10 19:30');


INSERT INTO Price (price_id, c_id, section, v_id, price) VALUES
    (0, 0, 'floor', 0, 130),    -- ron sexmith
    (1, 0, 'balcony', 0, 99),
    (2, 1, 'floor', 0, 150),    -- women's blues
    (3, 1, 'balcony', 0, 125),
    (4, 2, '100', 2, 986),      -- merry christmas 1
    (5, 2, '200', 2, 244),
    (6, 2, '300', 2, 176),
    (7, 3, '100', 2, 936),      -- merry christmas 2 
    (8, 3, '200', 2, 194),
    (9, 3, '300', 2, 126),
    (10, 4, 'main hall', 1, 159),   -- elf 1 
    (11, 5, 'main hall', 1, 159),   -- elf 2 
    (12, 6, 'main hall', 1, 159);   -- elf 3

INSERT INTO Users (username) VALUES
    ('ahightower'),
    ('d_targaryen'),
    ('cristonc');

INSERT INTO Ticket (t_id, price_id, seat_id) VALUES 
    (0, 2, 5),  -- alison a5 ticket
    (1, 3, 22), -- alison c2
    (2, 0, 13), -- daemon's b3 ron sexsmith
    (3, 12, 39),-- daemon's bb7 elf 3
    (4, 4, 62), -- cole's seat 3 row 1 for merry christmas 1
    (5, 8, 77), -- cole's seat 3 row 2 for merry christmas 2 
    (6, 8, 78); -- cole's seat 4 row 2 for merry christmas 2

INSERT INTO Purchase (purchase_id, t_id, username, datetime) VALUES
    (0, 0, 'ahightower', '2020-02-02 20:20'),
    (1, 1, 'ahightower', '2020-02-02 20:20'),
    (2, 2, 'd_targaryen', '2020-02-02 20:20'),
    (3, 3, 'd_targaryen', '2020-02-02 20:20'),
    (4, 4, 'cristonc', '2020-02-02 20:20'),
    (5, 5, 'cristonc', '2020-02-02 20:20'),
    (6, 6, 'cristonc', '2020-02-02 20:20');
    
