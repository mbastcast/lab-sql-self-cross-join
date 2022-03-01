#Lab | SQL Self and cross join.

#Get all pairs of actors that worked together.
create temporary table actors
select f1.film_id, f2.actor_id as actor_1 , f1.actor_id as actor_2
from film_actor as f1
join film_actor as f2
on f1.film_id = f2.film_id
and f1.actor_id <> f2.actor_id;

select actor_1,actor_2 from actors;


#Get all pairs of customers that have rented the same film more than 3 times

#not sure this is the right answer but its as far as i got

select c.customer_id as customer1, r.customer_id as customer2, count(i.film_id) as rent_times
from rental r
join customer c
on r.customer_id != c.customer_id
join inventory i
on r.inventory_id = i.inventory_id
group by customer1, customer2
having rent_times > 3;


#Get all possible pairs of actors and films.
SELECT a.actor_id, b.actor_id, a.film_id 
FROM film_actor a, film_actor b
where a.film_id = b.film_id
and a.actor_id <> b.actor_id;