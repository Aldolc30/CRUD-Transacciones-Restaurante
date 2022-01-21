

-------------------------------

create or replace procedure transaccion_PagoFactura2(int,int, double precision)
as
$$
declare
	nuevopag int;
	nuevopag2 int;
	pendiente double precision;
	begin
		insert into Pago_factura(id_pago, id_factura, pago) values($1,$2,$3);
		update factura set valor_pendiente = valor_pendiente - $3 where id_factura = $2;
		select total_factura into nuevopag from factura where id_factura = $2;
		select pago into nuevopag2 from Pago_factura where id_factura = $2;
		Select valor_pendiente into pendiente from factura  where id_factura = $2;
		if(nuevopag = nuevopag2) then
			update factura set estado_factura = 'Cancelado' where id_factura = $2;
		end if;
		if(nuevopag < nuevopag2) then
			raise exception 'El valor a pagar excede la deuda';
			rollback;
		end if;
		if(pendiente = 0.0) then
			update factura set estado_factura = 'Cancelado' where id_factura = $2;
		end if;
	commit;
end;
$$
language plpgsql;

call transaccion_PagoFactura2(901,10136,24.00)

--delete from pago_factura 
--where id_pago = 901;

--select * from pago_factura
--select * from factura


---------------------- Transacción 2 -----------------
create or replace procedure transaccion_EstadoMesa(int,int,int, text, date, date)
as
$$
declare
	reserva text;
	begin
		insert into reservacion(id_cliente, id_reservacion, id_mesa, estado_reservacion, fecha_llamada, fecha_reservacion
							   ) values($1,$2,$3,$4,$5,$6);
		if ($5>$6) then
                raise exception 'La fecha de llamada no debe ser mayor a la de reservacion';
                rollback;
         end if;
		select estado_reservacion into reserva from reservacion where id_mesa = $3;
		if(reserva = 'ACTIVA') then
			update mesa set estado_mesa = 'Ocupado' where id_mesa = $3;
		end if;
	commit;
end;
$$
language plpgsql;

--select * from reservacion

call transaccion_EstadoMesa('1013','62','807','ACTIVA','2022/01/18','2022/02/18');
call transaccion_EstadoMesa('1014','63','804','ACTIVA','2022/03/18','2022/02/18');

--select * from mesa

--select * from reservacion

--update mesa set estado_mesa = 'Disponible'
--where id_mesa= 807

--delete from reservacion
--where id_reservacion = 62
