-- q4.  person who bought the most tickets 

-- count the number of purchases of each user 
create temporary view PurchaseCount as
    select username, count(*) as purchase_total
    from Purchase p
    group by username;

-- report the username of the user who bought the most tickets
select username as biggest_buyer_username
from PurchaseCount
where purchase_total >= all (select purchase_total from PurchaseCount);
