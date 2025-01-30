select 
    N,
    case
        when p is null then "Root"
        when n not in (select distinct p from bst where p is not null) then "Leaf"
        else 'Inner'
    end as node_type
from
    bst
order by
    n
