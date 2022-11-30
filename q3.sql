-- q3. percentage of accessible seats 

-- finds the total seat count for each venue 
create temporary view AllSeats as
    select v_id, count(*) as total_seats
    from Seats
    group by v_id;

-- finds the total number of accessible seats for each venue
create temporary view AccessibleSeats as
    select v_id, coalesce(count(*), 0) as total_accessible
    from Seats
    where accessible = true
    group by v_id;
    
-- combines two above views
-- total num of seats and num of accessible seats for each venue 
create temporary view CombinedSeatsTable as
    select a.v_id, total_seats, coalesce(total_accessible, 0) as total_accessible
    from allseats a left join accessibleseats b on a.v_id = b.v_id; 

-- reports percentage of accessible seats 
select name, (total_accessible / total_seats::float) * 100 as percentage_accessible
from venue v natural join CombinedSeatsTable;
