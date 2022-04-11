use sakila;

describe payment;

drop procedure if exists insert_payment;

delimiter $$

CREATE PROCEDURE insert_payment (
	in p_payment_amount	decimal(5,2),
    in p_payment_date	date,
    in p_rental_id		int
)
BEGIN
	insert into payment (
			customer_id, staff_id, rental_id, amount, payment_date)
		select customer_id, 
				staff_id, 
                rental_id, 
                p_payment_amount, 
                str_to_date(p_payment_date,'%Y-%m-%d')
		from rental
        where rental_id = p_rental_id;
END$$

delimiter ;

set @pymnt = 2.46, @pymt_dt = '2020-01-02', @rent_id = 1;
call insert_payment(@pymnt, @pymt_dt, @rent_id);
select * from payment 
where payment_id = (select max(payment_id) from payment);
      