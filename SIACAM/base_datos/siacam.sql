/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/11/2014 11:33:37 p.m.                     */
/*==============================================================*/

DROP DATABASE IF EXISTS siacam;
CREATE DATABASE IF NOT EXISTS siacam DEFAULT CHARACTER SET latin1 COLLATE latin1_bin;
USE siacam;

drop table if exists Empleado;

drop table if exists Rol;

drop table if exists Usuario;

drop table if exists siacam.adenda;

drop table if exists siacam.datosinstitucionales;

drop table if exists siacam.detalleficharetirobases;

drop table if exists siacam.detallenecesipaac;

drop table if exists siacam.detalleoferta;

drop table if exists siacam.detallepaac;

drop table if exists siacam.detallesolicitudobra;

drop table if exists siacam.expedienteproceso;

drop table if exists siacam.listadonecesipaac;

drop table if exists siacam.oferente;

drop table if exists siacam.oferta;

drop table if exists siacam.ordencompra;

drop table if exists siacam.paac;

drop table if exists siacam.solicitudobra;

drop table if exists siacam.unidad_solicitante;

drop table if exists siacam.unspsc;

/*==============================================================*/
/* User: siacam                                                 */
/*==============================================================*/
create user siacam;

/*==============================================================*/
/* Table: Empleado                                              */
/*==============================================================*/
create table Empleado
(
   IDEMPLEADO           integer not null,
   IDUSER               integer,
   DIRECCIONEMP         varchar(30),
   NOMBREEMPLEADO       varchar(30),
   APELLIDOEMPLEADO     varchar(30),
   CARGOEMP             varchar(30),
   TELEFONOEMP          varchar(30),
   CORREOELECTRONICOEMP varchar(30),
   OBSERVACIONESEMP     varchar(30),
   primary key (IDEMPLEADO)
);

/*==============================================================*/
/* Table: Rol                                                   */
/*==============================================================*/
create table Rol
(
   IDROL                integer not null,
   NOMBREROL            varchar(30),
   DESCRIPCIONROL       varchar(100),
   ESTADOROL            int,
   primary key (IDROL)
);

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario
(
   IDUSER               integer not null,
   IDROL                integer,
   NOMBREUSER           varchar(20),
   PASSWORDUSER         varchar(20),
   FECHAUSER            datetime,
   ESTADOUSER           varchar(10),
   primary key (IDUSER)
);

/*==============================================================*/
/* Table: adenda                                                */
/*==============================================================*/
create table siacam.adenda
(
   CODIGOPROCESO        varchar(15) not null,
   NOCORRELATIVO        int(11) not null,
   TEXTOBASES           varchar(50),
   OPERACION            varchar(50),
   primary key (CODIGOPROCESO, NOCORRELATIVO)
);

/*==============================================================*/
/* Table: datosinstitucionales                                  */
/*==============================================================*/
create table siacam.datosinstitucionales
(
   CODIGOINSTITUCION    varchar(10) not null,
   NOMBREINSTITUCION    varchar(30) not null,
   DIRECCIONINSTITUCION varchar(50) not null,
   primary key (CODIGOINSTITUCION)
);

/*==============================================================*/
/* Table: detalleficharetirobases                               */
/*==============================================================*/
create table siacam.detalleficharetirobases
(
   NOCORRELATIVO        int(11) not null,
   CODIGOPROCESO        varchar(15) not null,
   NOMBREOFERENTE       varchar(30) not null,
   NOMBRECOMISIONADO    varchar(30) not null,
   DOCUMENTOIDCOMISIONADO varchar(10) not null,
   LUGARPARANOTIFICACIONES varchar(50) not null,
   FECHARETIROBASES     date not null,
   HORARETIROBASES      time not null,
   primary key (NOCORRELATIVO, CODIGOPROCESO)
);

/*==============================================================*/
/* Table: detallenecesipaac                                     */
/*==============================================================*/
create table siacam.detallenecesipaac
(
   EJERCICIOFISCAL      varchar(4) not null,
   NOCORRELATIVO        int(11) not null,
   CODIGOUNSPSC         varchar(8),
   FUENTERECURSO        varchar(10) not null,
   DESCRIPCIONUNSPSC    varchar(30) not null,
   CANTIDADPROYECTADA   int(11) not null,
   UNIDADMEDIDA         varchar(10) not null,
   PRECIOUNITARIO       decimal(10,2) not null,
   PRECIOTOTAL          decimal(10,2) not null,
   MESESPERADO          varchar(10) not null,
   primary key (NOCORRELATIVO, EJERCICIOFISCAL)
);

/*==============================================================*/
/* Table: detalleoferta                                         */
/*==============================================================*/
create table siacam.detalleoferta
(
   NOMBREOFERENTE       varchar(30) not null,
   CODIGOPROCESO        varchar(15) not null,
   RUBRO                varchar(15) not null,
   MARCAOFERTADA        varchar(10),
   PRECIOUNITARIO       decimal(10,2),
   TOTAL                decimal(10,2),
   MONTOGARANTIA        decimal(10,2),
   primary key (RUBRO, NOMBREOFERENTE, CODIGOPROCESO)
);

/*==============================================================*/
/* Table: detallepaac                                           */
/*==============================================================*/
create table siacam.detallepaac
(
   EJERCICIOFISCAL      varchar(4) not null,
   NOCORRELATIVO        int(11) not null,
   CODIGOUNSPSC         varchar(8) not null,
   FUENTERECURSO        varchar(10) not null,
   FORMACONTRATACION    varchar(10) not null,
   NOMBREPRELIMPROCESO  varchar(30) not null,
   DESCRIPCIONUNSPSC    varchar(30) not null,
   CODIGOOBJETOPRES     varchar(10) not null,
   MESESTIMADO          varchar(10) not null,
   MONTOPRESUPUESTADO   decimal(10,2) not null,
   primary key (EJERCICIOFISCAL, NOCORRELATIVO)
);

/*==============================================================*/
/* Table: detallesolicitudobra                                  */
/*==============================================================*/
create table siacam.detallesolicitudobra
(
   ID_DETALLE           int(11) not null,
   CODIGOUNSPSC         varchar(8) not null,
   ID_SOLICITUD         decimal(2,0),
   CANTIDAD             int(11) not null,
   UNIDADMEDIDA         varchar(10) not null,
   OBRASOLICITADA       varchar(30) not null,
   ESPECIFICTECNICAS    varchar(100) not null,
   primary key (ID_DETALLE)
);

/*==============================================================*/
/* Table: expedienteproceso                                     */
/*==============================================================*/
create table siacam.expedienteproceso
(
   CODIGOPROCESO        varchar(15) not null,
   DENOMINACIONPROCESO  varchar(50),
   RESPONSABLEPROCESO   varchar(30) not null,
   TIPOPROCESO          varchar(10) not null,
   ESTADOPROCESO        varchar(10) not null,
   NOMBREADJUDICATARIO  varchar(30),
   primary key (CODIGOPROCESO)
);

/*==============================================================*/
/* Table: listadonecesipaac                                     */
/*==============================================================*/
create table siacam.listadonecesipaac
(
   EJERCICIOFISCAL      varchar(4) not null,
   CODIGOINSTITUCION    varchar(10) not null,
   NOMBREINSTITUCION    varchar(30) not null,
   NOMBRESOLICITANTE    varchar(30) not null,
   FECHAELABORACION     date not null,
   primary key (EJERCICIOFISCAL)
);

/*==============================================================*/
/* Table: oferente                                              */
/*==============================================================*/
create table siacam.oferente
(
   NOMBREOFERENTE       varchar(30) not null,
   TELEFONOOFERENTE     varchar(10) not null,
   FAXOFERENTE          varchar(10),
   EMAILOFERENTE        varchar(20) not null,
   TIPOSERVICIO         varchar(20) not null,
   CALIFICACION         varchar(10),
   ESTADOOFERENTE       varchar(10) not null,
   primary key (NOMBREOFERENTE)
);

/*==============================================================*/
/* Table: oferta                                                */
/*==============================================================*/
create table siacam.oferta
(
   NOMBREOFERENTE       varchar(30) not null,
   CODIGOPROCESO        varchar(15) not null,
   ESTADOOFERTA         varchar(10) not null,
   MONTOOFERTA          decimal(10,2) not null,
   primary key (NOMBREOFERENTE, CODIGOPROCESO)
);

/*==============================================================*/
/* Table: ordencompra                                           */
/*==============================================================*/
create table siacam.ordencompra
(
   NOORDEN              int(11) not null,
   CODIGOINSTITUCION    varchar(10) not null,
   FECHA                date not null,
   NOMBRESUMINISTRANTE  varchar(30) not null,
   NITSUMINISTRANTE     varchar(17) not null,
   DIRECCIONSUMINISTRANTE varchar(50) not null,
   MONTOTOTAL           decimal(10,2) not null,
   TOTALLETRAS          varchar(50) not null,
   OBSERVACIONES        varchar(255),
   LUGARENTREGA         varchar(50) not null,
   FECHAENTREGA         date not null,
   NOMBREADMINORDEN     varchar(30) not null,
   TELADMINORDEN        varchar(10) not null,
   EMAILADMINORDEN      varchar(20) not null,
   primary key (NOORDEN)
);

/*==============================================================*/
/* Table: paac                                                  */
/*==============================================================*/
create table siacam.paac
(
   EJERCICIOFISCAL      varchar(4) not null,
   CODIGOINSTITUCION    varchar(10) not null,
   NOMBREINSTITUCION    varchar(30) not null,
   FECHAELABORACION     date not null,
   VERSION              char(1) not null,
   CORRELATIVOMODIFICACION int(11),
   primary key (EJERCICIOFISCAL)
);

/*==============================================================*/
/* Table: solicitudobra                                         */
/*==============================================================*/
create table siacam.solicitudobra
(
   ID_SOLICITUD         decimal(2,0) not null,
   ID_US                decimal(2,0),
   NOMBRESOLICITANTE    varchar(70) not null,
   CARGOSOLICITANTE     varchar(50) not null,
   DEPENDENCIASOLICITANTE varchar(50) not null,
   FECHA                date not null,
   NOMBREAUTORIZANTE    varchar(30) not null,
   CARGOAUTORIZANTE     varchar(15) not null,
   DEPENDENCIAAUTORIZANTE varchar(15) not null,
   JUSTIFICACION        varchar(255) not null,
   VALORESTIMADO        decimal(10,2) not null,
   FORMAENTREGA         varchar(15) not null,
   LUGARENTREGA         varchar(15) not null,
   OTRASCONDICIONES     varchar(100),
   OBSERVACIONES        varchar(255),
   NOMBREADMCONTRATO    varchar(30) not null,
   CARGOADMINCONTRATO   varchar(15) not null,
   DEPENDENCIAADMINCONTRATO varchar(15) not null,
   primary key (ID_SOLICITUD)
);

/*==============================================================*/
/* Table: unidad_solicitante                                    */
/*==============================================================*/
create table siacam.unidad_solicitante
(
   ID_US                decimal(2,0) not null,
   NOMBRE_UNIDAD        varchar(70) not null,
   primary key (ID_US)
);

/*==============================================================*/
/* Table: unspsc                                                */
/*==============================================================*/
create table siacam.unspsc
(
   CODIGO               varchar(8) not null,
   DESCRIPCION          varchar(30) not null,
   primary key (CODIGO)
);

alter table Empleado add constraint FK_Reference_18 foreign key (IDUSER)
      references Usuario (IDUSER) on delete restrict on update restrict;

alter table Usuario add constraint FK_Reference_19 foreign key (IDROL)
      references Rol (IDROL) on delete restrict on update restrict;

alter table siacam.adenda add constraint FK_ADENDA_EXPPROC foreign key (CODIGOPROCESO)
      references siacam.expedienteproceso (CODIGOPROCESO);

alter table siacam.detalleficharetirobases add constraint FK_DETFICRB_EXPPROC foreign key (CODIGOPROCESO)
      references siacam.expedienteproceso (CODIGOPROCESO);

alter table siacam.detalleficharetirobases add constraint FK_DETFICRB_OFEREN foreign key (NOMBREOFERENTE)
      references siacam.oferente (NOMBREOFERENTE);

alter table siacam.detallenecesipaac add constraint FK_DETNECP_LISNECP foreign key (EJERCICIOFISCAL)
      references siacam.listadonecesipaac (EJERCICIOFISCAL);

alter table siacam.detallenecesipaac add constraint FK_DETNECP_UNSPSC foreign key (CODIGOUNSPSC)
      references siacam.unspsc (CODIGO);

alter table siacam.detalleoferta add constraint FK_DETOFERTA_OFERTA foreign key (NOMBREOFERENTE, CODIGOPROCESO)
      references siacam.oferta (NOMBREOFERENTE, CODIGOPROCESO);

alter table siacam.detallepaac add constraint FK_DETPAAC_PAAC foreign key (EJERCICIOFISCAL)
      references siacam.paac (EJERCICIOFISCAL);

alter table siacam.detallepaac add constraint FK_DETPAAC_UNSPSC foreign key (CODIGOUNSPSC)
      references siacam.unspsc (CODIGO);

alter table siacam.detallesolicitudobra add constraint FK_DETSOLOBR_UNSPSC foreign key (CODIGOUNSPSC)
      references siacam.unspsc (CODIGO);

alter table siacam.detallesolicitudobra add constraint FK_Detalle_Solicitud foreign key (ID_SOLICITUD)
      references siacam.solicitudobra (ID_SOLICITUD);

alter table siacam.expedienteproceso add constraint FK_EXPPROC_OFEREN foreign key (NOMBREADJUDICATARIO)
      references siacam.oferente (NOMBREOFERENTE);

alter table siacam.listadonecesipaac add constraint FK_LISNECP_DATINS foreign key (CODIGOINSTITUCION)
      references siacam.datosinstitucionales (CODIGOINSTITUCION);

alter table siacam.oferta add constraint FK_OFERTA_EXPPROC foreign key (CODIGOPROCESO)
      references siacam.expedienteproceso (CODIGOPROCESO);

alter table siacam.oferta add constraint FK_OFERTA_OFEREN foreign key (NOMBREOFERENTE)
      references siacam.oferente (NOMBREOFERENTE);

alter table siacam.ordencompra add constraint FK_ORDCOMP_DATINS foreign key (CODIGOINSTITUCION)
      references siacam.datosinstitucionales (CODIGOINSTITUCION);

alter table siacam.paac add constraint FK_PAAC_DATINS foreign key (CODIGOINSTITUCION)
      references siacam.datosinstitucionales (CODIGOINSTITUCION);

alter table siacam.solicitudobra add constraint FK_Solicitud_UnidadSolicitud foreign key (ID_US)
      references siacam.unidad_solicitante (ID_US);

