-- q1. report tickets per venue

-- totals the number of seats for each venue
create temporary view VenueSeatCount as
    select v_id, count(*) as total_seats
    from Seats
    group by v_id;

-- finds the concert and cost of each purchased ticket  
create temporary view PurchasedTicketsAndPrice as
    select c_id, v_id, price
    from Purchase pur, (Ticket natural join Price) tic
    where pur.t_id = tic.t_id;

-- sums up the total earnings of each concert
create temporary view ConcertEarnings as 
    select c.c_id as c_id, name, sum(price) as total_price, 
            count(*) as count_tickets, v_id
    from Concert c left join PurchasedTicketsAndPrice p on c.c_id = p.c_id
    group by c.c_id, v_id;

-- combines the information from the above views together to present 
select c_id, name, coalesce(total_price, 0) as total_earnings, 
	coalesce((count_tickets / total_seats::float) * 100, 0) as percentage_Sold
from ConcertEarnings c left join VenueSeatCount v on c.v_id = v.v_id;
