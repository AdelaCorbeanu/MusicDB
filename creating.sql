create table artist (
    id_artist number(4) primary key,
    nume varchar(30) not null,
    data_nasterii date);
    
create table album (
    id_album number(4) primary key,
    nume varchar(30) not null,
    data_lansarii date);
    
create table apartine (
    id_artist number(4) references artist(id_artist) on delete cascade,
    id_album number(4) references album(id_album) on delete cascade);
    
create table studio (
    id_studio number(4) primary key,
    nume varchar(30) not null);
    
create table melodie (
    id_melodie number(4) primary key,
    id_album number(4) references album(id_album) on delete cascade,
    id_studio number(4) references studio(id_studio) on delete set null,
    titlu varchar(30) not null,
    data_lansarii date);
    
create table interpreteaza (
    id_melodie number(4) references melodie(id_melodie) on delete cascade,
    id_artist number(4) references artist(id_artist) on delete set null);

create table abonament (
    id_abonament number(4) primary key,
    nume varchar(20),
    pret number(3),
    data_inceperii date,
    data_expirarii date);
    
create table utilizator (
    id_utilizator number(4) primary key,
    id_abonament number(4) references abonament(id_abonament) on delete set null,
    nume varchar(20),
    prenume varchar(20), 
    data_nasterii date,
    data_inscriere date default sysdate);
    
create table playlist (
    id_playlist number(4) primary key,
    id_utilizator number(4) references utilizator(id_utilizator) on delete set null,
    nume varchar(30) not null,
    data_crearii date default sysdate);
    
create table inclusa_in (
    id_melodie number(4) references melodie(id_melodie) on delete cascade,
    id_playlist number(4) references playlist(id_playlist) on delete cascade);
    
create table compozitor_versuri (
    id_compozitor_versuri number(4) primary key,
    nume varchar(20) not null,
    prenume varchar(20) not null,
    data_nasterii date);
    
create table compune_versuri (
    id_compozitor_versuri number(4) references compozitor_versuri(id_compozitor_versuri) on delete set null,
    id_melodie number(4) references melodie(id_melodie) on delete cascade);
    
create table compozitor_instrumental (
    id_compozitor_instrumental number(4) primary key,
    nume varchar(20) not null,
    prenume varchar(20) not null,
    data_nasterii date);
    
create table compune_instrumental (
    id_compozitor_instrumental number(4) references compozitor_instrumental(id_compozitor_instrumental) on delete set null,
    id_melodie number(4) references melodie(id_melodie) on delete cascade);
    
    
