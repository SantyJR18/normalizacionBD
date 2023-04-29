/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      ModelosLosArcos.DM1
 *
 * Date Created : Friday, April 28, 2023 18:29:18
 * Target DBMS : Microsoft SQL Server 2017
 */

/* 
 * TABLE: Cliente 
 */

 CREATE DATABASE BDLosArcos;
 go

 use BDLosArcos;
 go
 
CREATE TABLE Cliente(
    idCliente           char(16)         NOT NULL,
    primerNombre        nvarchar(50)     NOT NULL,
    segundoNombre       nvarchar(50)     NULL,
    primerApellido      nvarchar(50)     NOT NULL,
    segundoApellido     nvarchar(50)     NULL,
    direccionCliente    nvarchar(150)    NOT NULL,
    correoCliente       nvarchar(100)    NOT NULL,
    telefonoCliente     char(8)          NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (idCliente)
)
go


IF OBJECT_ID('Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cliente >>>'
go

/* 
 * TABLE: Desparasitantes 
 */

CREATE TABLE Desparasitantes(
    idDesparasitante    int              IDENTITY(1,1),
    nombreDes           nvarchar(100)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (idDesparasitante)
)
go


IF OBJECT_ID('Desparasitantes') IS NOT NULL
    PRINT '<<< CREATED TABLE Desparasitantes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Desparasitantes >>>'
go

/* 
 * TABLE: Diagnosticos 
 */

CREATE TABLE Diagnosticos(
    idDiag             int              IDENTITY(1,1),
    descripcionDiag    nvarchar(100)    NOT NULL,
    fechaDiag          datetime         NOT NULL,
    idExp              int              NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (idDiag)
)
go


IF OBJECT_ID('Diagnosticos') IS NOT NULL
    PRINT '<<< CREATED TABLE Diagnosticos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Diagnosticos >>>'
go

/* 
 * TABLE: Empleados 
 */

CREATE TABLE Empleados(
    idEmpleado            int             IDENTITY(1,1),
    primerNombreEmp       nvarchar(50)    NOT NULL,
    segundoNombreEmp      nvarchar(50)    NULL,
    primerApellidoEmp     nvarchar(50)    NOT NULL,
    SegundoApellidoEmp    nvarchar(50)    NULL,
    fechaContratacion     datetime        NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go


IF OBJECT_ID('Empleados') IS NOT NULL
    PRINT '<<< CREATED TABLE Empleados >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Empleados >>>'
go

/* 
 * TABLE: Empresa 
 */

CREATE TABLE Empresa(
    idEmp           int             IDENTITY(1,1),
    nombreEmp       nvarchar(50)    NOT NULL,
    direccionEmp    nvarchar(10)    NOT NULL,
    telEmp          char(8)         NOT NULL,
    rucEmp          char(20)        NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (idEmp)
)
go


IF OBJECT_ID('Empresa') IS NOT NULL
    PRINT '<<< CREATED TABLE Empresa >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Empresa >>>'
go

/* 
 * TABLE: Especies 
 */

CREATE TABLE Especies(
    idEspecie        int             IDENTITY(1,1),
    nombreEspecie    nvarchar(50)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (idEspecie)
)
go


IF OBJECT_ID('Especies') IS NOT NULL
    PRINT '<<< CREATED TABLE Especies >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Especies >>>'
go

/* 
 * TABLE: Expedientes 
 */

CREATE TABLE Expedientes(
    idExp               int         IDENTITY(1,1),
    fechaCreacionExp    datetime    NOT NULL,
    idPaciente          int         NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (idExp)
)
go


IF OBJECT_ID('Expedientes') IS NOT NULL
    PRINT '<<< CREATED TABLE Expedientes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Expedientes >>>'
go

/* 
 * TABLE: MarcasDesparasitantes 
 */

CREATE TABLE MarcasDesparasitantes(
    idMarcaDes        int             IDENTITY(1,1),
    nombreMarcaDes    nvarchar(50)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (idMarcaDes)
)
go


IF OBJECT_ID('MarcasDesparasitantes') IS NOT NULL
    PRINT '<<< CREATED TABLE MarcasDesparasitantes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MarcasDesparasitantes >>>'
go

/* 
 * TABLE: MarcasVacunas 
 */

CREATE TABLE MarcasVacunas(
    idMarcaVac        int             IDENTITY(1,1),
    nombreMarcaVac    nvarchar(50)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (idMarcaVac)
)
go


IF OBJECT_ID('MarcasVacunas') IS NOT NULL
    PRINT '<<< CREATED TABLE MarcasVacunas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE MarcasVacunas >>>'
go

/* 
 * TABLE: Pacientes 
 */

CREATE TABLE Pacientes(
    idPaciente        int             IDENTITY(1,1),
    nombrePaciente    nvarchar(50)    NOT NULL,
    sexoPaciente      bit             DEFAULT 1 NOT NULL,
    fechaNac          datetime        NOT NULL,
    color             nvarchar(20)    NOT NULL,
    senPart           nvarchar(10)    NULL,
    idCliente         char(16)        NOT NULL,
    idEspecie         int             NOT NULL,
    idRaza            int             NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (idPaciente)
)
go


IF OBJECT_ID('Pacientes') IS NOT NULL
    PRINT '<<< CREATED TABLE Pacientes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Pacientes >>>'
go

/* 
 * TABLE: Razas 
 */

CREATE TABLE Razas(
    idRaza        int             IDENTITY(1,1),
    nombreRaza    nvarchar(50)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (idRaza)
)
go


IF OBJECT_ID('Razas') IS NOT NULL
    PRINT '<<< CREATED TABLE Razas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Razas >>>'
go

/* 
 * TABLE: RegistroConsultas 
 */

CREATE TABLE RegistroConsultas(
    idConsulta       int         IDENTITY(1,1),
    fechaConsulta    datetime    NOT NULL,
    idCliente        char(16)    NOT NULL,
    idPaciente       int         NOT NULL,
    idServicio       int         NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (idConsulta)
)
go


IF OBJECT_ID('RegistroConsultas') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroConsultas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroConsultas >>>'
go

/* 
 * TABLE: RegistroDesparasitaciones 
 */

CREATE TABLE RegistroDesparasitaciones(
    idDesparasitacion       int         IDENTITY(1,1),
    fechaDesparasitacion    datetime    NOT NULL,
    idDesparasitante        int         NOT NULL,
    idMarcaDes              int         NOT NULL,
    idExp                   int         NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (idDesparasitacion)
)
go


IF OBJECT_ID('RegistroDesparasitaciones') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroDesparasitaciones >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroDesparasitaciones >>>'
go

/* 
 * TABLE: RegistroFacturas 
 */

CREATE TABLE RegistroFacturas(
    idFactura     int               IDENTITY(1,1),
    montoTotal    decimal(10, 0)    NOT NULL,
    idCliente     char(16)          NOT NULL,
    idConsulta    int               NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (idFactura)
)
go


IF OBJECT_ID('RegistroFacturas') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroFacturas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroFacturas >>>'
go

/* 
 * TABLE: RegistroVacunaciones 
 */

CREATE TABLE RegistroVacunaciones(
    idVacunacion       int         IDENTITY(1,1),
    fechaVacunacion    datetime    NOT NULL,
    idVacuna           int         NOT NULL,
    idMarcaVac         int         NOT NULL,
    idExp              int         NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (idVacunacion)
)
go


IF OBJECT_ID('RegistroVacunaciones') IS NOT NULL
    PRINT '<<< CREATED TABLE RegistroVacunaciones >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RegistroVacunaciones >>>'
go

/* 
 * TABLE: Roles 
 */

CREATE TABLE Roles(
    idRol        int             IDENTITY(1,1),
    nombreRol    nvarchar(30)    NOT NULL,
    estadoRol    bit             DEFAULT 1 NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (idRol)
)
go


IF OBJECT_ID('Roles') IS NOT NULL
    PRINT '<<< CREATED TABLE Roles >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Roles >>>'
go

/* 
 * TABLE: Servicios 
 */

CREATE TABLE Servicios(
    idServicio        int               IDENTITY(1,1),
    nombreServicio    nvarchar(30)      NOT NULL,
    costoServicio     decimal(10, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (idServicio)
)
go


IF OBJECT_ID('Servicios') IS NOT NULL
    PRINT '<<< CREATED TABLE Servicios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Servicios >>>'
go

/* 
 * TABLE: Usuarios 
 */

CREATE TABLE Usuarios(
    idUsuario        int              IDENTITY(1,1),
    nombreUsuario    nvarchar(30)     NOT NULL,
    contrasenia      nvarchar(100)    NOT NULL,
    idEmpleado       int              NOT NULL,
    idRol            int              NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY NONCLUSTERED (idUsuario)
)
go


IF OBJECT_ID('Usuarios') IS NOT NULL
    PRINT '<<< CREATED TABLE Usuarios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Usuarios >>>'
go

/* 
 * TABLE: Vacunas 
 */

CREATE TABLE Vacunas(
    idVacuna        int              IDENTITY(1,1),
    nombreVacuna    nvarchar(100)    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (idVacuna)
)
go


IF OBJECT_ID('Vacunas') IS NOT NULL
    PRINT '<<< CREATED TABLE Vacunas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Vacunas >>>'
go

/* 
 * TABLE: Diagnosticos 
 */

ALTER TABLE Diagnosticos ADD CONSTRAINT RefExpedientes15 
    FOREIGN KEY (idExp)
    REFERENCES Expedientes(idExp)
go


/* 
 * TABLE: Expedientes 
 */

ALTER TABLE Expedientes ADD CONSTRAINT RefPacientes5 
    FOREIGN KEY (idPaciente)
    REFERENCES Pacientes(idPaciente)
go


/* 
 * TABLE: Pacientes 
 */

ALTER TABLE Pacientes ADD CONSTRAINT RefEspecies2 
    FOREIGN KEY (idEspecie)
    REFERENCES Especies(idEspecie)
go

ALTER TABLE Pacientes ADD CONSTRAINT RefRazas4 
    FOREIGN KEY (idRaza)
    REFERENCES Razas(idRaza)
go

ALTER TABLE Pacientes ADD CONSTRAINT RefCliente1 
    FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
go


/* 
 * TABLE: RegistroConsultas 
 */

ALTER TABLE RegistroConsultas ADD CONSTRAINT RefCliente6 
    FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
go

ALTER TABLE RegistroConsultas ADD CONSTRAINT RefPacientes7 
    FOREIGN KEY (idPaciente)
    REFERENCES Pacientes(idPaciente)
go

ALTER TABLE RegistroConsultas ADD CONSTRAINT RefServicios8 
    FOREIGN KEY (idServicio)
    REFERENCES Servicios(idServicio)
go


/* 
 * TABLE: RegistroDesparasitaciones 
 */

ALTER TABLE RegistroDesparasitaciones ADD CONSTRAINT RefDesparasitantes11 
    FOREIGN KEY (idDesparasitante)
    REFERENCES Desparasitantes(idDesparasitante)
go

ALTER TABLE RegistroDesparasitaciones ADD CONSTRAINT RefMarcasDesparasitantes12 
    FOREIGN KEY (idMarcaDes)
    REFERENCES MarcasDesparasitantes(idMarcaDes)
go

ALTER TABLE RegistroDesparasitaciones ADD CONSTRAINT RefExpedientes14 
    FOREIGN KEY (idExp)
    REFERENCES Expedientes(idExp)
go


/* 
 * TABLE: RegistroFacturas 
 */

ALTER TABLE RegistroFacturas ADD CONSTRAINT RefCliente16 
    FOREIGN KEY (idCliente)
    REFERENCES Cliente(idCliente)
go

ALTER TABLE RegistroFacturas ADD CONSTRAINT RefRegistroConsultas17 
    FOREIGN KEY (idConsulta)
    REFERENCES RegistroConsultas(idConsulta)
go


/* 
 * TABLE: RegistroVacunaciones 
 */

ALTER TABLE RegistroVacunaciones ADD CONSTRAINT RefVacunas9 
    FOREIGN KEY (idVacuna)
    REFERENCES Vacunas(idVacuna)
go

ALTER TABLE RegistroVacunaciones ADD CONSTRAINT RefMarcasVacunas10 
    FOREIGN KEY (idMarcaVac)
    REFERENCES MarcasVacunas(idMarcaVac)
go

ALTER TABLE RegistroVacunaciones ADD CONSTRAINT RefExpedientes13 
    FOREIGN KEY (idExp)
    REFERENCES Expedientes(idExp)
go