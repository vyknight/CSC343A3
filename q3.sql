-- q3. percentage of accessible seats 

create temporary view AllSeats as
    select v_id, count(*) as totalSeats
    from Seats
    group by v_id;

create temporary view AccessibleSeats as
    select v_id, coalesce(count(*), 0) as totalAccessible
    from Seats
    where accessible = true
    group by v_id;

select name, (totalAccessible / totalSeats) * 100 as percentageAccessible
from venue v natural join (AllSeats natural join AccessibleSeats) s;