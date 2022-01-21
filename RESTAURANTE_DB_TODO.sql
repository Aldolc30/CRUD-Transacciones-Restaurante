
/*==============================================================*/
/* Table: CHEF                                                  */
/*==============================================================*/
create table CHEF (
   ID_CHEF              NUMERIC              not null,
   NOMB_CHEF            TEXT                 null,
   APELL_CHEF           TEXT                 null,
   TELF_CHEF            TEXT                 null,
   constraint PK_CHEF primary key (ID_CHEF)
);

/*==============================================================*/
/* Index: CHEF_PK                                               */
/*==============================================================*/
create unique index CHEF_PK on CHEF (
ID_CHEF
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC              not null,
   NOMB_CLIENTE         TEXT                 null,
   APELL_CLIENTE        TEXT                 null,
   CEDULA               TEXT                 null,
   TELF_CLIENTE         TEXT                 null,
   EMAIL_CLIENTE        TEXT                 null,
   DIRECCION_CLIENTE    TEXT                 null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   ID_FACTURA           NUMERIC              not null,
   NUM_DETALLE          NUMERIC              not null,
   ID_PLATO             NUMERIC              not null,
   CANTIDAD_DETALLE     NUMERIC              null,
   PRECIO_DETALLE       DECIMAL              null,
   VALOR_NETO           DECIMAL              null,
   constraint PK_DETALLE_FACTURA primary key (ID_FACTURA, NUM_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_FACTURA_PK                                    */
/*==============================================================*/
create unique index DETALLE_FACTURA_PK on DETALLE_FACTURA (
ID_FACTURA,
NUM_DETALLE
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on DETALLE_FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on DETALLE_FACTURA (
ID_PLATO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC              not null,
   ID_CLIENTE           NUMERIC              not null,
   FECHA_FACTURA        DATE                 null,
   SUBTOTAL_FACTURA     DECIMAL              null,
   IVA_FACTURA          DECIMAL              null,
   TOTAL_FACTURA        DECIMAL              null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on FACTURA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: INGREDIENTE                                           */
/*==============================================================*/
create table INGREDIENTE (
   ID_INGREDIENTE       NUMERIC              not null,
   ID_MEDIDA            NUMERIC              not null,
   NOMB_INGREDIENTE     TEXT                 null,
   CANT_INGREDIENTE     NUMERIC              null,
   COSTO_UND            DECIMAL              null,
   constraint PK_INGREDIENTE primary key (ID_INGREDIENTE)
);

/*==============================================================*/
/* Index: INGREDIENTE_PK                                        */
/*==============================================================*/
create unique index INGREDIENTE_PK on INGREDIENTE (
ID_INGREDIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on INGREDIENTE (
ID_MEDIDA
);

/*==============================================================*/
/* Table: MEDIDA                                                */
/*==============================================================*/
create table MEDIDA (
   ID_MEDIDA            NUMERIC              not null,
   DESCRP_MEDIDA        TEXT                 null,
   constraint PK_MEDIDA primary key (ID_MEDIDA)
);

/*==============================================================*/
/* Index: MEDIDA_PK                                             */
/*==============================================================*/
create unique index MEDIDA_PK on MEDIDA (
ID_MEDIDA
);

/*==============================================================*/
/* Table: MESA                                                  */
/*==============================================================*/
create table MESA (
   ID_MESA              NUMERIC              not null,
   NUM_MESA             NUMERIC              null,
   ID_MESERO            NUMERIC              not null,
   constraint PK_MESA primary key (ID_MESA)
);

/*==============================================================*/
/* Index: MESA_PK                                               */
/*==============================================================*/
create unique index MESA_PK on MESA (
ID_MESA
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on MESA (
ID_MESERO
);

/*==============================================================*/
/* Table: MESERO                                                */
/*==============================================================*/
create table MESERO (
   ID_MESERO            NUMERIC              not null,
   NOMB_MESERO          TEXT                 null,
   APELL_MESERO         TEXT                 null,
   TELF_MESERO          TEXT                 null,
   constraint PK_MESERO primary key (ID_MESERO)
);

/*==============================================================*/
/* Index: MESERO_PK                                             */
/*==============================================================*/
create unique index MESERO_PK on MESERO (
ID_MESERO
);

/*==============================================================*/
/* Table: PLATO                                                 */
/*==============================================================*/
create table PLATO (
   ID_PLATO             NUMERIC              not null,
   NOMB_PLATO           TEXT                 null,
   DESCR_PLATO          TEXT                 null,
   PRECIO_PLATO         DECIMAL              null,
   constraint PK_PLATO primary key (ID_PLATO)
);

/*==============================================================*/
/* Index: PLATO_PK                                              */
/*==============================================================*/
create unique index PLATO_PK on PLATO (
ID_PLATO
);

/*==============================================================*/
/* Table: RECETA                                                */
/*==============================================================*/
create table RECETA (
   ID_PLATO             NUMERIC              not null,
   ID_RECETA            NUMERIC              not null,
   NOMB_RECETA          TEXT                 null,
   ID_INGREDIENTE       NUMERIC              not null,
   ID_CHEF              NUMERIC              not null,
   constraint PK_RECETA primary key (ID_PLATO, ID_RECETA)
);

/*==============================================================*/
/* Index: RECETA_PK                                             */
/*==============================================================*/
create unique index RECETA_PK on RECETA (
ID_PLATO,
ID_RECETA
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on RECETA (
ID_PLATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RECETA (
ID_INGREDIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RECETA (
ID_CHEF
);

/*==============================================================*/
/* Table: RESERVACION                                           */
/*==============================================================*/
create table RESERVACION (
   ID_CLIENTE           NUMERIC              not null,
   ID_RESERVACION       NUMERIC              not null,
   ID_MESA              NUMERIC              not null,
   ESTADO_RESERVACION   TEXT                 null,
   FECHA_LLAMADA        DATE                 null,
   FECHA_RESERVACION    DATE                 null,
   constraint PK_RESERVACION primary key (ID_CLIENTE, ID_RESERVACION)
);

/*==============================================================*/
/* Index: RESERVACION_PK                                        */
/*==============================================================*/
create unique index RESERVACION_PK on RESERVACION (
ID_CLIENTE,
ID_RESERVACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on RESERVACION (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on RESERVACION (
ID_MESA
);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_PLATO foreign key (ID_PLATO)
      references PLATO (ID_PLATO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table INGREDIENTE
   add constraint FK_INGREDIE_RELATIONS_MEDIDA foreign key (ID_MEDIDA)
      references MEDIDA (ID_MEDIDA)
      on delete restrict on update restrict;

alter table MESA
   add constraint FK_MESA_RELATIONS_MESERO foreign key (ID_MESERO)
      references MESERO (ID_MESERO)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_INGREDIE foreign key (ID_INGREDIENTE)
      references INGREDIENTE (ID_INGREDIENTE)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_CHEF foreign key (ID_CHEF)
      references CHEF (ID_CHEF)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_PLATO foreign key (ID_PLATO)
      references PLATO (ID_PLATO)
      on delete restrict on update restrict;

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_MESA foreign key (ID_MESA)
      references MESA (ID_MESA)
      on delete restrict on update restrict;

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

INSERT INTO CLIENTE VALUES('1001', 'Pedro', 'Vera', '1383359219','0983359219', 'pedro@gmail.com', 'Calle 13');
INSERT INTO CLIENTE VALUES('1002', 'Alejandro', 'Vaca', '1312532641', '0912532641', 'alevaca10@hotmail.com', 'Calle 118');
INSERT INTO CLIENTE VALUES('1003', 'Michael', 'Acosta', '1321754896', '0921754896', 'mike22@gmail.com', 'Calle P4');
INSERT INTO CLIENTE VALUES('1004', 'Elizabeth', 'Villavicencio', '1321648726', '0921648726', 'elivilla@gmail.com', 'La Pradera');
INSERT INTO CLIENTE VALUES('1005', 'Raquel', 'Lopez', '1399862346', '0999862346', 'raquelita@gmail.com', 'La Paz');
INSERT INTO CLIENTE VALUES('1006', 'Joel', 'Canales', '1726344458', '0926344458', 'joel26@gmail.com', 'Santa Marta');
INSERT INTO CLIENTE VALUES('1007', 'Keren', 'Cardenas', '1321648726', '0921648726', 'kerencar@gmail.com', 'Santa Mónica');
INSERT INTO CLIENTE VALUES('1008', 'Sara', 'Rivera', '2424878556', '0924878556', 'sara_rivera@outlook.com', 'Cristo Rey');
INSERT INTO CLIENTE VALUES('1009', 'Samuel', 'Tumbaco', '1388776412', '0988776412', 'sam_tumb@gmail.com', 'Santa Clara');
INSERT INTO CLIENTE VALUES('1010', 'Anthony', 'Fortty', '1742156832',  '0942156832', 'fortty_40@hotmail.com', 'San Pedro');
INSERT INTO CLIENTE VALUES('1011', 'Abigail', 'Vallejos', '1315246984', '0958475621', 'abival03@gmail.com', 'Montecristi');
INSERT INTO CLIENTE VALUES('1012', 'Carlos', 'Mero', '1313125465', '0951264852', 'carlosmero@outlook.es', 'Los Esteros');
INSERT INTO CLIENTE VALUES('1013', 'Pablo', 'Ruiz', '1355446628', '0941222458', 'pablilloruiz05@gmail.com', 'Santa Marta');
INSERT INTO CLIENTE VALUES('1014', 'Nicole', 'Acosta', '1365249682','0963251458','nicoleac10@gmail.com', 'Santa Marta');
INSERT INTO CLIENTE VALUES('1015', 'María', 'Murillo', '1345778864', '0987654215', 'majomurillo@hotmail.com', 'Tarqui');
INSERT INTO CLIENTE VALUES('1016', 'Leonardo', 'Vargas', '0945218763', '0955664725', 'leovargas@gmail.com', 'Tarqui');
INSERT INTO CLIENTE VALUES('1017', 'Bella', 'Catagua', '175356485', '0912457863', 'bella_21@hotmail.com', 'La Paz');
INSERT INTO CLIENTE VALUES('1018', 'Darío', 'Conforme', '1324561287', '0924587613', 'darioconf@outlook.com', 'Santa Mónica');
INSERT INTO CLIENTE VALUES('1019', 'Cristian', 'Almeida', '1398485264', '0962542321', 'cristian0562@gmail.com', 'La Pradera');
INSERT INTO CLIENTE VALUES('1020', 'Rebeca', 'Castro', '1325463319', '0987321654', 'rebeca_castro@hotmail.com', 'La Pradera');

SELECT * FROM CLIENTE

INSERT INTO PLATO VALUES('101', 'Ceviche', 'Ceviche de pescado', '5.00');
INSERT INTO PLATO VALUES('102', 'Guatita', 'Plato preparado con mondongo', '4.50');
INSERT INTO PLATO VALUES('103', 'Encebollado', 'Manjar de dioses', '3.50');
INSERT INTO PLATO VALUES('104', 'Arroz marinero', 'Arroz con mariscos', '9.80');
INSERT INTO PLATO VALUES('105', 'Llapingacho', 'Plato popular típico de la región andina', '3.00');
INSERT INTO PLATO VALUES('106', 'Milanesa', 'Milanesa de Pollo', '4.50');
INSERT INTO PLATO VALUES('107', 'Caldo de bola', 'Caldo de bolas de verde', '3.50');
INSERT INTO PLATO VALUES('108', 'Hamburguesa', 'Hamburguesa de carne', '2.50');
INSERT INTO PLATO VALUES('109', 'Apanado', 'Filete de pescado apanado', '3.50');
INSERT INTO PLATO VALUES('110', 'Omelet', 'Arroz con huevo', '2.50');
INSERT INTO PLATO VALUES('111', 'Chicharrón de pescado', 'Chicharron de pescado con patacones', '5.50');
INSERT INTO PLATO VALUES('112', 'Chaulafán especial', 'Chaulafán con pollo y camarón', '6.00');
INSERT INTO PLATO VALUES('113', 'Encocado', 'Encocado de pescado', '3.00');
INSERT INTO PLATO VALUES('114', 'Costilla', 'Arroz con menestra y costilla', '4.50');
INSERT INTO PLATO VALUES('115', 'Caldo de Gallina', 'Caldo de Gallina Criolla', '3.50');


INSERT INTO FACTURA VALUES('10010','1002','2020/12/02','16.07','1.93','18.00');
INSERT INTO FACTURA VALUES('10011','1008','2020/12/02','24.55','2.95','27.50');
INSERT INTO FACTURA VALUES('10012','1007','2020/12/02','4.02','0.48','4.50');
INSERT INTO FACTURA VALUES('10113','1010','2021/01/04','13.66','1.64','15.30');
INSERT INTO FACTURA VALUES('10114','1006','2021/01/04','8.04','0.96','9.00');
INSERT INTO FACTURA VALUES('10115','1006','2021/01/05','12.50','1.50','14.00');
INSERT INTO FACTURA VALUES('10116','1005','2021/02/16','21.43','2.57','24.00');
INSERT INTO FACTURA VALUES('10117','1006','2021/03/22','4.46','0.54','5.00');
INSERT INTO FACTURA VALUES('10118','1009','2021/03/22','5.36','0.64','6.00');
INSERT INTO FACTURA VALUES('10119','1019','2021/03/23','19.96','2.04','19.00');
INSERT INTO FACTURA VALUES('10120','1014','2021/03/24','28.57','3.43','32.00');
INSERT INTO FACTURA VALUES('10121','1013','2021/03/24','4.46','0.54','5.00');
INSERT INTO FACTURA VALUES('10122','1018','2021/03/24','25.00','3.00','28.00');
INSERT INTO FACTURA VALUES('10123','1005','2021/03/25','37.50','4.50','42.00');
INSERT INTO FACTURA VALUES('10124','1015','2021/03/26','4.91','0.59','5.50');
INSERT INTO FACTURA VALUES('10125','1008','2021/03/27','16.52','1.98','18.50');
INSERT INTO FACTURA VALUES('10126','1020','2021/03/27','32.59','3.91','36.50');
INSERT INTO FACTURA VALUES('10127','1017','2021/03/27','33.48','4.02','37.50');
INSERT INTO FACTURA VALUES('10128','1011','2021/04/02','30.80','3.70','34.50');
INSERT INTO FACTURA VALUES('10129','1015','2021/04/02','11.16','1.34','12.50');
INSERT INTO FACTURA VALUES('10130','1010','2021/04/02','17.50','2.10','19.60');
INSERT INTO FACTURA VALUES('10131','1016','2021/04/03','41.07','4.93','46.00');
INSERT INTO FACTURA VALUES('10132','1012','2021/04/03','18.30','2.20','20.50');
INSERT INTO FACTURA VALUES('10133','1019','2021/05/07','37.50','4.50','42.00');
INSERT INTO FACTURA VALUES('10134','1019','2021/05/08','4.02','0.48','4.50');
INSERT INTO FACTURA VALUES('10135','1007','2021/05/08','21.43','2.57','24.00');
INSERT INTO FACTURA VALUES('10136','1009','2021/05/08','21.43','2.57','24.00','Pendiente','24.00');
INSERT INTO FACTURA VALUES('10137','1009','2021/05/08','21.43','2.57','24.00','Pendiente','24.00');



INSERT INTO DETALLE_FACTURA VALUES('10010','1','101','2','4.46','8.92');
INSERT INTO DETALLE_FACTURA VALUES('10010','2','103','1','3.13','3.13');
INSERT INTO DETALLE_FACTURA VALUES('10010','3','102','1','4.02','4.02');
INSERT INTO DETALLE_FACTURA VALUES('10011','1','114','3','4.02','12.05');
INSERT INTO DETALLE_FACTURA VALUES('10011','2','108','2','2.23','4.46');
INSERT INTO DETALLE_FACTURA VALUES('10011','3','106','1','4.02','4.02');
INSERT INTO DETALLE_FACTURA VALUES('10012','1','114','1','4.02','4.02');
INSERT INTO DETALLE_FACTURA VALUES('10113','1','104','1','8.75','8.75');
INSERT INTO DETALLE_FACTURA VALUES('10113','2','111','1','4.91','4.91');
INSERT INTO DETALLE_FACTURA VALUES('10114','1','105','3','2.68','8.04');
INSERT INTO DETALLE_FACTURA VALUES('10115','1','107','4','3.13','12.50');
INSERT INTO DETALLE_FACTURA VALUES('10116','1','112','3','5.36','21.43');
INSERT INTO DETALLE_FACTURA VALUES('10117','1','110','2','2.23','4.46');
INSERT INTO DETALLE_FACTURA VALUES('10118','1','112','1','5.36','5.36');
INSERT INTO DETALLE_FACTURA VALUES('10119','1','103','4','3.13','12.50');
INSERT INTO DETALLE_FACTURA VALUES('10119','2','101','1','4.46','4.46');
INSERT INTO DETALLE_FACTURA VALUES('10120','1','101','4','4.46','17.84');
INSERT INTO DETALLE_FACTURA VALUES('10120','2','113','4','2.68','10.72');
INSERT INTO DETALLE_FACTURA VALUES('10121','1','110','2','2.23','4.46');
INSERT INTO DETALLE_FACTURA VALUES('10122','1','109','8','3.13','25.04');
INSERT INTO DETALLE_FACTURA VALUES('10123','1','115','5','3.13','15.65');
INSERT INTO DETALLE_FACTURA VALUES('10123','2','107','7','3.13','21.91');
INSERT INTO DETALLE_FACTURA VALUES('10124','1','111','1','4.91','4.91');
INSERT INTO DETALLE_FACTURA VALUES('10125','1','108','2','2.23','4.46');
INSERT INTO DETALLE_FACTURA VALUES('10125','2','114','3','4.02','12.06');
INSERT INTO DETALLE_FACTURA VALUES('10126','1','103','3','3.13','9.39');
INSERT INTO DETALLE_FACTURA VALUES('10126','2','106','5','4.02','20.10');
INSERT INTO DETALLE_FACTURA VALUES('10126','3','107','1','3.13','3.13');
INSERT INTO DETALLE_FACTURA VALUES('10127','1','114','6','4.02','24.12');
INSERT INTO DETALLE_FACTURA VALUES('10127','2','109','3','3.13','9.39');
INSERT INTO DETALLE_FACTURA VALUES('10128','1','112','2','5.36','10.72');
INSERT INTO DETALLE_FACTURA VALUES('10128','2','113','4','2.68','10.72');
INSERT INTO DETALLE_FACTURA VALUES('10128','3','103','3','3.13','9.39');
INSERT INTO DETALLE_FACTURA VALUES('10129','1','102','2','4.02','8.04');
INSERT INTO DETALLE_FACTURA VALUES('10129','2','103','1','3.13','3.13');
INSERT INTO DETALLE_FACTURA VALUES('10130','1','104','2','8.75','17.50');
INSERT INTO DETALLE_FACTURA VALUES('10131','1','101','5','4.46','22.30');
INSERT INTO DETALLE_FACTURA VALUES('10131','2','115','6','3.13','18.78');
INSERT INTO DETALLE_FACTURA VALUES('10132','1','103','3','3.13','9.39');
INSERT INTO DETALLE_FACTURA VALUES('10132','2','110','4','2.23','8.92');
INSERT INTO DETALLE_FACTURA VALUES('10133','1','105','3','2.68','8.04');
INSERT INTO DETALLE_FACTURA VALUES('10133','2','111','6','4.91','29.46');
INSERT INTO DETALLE_FACTURA VALUES('10134','1','114','1','4.02','4.02');
INSERT INTO DETALLE_FACTURA VALUES('10135','1','106','3','4.02','12.06');
INSERT INTO DETALLE_FACTURA VALUES('10135','2','103','3','3.13','9.39');

INSERT INTO DETALLE_FACTURA VALUES('10136','1','106','3','4.02','12.06');
INSERT INTO DETALLE_FACTURA VALUES('10136','2','103','3','3.13','9.39');
INSERT INTO DETALLE_FACTURA VALUES('10137','1','106','3','4.02','12.06');
INSERT INTO DETALLE_FACTURA VALUES('10137','2','103','3','3.13','9.39');

SELECT * FROM FACTURA

DELETE FROM PAGO_FACTURA 
WHERE ID_FACTURA = 100;

DELETE FROM DETALLE_FACTURA 
WHERE ID_FACTURA = 10010;

DELETE FROM FACTURA
WHERE ID_FACTURA = 10010;

INSERT INTO MEDIDA VALUES('401', 'Libra');


INSERT INTO INGREDIENTE VALUES('301', '401', 'Pescado', '2', '2.25');
INSERT INTO INGREDIENTE VALUES('302', '401', 'Tomate', '1', '0.25');
INSERT INTO INGREDIENTE VALUES('303', '401', 'Pepino', '1', '0.50');
INSERT INTO INGREDIENTE VALUES('304', '401', 'Pollo', '2', '2.10');
INSERT INTO INGREDIENTE VALUES('305', '401', 'Huevo', '3', '0.45');
INSERT INTO INGREDIENTE VALUES('306', '401', 'Carne molida', '1', '1.50');
INSERT INTO INGREDIENTE VALUES('307', '401', 'Chorizo', '2', '2.00');
INSERT INTO INGREDIENTE VALUES('308', '401', 'Arroz', '1', '0.45');
INSERT INTO INGREDIENTE VALUES('309', '401', 'Costilla de res', '1', '2.00');
INSERT INTO INGREDIENTE VALUES('310', '401', 'Carne', '1', '1.50');
INSERT INTO INGREDIENTE VALUES('311', '401', 'Camarón', '1', '3.50');


INSERT INTO CHEF VALUES('10', 'Marcos', 'Rivera', '0912564587');
INSERT INTO CHEF VALUES('11','Daniel', 'Zambrano','0956324568');
INSERT INTO CHEF VALUES('12','Luisa', 'Zambrano','0956324568');
INSERT INTO CHEF VALUES('13','Estefania', 'Cedeño','0956324568');


INSERT INTO RECETA VALUES ('101', '201', 'Receta de Ceviche', '301', '10');
INSERT INTO RECETA VALUES ('101', '202', 'Receta de Ceviche', '302', '10');
INSERT INTO RECETA VALUES ('101', '203', 'Receta de Ceviche', '303', '10');
INSERT INTO RECETA VALUES ('106', '204', 'Receta de Milanesa', '304', '12');
INSERT INTO RECETA VALUES ('103', '205', 'Receta de Encebollado', '301', '11');
INSERT INTO RECETA VALUES ('110', '206', 'Receta de Omelet', '305', '10');
INSERT INTO RECETA VALUES ('110', '207', 'Receta de Omelet', '308', '10');
INSERT INTO RECETA VALUES ('108', '208', 'Receta de Hamburguesa', '306', '11');
INSERT INTO RECETA VALUES ('108', '209', 'Receta de Hamburguesa', '302', '11');
INSERT INTO RECETA VALUES ('105', '210', 'Receta de Llapingacho', '307', '13');
INSERT INTO RECETA VALUES ('114', '211', 'Receta de Costilla', '308', '12');
INSERT INTO RECETA VALUES ('114', '212', 'Receta de Costilla', '309', '12');
INSERT INTO RECETA VALUES ('113', '213', 'Receta de Encocado', '301', '10');
INSERT INTO RECETA VALUES ('115', '214', 'Receta de Caldo de Gallina', '304', '12');
INSERT INTO RECETA VALUES ('109', '215', 'Receta de Apanado', '301', '13');
INSERT INTO RECETA VALUES ('107', '216', 'Receta de Caldo de bola', '310', '11');
INSERT INTO RECETA VALUES ('112', '217', 'Receta de Chaulafán', '311', '10');
INSERT INTO RECETA VALUES ('112', '218', 'Receta de Chaulafán', '304', '10');
INSERT INTO RECETA VALUES ('112', '219', 'Receta de Chaulafán', '308', '10');


INSERT INTO MESERO VALUES('222','Johan','Canales','0924517889');
INSERT INTO MESERO VALUES('223','Celinda','Quinindé','0988884510');
INSERT INTO MESERO VALUES('224','Carlos','Mora','0925644871');
INSERT INTO MESERO VALUES('225','Sergio','Rendón','098917459');
INSERT INTO MESERO VALUES('226','José','Martínez','0987517669');
INSERT INTO MESERO VALUES('227','Doménica','Solis','0945267889');


INSERT INTO MESA VALUES('801','1','222');
INSERT INTO MESA VALUES('802','2','222');
INSERT INTO MESA VALUES('803','3','227');
INSERT INTO MESA VALUES('804','4','224');
INSERT INTO MESA VALUES('805','5','227');
INSERT INTO MESA VALUES('806','6','222');
INSERT INTO MESA VALUES('807','7','225');

delete from mesa
where id_mesa = 807

INSERT INTO RESERVACION VALUES('1005','50','801','FINALIZADO','2021/02/15','2021/02/16');
INSERT INTO RESERVACION VALUES('1006','51','802','FINALIZADO','2021/03/20','2021/03/22');
INSERT INTO RESERVACION VALUES('1009','52','803','AUSENCIA','2021/09/22','2021/09/23');
INSERT INTO RESERVACION VALUES('1009','53','807','ACTIVA','2021/10/28','2021/10/30');
INSERT INTO RESERVACION VALUES('1009','54','807','CANCELADA','2021/10/29','2021/10/30');
INSERT INTO RESERVACION VALUES('1009','55','802','FINALIZADO','2021/03/21','2021/03/22');
INSERT INTO RESERVACION VALUES('1014','56','806','FINALIZADO','2021/03/23','2021/03/24');
INSERT INTO RESERVACION VALUES('1020','57','803','AUSENCIA','2021/03/23','2021/03/24');
INSERT INTO RESERVACION VALUES('1020','58','803','AUSENCIA','2021/03/24','2021/03/25');
INSERT INTO RESERVACION VALUES('1015','59','804','FINALIZADO','2021/03/25','2021/03/26');
INSERT INTO RESERVACION VALUES('1020','60','804','FINALIZADO','2021/03/24','2021/03/27');
INSERT INTO RESERVACION VALUES('1009','61','807','CANCELADA','2021/04/02','2021/04/03');
INSERT INTO RESERVACION VALUES('1012','62','804','ACTIVA','2021/05/02','2021/05/03');


INSERT INTO RESERVACION VALUES('1005','50','801','FINALIZADO','15/02/2021','16/02/2021');
INSERT INTO RESERVACION VALUES('1006','51','802','FINALIZADO','20/03/2021','22/03/2021');
INSERT INTO RESERVACION VALUES('1009','52','803','AUSENCIA','2021/09/22','2021/09/23');
INSERT INTO RESERVACION VALUES('1009','53','807','ACTIVA','2021/10/28','2021/10/30');
INSERT INTO RESERVACION VALUES('1009','54','807','CANCELADA','2021/10/29','2021/10/30');
INSERT INTO RESERVACION VALUES('1009','55','802','FINALIZADO','2021/03/21','2021/03/22');
INSERT INTO RESERVACION VALUES('1014','56','806','FINALIZADO','2021/03/23','2021/03/24');
INSERT INTO RESERVACION VALUES('1020','57','803','AUSENCIA','2021/03/23','2021/03/24');
INSERT INTO RESERVACION VALUES('1020','58','803','AUSENCIA','2021/03/24','2021/03/25');
INSERT INTO RESERVACION VALUES('1015','59','804','FINALIZADO','2021/03/25','2021/03/26');
INSERT INTO RESERVACION VALUES('1020','60','804','FINALIZADO','2021/03/24','2021/03/27');
INSERT INTO RESERVACION VALUES('1009','61','807','CANCELADA','2021/04/02','2021/04/03');
INSERT INTO RESERVACION VALUES('1012','62','804','ACTIVA','2021/05/02','2021/05/03');


delete from reservacion
where id_reservacion = 66



-------------------- PRIMERA CONSULTA ----------------------
/*
Histórico de los platos vendidos que han existido. Es decir que tiene que aparecer el año,
el nombre del plato, la cantidad de veces que se vendió (DE MAYOR A MENOR) y el dinero que reflejó esa venta */

SELECT 
	EXTRACT(YEAR FROM F.FECHA_FACTURA)AS FECHA, 
	PL.NOMB_PLATO, 
	SUM(DF.CANTIDAD_DETALLE),
	SUM(DF.VALOR_NETO) AS TOTAL
FROM FACTURA F
	INNER JOIN DETALLE_FACTURA DF ON F.ID_FACTURA = DF.ID_FACTURA
	INNER JOIN PLATO PL ON DF.ID_PLATO = PL.ID_PLATO
WHERE F.ID_FACTURA = DF.ID_FACTURA 
AND F.FECHA_FACTURA BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY 
	EXTRACT(YEAR FROM F.FECHA_FACTURA), 
	PL.NOMB_PLATO
ORDER BY SUM(DF.CANTIDAD_DETALLE) DESC



-------------------- SEGUNDA CONSULTA -----------------------
/*
Histórico de reservaciones (Cliente, cuantas reservaciones ha hecho, -cuantas reservaciones fueron canceladas-. 
Y cuanto dinero nos ha dejado cada cliente)
*/

SELECT
	EXTRACT(YEAR FROM RESERVACION.FECHA_RESERVACION) AS FECHA,
	(CLIENTE.NOMB_CLIENTE || ' ' || CLIENTE.APELL_CLIENTE) AS NOMBRES,
	(SELECT COUNT(ID_RESERVACION) FROM RESERVACION
	WHERE CLIENTE.ID_CLIENTE = RESERVACION.ID_CLIENTE ) AS RESERVACIONES,
	(SELECT COUNT(ID_RESERVACION) FROM RESERVACION
	WHERE CLIENTE.ID_CLIENTE = RESERVACION.ID_CLIENTE 
		AND RESERVACION.ESTADO_RESERVACION = 'CANCELADA') AS CANCELADAS,
	FACTURA.TOTAL_FACTURA AS TOTAL
FROM CLIENTE	
	INNER JOIN RESERVACION ON CLIENTE.ID_CLIENTE = RESERVACION.ID_CLIENTE
	INNER JOIN FACTURA ON CLIENTE.ID_CLIENTE = FACTURA.ID_CLIENTE
WHERE FACTURA.FECHA_FACTURA = RESERVACION.FECHA_RESERVACION
GROUP BY
	FACTURA.TOTAL_FACTURA, RESERVACION.FECHA_RESERVACION,
	CLIENTE.NOMB_CLIENTE, CLIENTE.APELL_CLIENTE,
	CLIENTE.ID_CLIENTE, RESERVACION.ID_CLIENTE

--------------------- TERCERA CONSULTA --------------------
/*
Por año que salga la cantidad de ingredientes que más se han gastado (ejemplo, en 2021 en carne se fueron 500 libras. 
En arroz se fueron 50 quintales de arroz) */

SELECT 
	EXTRACT(YEAR FROM F.FECHA_FACTURA) AS FECHA,
	I.NOMB_INGREDIENTE AS NOMBRE_INGREDIENTE,
	SUM(I.CANT_INGREDIENTE) AS CANTIDAD,
	M.DESCRP_MEDIDA AS DESCRIPCION
FROM RECETA R
	INNER JOIN INGREDIENTE I ON I.ID_INGREDIENTE = R.ID_INGREDIENTE
	INNER JOIN MEDIDA M ON I.ID_MEDIDA = M.ID_MEDIDA
	INNER JOIN PLATO P ON R.ID_PLATO = P.ID_PLATO
	INNER JOIN DETALLE_FACTURA DF ON DF.ID_PLATO = P.ID_PLATO
	INNER JOIN FACTURA F ON DF.ID_FACTURA = F.ID_FACTURA
WHERE I.ID_MEDIDA = M.ID_MEDIDA
AND F.FECHA_FACTURA BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY 
	EXTRACT(YEAR FROM F.FECHA_FACTURA),
	I.NOMB_INGREDIENTE, 
	I.CANT_INGREDIENTE,
	M.DESCRP_MEDIDA
ORDER BY SUM(I.CANT_INGREDIENTE) DESC
	

/* 
------------- Cuarta Consulta -------------
Histórico de atenciones de los meseros, es decir cuantas reservaciones ha atendido cada mesero 
(Yo he atendido 500 reservaciones y el numero de clientes) 
*/


SELECT 
	EXTRACT(YEAR FROM R.FECHA_RESERVACION) AS FECHA,
	(M.NOMB_MESERO || ' ' || M.APELL_MESERO) AS NOMBRES,
	COUNT(R.ID_MESA) AS NO_RESERVACIONES
FROM CLIENTE C
	INNER JOIN RESERVACION R ON C.ID_CLIENTE = R.ID_CLIENTE
	INNER JOIN MESA ME ON R.ID_MESA = ME.ID_MESA
	INNER JOIN MESERO M ON ME.ID_MESERO = M.ID_MESERO
WHERE ME.ID_MESERO = M.ID_MESERO
GROUP BY
	EXTRACT(YEAR FROM R.FECHA_RESERVACION),
	M.NOMB_MESERO,
	M.APELL_MESERO;

--------------------- TRIGGER --------------------
/*
Trigger que impida hacer una reservación para un cliente que no se ha presentado en 
dos reservaciones pasadas.  (Prohibido hacer reservación) */

CREATE OR REPLACE FUNCTION PROHIBICION() RETURNS TRIGGER
AS
$PROHIBICION$
DECLARE
	PROHIBIR INT;
BEGIN 
	SELECT
		COUNT(ID_RESERVACION) INTO PROHIBIR
		FROM RESERVACION
		INNER JOIN CLIENTE ON CLIENTE.ID_CLIENTE = RESERVACION.ID_CLIENTE
		WHERE RESERVACION.ESTADO_RESERVACION = 'AUSENCIA' 
		AND RESERVACION.ID_CLIENTE = NEW.ID_CLIENTE;
	IF(PROHIBIR>=2) THEN
		RAISE EXCEPTION 'No es posible hacer una reservación';
	END IF; 
	RETURN NEW;
END;
$PROHIBICION$
LANGUAGE plpgsql;

CREATE TRIGGER PROHIBICION BEFORE
INSERT ON RESERVACION FOR EACH ROW 
EXECUTE PROCEDURE PROHIBICION();

INSERT INTO RESERVACION VALUES(1020,70,803,'AUSENCIA','2021/05/20','2021/05/21');
INSERT INTO RESERVACION VALUES(1009,70,803,'AUSENCIA','2021/09/20','2021/09/23');

--- SELECT * FROM RESERVACION
--- DELETE FROM RESERVACION WHERE ID_RESERVACION ='70'


--------------------- CURSOR ---------------------
/*
Con estructura for o while. Cuantas veces ha preparado un plato o receta un determinado chef en la empresa 
y el dinero que generó.
*/
DO $$
DECLARE
	NUM1 INT = 0;
	DATOSR RECORD;
	NUM INT;
	NUM2 REAL = 0;
	NUMCHEF INT = 10;
	
	CURSOR1 CURSOR IS
	SELECT * FROM CHEF
	INNER JOIN RECETA ON RECETA.ID_CHEF = CHEF.ID_CHEF
	WHERE CHEF.ID_CHEF = NUMCHEF;
	
	CURSOR2 CURSOR IS
	SELECT * FROM FACTURA
	INNER JOIN DETALLE_FACTURA DF ON DF.ID_FACTURA = FACTURA.ID_FACTURA
	INNER JOIN PLATO ON DF.ID_PLATO = PLATO.ID_PLATO
	INNER JOIN RECETA ON PLATO.ID_PLATO = RECETA.ID_PLATO
	INNER JOIN CHEF ON RECETA.ID_CHEF = CHEF.ID_CHEF
	WHERE CHEF.ID_CHEF = NUMCHEF;

BEGIN
	FOR NUM IN CURSOR1 LOOP
	NUM1 = NUM1 + COUNT(NUM.ID_CHEF);
	END LOOP;
	
	FOR NUM IN CURSOR2 LOOP
	NUM2 = NUM2 + SUM(NUM.VALOR_NETO);
	END LOOP;
	
OPEN CURSOR1;
FETCH CURSOR1 INTO DATOSR;

RAISE NOTICE 'Nombre: %, Apellido: %, Cantidad: %, Total: %',
				DATOSR.NOMB_CHEF,DATOSR.APELL_CHEF, NUM1, NUM2;

END $$
LANGUAGE plpgsql;


------------------ PROCEDIMIENTO ALMACENADO ------------------
/*
Un procedimiento almacenado que sea capaz de mandar el nombre de un chef y aparezca:
El nombre del mesero que haya atendido, el año y el número de clientes 
(que ordenaron el plato de ese chef)
*/

CREATE OR REPLACE FUNCTION NOMBRE_CHEF(VARCHAR) RETURNS SETOF "record"
AS
$BODY$
	SELECT 
		(MESERO.NOMB_MESERO || ' ' || MESERO.APELL_MESERO) AS NOMBRES,
		EXTRACT(YEAR FROM FACTURA.FECHA_FACTURA) AS FECHA,
		COUNT(R.ID_CLIENTE) AS NO_CLIENTES
	FROM CLIENTE 
		INNER JOIN RESERVACION R ON CLIENTE.ID_CLIENTE = R.ID_CLIENTE
		INNER JOIN FACTURA ON CLIENTE.ID_CLIENTE = FACTURA.ID_CLIENTE
		INNER JOIN MESA  ON R.ID_MESA = MESA.ID_MESA
		INNER JOIN MESERO ON MESA.ID_MESERO = MESERO.ID_MESERO
		INNER JOIN DETALLE_FACTURA DF ON DF.ID_FACTURA = FACTURA.ID_FACTURA
		INNER JOIN PLATO ON DF.ID_PLATO = PLATO.ID_PLATO
		INNER JOIN RECETA ON PLATO.ID_PLATO = RECETA.ID_PLATO
		INNER JOIN CHEF ON RECETA.ID_CHEF = CHEF.ID_CHEF
		WHERE CHEF.NOMB_CHEF = $1
	GROUP BY EXTRACT(YEAR FROM FACTURA.FECHA_FACTURA),
		MESERO.NOMB_MESERO, MESERO.APELL_MESERO
$BODY$
LANGUAGE SQL;

SELECT * FROM NOMBRE_CHEF('Daniel')
AS ("nomb_mesero" text, "fecha" double precision, "n_cliente" bigint)

------------------- CONSULTA IREPORT ------------------- 
/* Que se muestre en un diagrama de barras los platos vendidos de mayor a menor. */

SELECT 
	EXTRACT(YEAR FROM F.FECHA_FACTURA)AS FECHA, 
	PL.NOMB_PLATO, 
	SUM(DF.CANTIDAD_DETALLE)
FROM FACTURA F
	INNER JOIN DETALLE_FACTURA DF ON F.ID_FACTURA = DF.ID_FACTURA
	INNER JOIN PLATO PL ON DF.ID_PLATO = PL.ID_PLATO
WHERE F.ID_FACTURA = DF.ID_FACTURA 
AND F.FECHA_FACTURA BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY 
	EXTRACT(YEAR FROM F.FECHA_FACTURA), 
	PL.NOMB_PLATO
ORDER BY SUM(DF.CANTIDAD_DETALLE) DESC
















SELECT * FROM MESERO 



