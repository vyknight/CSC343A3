-- CHOICES AND ASSUMPTIONS 
-- 1. I could not express the constraint that there are at least 10 seats
--      without using assertions/triggers because you'll need to run a
--      aggregation function of some kind
-- 2. I could have vigorously expressed the constraint in which section names
--      are unique within a venue by making it a separate entity and giving it
--      a section id to be unique and expressing unique (venue, name) but
--      it's magnitudes easier to just make section an attribute of seats
--      instead of its own entity and just make sure not to screw up when
--      inserting the seats information
-- 3. Not sure if this count as "extra constraints" but I combined some
--      constraints to make a logical, generalized constraint like
--      "there are no two seats with the same id/venue/section"
-- 4. The foremost assumptions is the lengths for the strings, I had no idea
--      what lengths the strings had to be so I just used whatever looked
--      right for the context. Secondly, if a concert is played on two different
--	nights they're counted as separate concerts with the same name. There is
--	also an assumption that no two venues IRL has two sections named exactly
--      the same, because while that would be rejected by the assignment 
--	requirements in this schema they will just be counted as the same 
--	section. 
--	Also, since prices are dependent on the section, and sections are an 
--	attribute of seats, I'm assuming that whoever is using the database will
--	know in Purchase to traverse from seats to section and venue. Also I'm 
--	assuming that there is more stuff to be added to the DB in the future 
--	(like more attributes for user) but I left these small entities here for
--	the sake of future proofing.
--	Finally, I assumed certain things must be unique, like a ticket can only
--      be bought once. 

DROP SCHEMA IF EXISTS ticketschema cascade;
CREATE SCHEMA ticketschema;
SET search_path TO ticketschema, public;

-- each row represents an owner of a venue 
CREATE TABLE Owner (
    o_id integer PRIMARY KEY,
    phone integer UNIQUE NOT NULL,
    name varchar(60) NOT NULL
);

-- each row represents a concert venue 
CREATE TABLE Venue (
    v_id integer PRIMARY KEY,
    name varchar(20) NOT NULL,
    city varchar(15) NOT NULL,
    address varchar(25) NOT NULL,
    constraint venue_show_up_once UNIQUE (name, city, address)
);

-- each row represents a owning relationship between an owner and a venue
CREATE TABLE Owns (
    v_id integer REFERENCES Venue,
    o_id integer NOT NULL REFERENCES Owner,
    PRIMARY KEY (v_id, o_id)
);

-- each row represents a seat in a venue 
CREATE TABLE Seats (
    seat_id integer PRIMARY KEY,
    seat_name varchar(20) NOT NULL,
    accessible boolean NOT NULL DEFAULT false,
    -- we're expressing the no 2 sections with the same name in the same venue
    -- by not making section its own entity its impossible to do the above
    section varchar(20) NOT NULL,
    v_id integer NOT NULL REFERENCES Venue,
    -- things that are forbidden:
    -- 2 seat in the same section with the same name 
    -- 2 sections that have the same name in the same venue 
    -- so we can just express it as the following 
    CONSTRAINT no_unidentifiable_seats
    UNIQUE (seat_id, seat_name, section, v_id)
);

-- each row represents a concert 
CREATE TABLE Concert (
    -- i could use (name, venue) as primary key but why would i
    -- when i can invent a nice and easy id to work with 
    c_id integer PRIMARY KEY,
    name varchar(40) NOT NULL
);

-- this table only exists so that I can express the "venue can have 1 concert"
-- "at a given time" constraint, otherwise these would be attributes of concert

-- each row represents a booking relationship between a concert and a venue 
CREATE TABLE Booking (
    c_id integer NOT NULL REFERENCES Concert, 
    v_id integer NOT NULL REFERENCES Venue,
    datetime timestamp NOT NULL,
    PRIMARY KEY (c_id, v_id),
    constraint no_double_booking UNIQUE (v_id, datetime)
);


-- each row represents the price of a seat in a specific section concert combo
CREATE TABLE price (
    price_id integer PRIMARY KEY,
    c_id integer NOT NULL REFERENCES Concert,
    section varchar(20) NOT NULL,
    v_id integer NOT NULL REFERENCES Venue,
    price integer NOT NULL,
    CONSTRAINT one_price_per_section UNIQUE (c_id, v_id, section)
);

-- each row represents a user of the service
CREATE TABLE Users (
    username varchar(30) PRIMARY KEY
);

-- each row represents a concert ticket that can be bought 
CREATE TABLE Ticket(
    t_id integer PRIMARY KEY,
    price_id integer NOT NULL REFERENCES price,
    seat_id integer NOT NULL REFERENCES Seats,
    CONSTRAINT one_ticket_per_seat_per_concert UNIQUE (price_id, seat_id)
    -- we can actually get the concert and venue information from price
);

-- each row represents a ticket purchase made by a customer 
CREATE TABLE Purchase (
    purchase_id integer PRIMARY KEY,
    t_id integer NOT NULL REFERENCES Ticket,
    username varchar(30) NOT NULL REFERENCES Users,
    datetime timestamp NOT NULL,
    CONSTRAINT one_purchase_per_ticket UNIQUE (t_id, username)
);

