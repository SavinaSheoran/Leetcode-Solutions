select product_id,'store1' as store,store1 as price from Products where store1 is not null
union all
select product_id,'store2',store2 from Products where store2 is not null
union all
select product_id,'store3' ,store3 from Products where store3 is not null;