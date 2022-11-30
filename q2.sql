-- q2. report number of venues owned by each owner

-- finds the count of venues owned per owner
select name, phone, count(*) as venues_owned
from owns natural join owner
group by owns.o_id, owner.name, owner.phone;
