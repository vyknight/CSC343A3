-- q4.  person who bought the most tickets 

create temporary view PurchaseCount as
    select username, count(*) as purchaseTotal
    from Purchase p
    group by username;

create temporary view MaxCount as
    select max(purchaseCount) maximum
    from PurchaseCount;

select username
from PurchaseCount, MaxCount
where purchaseTotal = maximum;
