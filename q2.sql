-- q2. report number of venues owned by each owner

select name, phone, count(*) as countVenues
from owns natural join owner
group by owns.o_id;