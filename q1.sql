-- q1. report tickets per venue

create temporary view VenueSeatCount as
    select v_id, count(*) as totalSeats
    from Seats
    group by v_id;

create temporary view PurchasedTicketsAndPrice as
    select c_id, v_id, price
    from Purchase pur, (Ticket natural join Price) tic
    where pur.t_id = tic.t_id;

create temporary view ConcertEarnings as 
    select c.c_id as c_id, name, sum(price) as totalPrice, 
            count(*) as countTickets, v_id
    from Concert c left join PurchasedTicketsAndPrice p on c.c_id = p.c_id
    group by c_id;

select c_id, name, totalPrice, (countTickets / totalSeats) * 100 as percentageSold
from ConcertEarnings natural join VenueSeatCount;