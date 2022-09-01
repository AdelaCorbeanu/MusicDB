create sequence artisti
start with 100
nocycle
nocache;

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Joji', to_date('18/09/1992', 'DD/MM/YYYY'));

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Pink Guy', to_date('18/09/1992', 'DD/MM/YYYY'));

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Michael Jackson', to_date('29/08/1958', 'DD/MM/YYYY'));

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Queen', null);

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'The Beatles', null);

SELECT * from artist;

create sequence studios
start with 100
nocycle
nocache;

insert into studio (id_studio, nume)
values (studios.nextval, '88rising');

insert into studio (id_studio, nume)
values (studios.nextval, 'Motown Studios');

insert into studio (id_studio, nume)
values (studios.nextval, 'Westlake Recording Studios');

insert into studio (id_studio, nume)
values (studios.nextval, 'Abbey Road Studios');

insert into studio (id_studio, nume)
values (studios.nextval, 'Trident Studios');

select * from studio;

commit;

create sequence albume
start with 100
nocycle
nocache;

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Nectar', to_date('25/09/2020', 'DD/MM/YYYY'));

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Yadada Mean', to_date('18/05/2017', 'DD/MM/YYYY'));

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Let It Be', to_date('08/05/1970', 'DD/MM/YYYY'));

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'A Night At The Opera', to_date('21/11/1975', 'DD/MM/YYYY'));

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Help!', to_date('06/08/1965', 'DD/MM/YYYY'));

select * from album;

commit;

create sequence melodii
start with 100
nocycle
nocache;

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 104, 103, 'Yesterday', to_date('06/08/1965', 'DD/MM/YYYY'));

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 102, 103, 'Two of us', to_date('08/05/1970', 'DD/MM/YYYY'));

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 103, 104, 'Love of My Life', to_date('21/11/1975', 'DD/MM/YYYY'));

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 100, 100, 'Sanctuary', to_date('14/06/2019', 'DD/MM/YYYY'));

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, null, 102, 'Loving You', to_date('06/05/2014', 'DD/MM/YYYY'));

select * from melodie;

commit;

insert into interpreteaza (id_melodie, id_artist)
values (100, 104);

insert into interpreteaza (id_melodie, id_artist)
values (101, 104);

insert into interpreteaza (id_melodie, id_artist)
values (102, 103);

insert into interpreteaza (id_melodie, id_artist)
values (103, 100);

insert into interpreteaza (id_melodie, id_artist)
values (104, 102);

commit;

insert into apartine (id_artist, id_album)
values (100, 100);

insert into apartine (id_artist, id_album)
values (101, 101);

insert into apartine (id_artist, id_album)
values (104, 102);

insert into apartine (id_artist, id_album)
values (103, 103);

insert into apartine (id_artist, id_album)
values (104, 104);

commit;

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'David Bowie', to_date('08/01/1947', 'DD/MM/YYYY'));   --105

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Freddie Mercury', to_date('05/09/1946', 'DD/MM/YYYY'));  --106

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Frank Sinatra', to_date('12/12/1915', 'DD/MM/YYYY'));  --107

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Linda McCartney', to_date('24/09/1941', 'DD/MM/YYYY'));  --108

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Paul McCartney', to_date('18/06/1942', 'DD/MM/YYYY'));  --109

insert into artist (id_artist, nume, data_nasterii)
values (artisti.nextval, 'Elvis Presley', to_date('08/01/1935', 'DD/MM/YYYY'));  --110

commit;

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Mr. Bad Guy', to_date('29/04/1985', 'DD/MM/YYYY'));

insert into studio (id_studio, nume)
values (studios.nextval, 'Columbia Records');

select * from album;
select * from artist;
select * from studio;
select * from melodie;

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 105, 105, 'There Must Be More to Life', to_date('29/04/1985', 'DD/MM/YYYY'));

insert into interpreteaza (id_melodie, id_artist)
values (105, 106);

insert into interpreteaza (id_melodie, id_artist)
values (105, 102);

set define off;
insert into studio (id_studio, nume)
values (studios.nextval, 'A&R Recording');

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'Ram', to_date('17/05/1971', 'DD/MM/YYYY'));

insert into apartine (id_artist, id_album)
values (108, 106);

insert into apartine (id_artist, id_album)
values (109, 106);

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, null, null, 'Fly Me to the Moon', to_date('01/04/1954', 'DD/MM/YYYY'));

insert into interpreteaza (id_melodie, id_artist)
values (106, 107);

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, null, null, 'Under Pressure', to_date('26/10/1981', 'DD/MM/YYYY'));

insert into interpreteaza (id_melodie, id_artist)
values (107, 105);

insert into interpreteaza (id_melodie, id_artist)
values (107, 103);

select * from interpreteaza;
select * from apartine;

select * from album;
select * from artist;
select * from studio;
select * from melodie;

insert into apartine (id_artist, id_album)
values (106, 105);

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'From Elvis in Memphis', to_date('17/06/1969', 'DD/MM/YYYY'));

insert into apartine (id_artist, id_album)
values (110, 107);

insert into album (id_album, nume, data_lansarii)
values (albume.nextval, 'My Way', to_date('01/03/1969', 'DD/MM/YYYY'));

insert into apartine (id_artist, id_album)
values (107, 108);

create sequence abonamente
start with 100
nocycle
nocache;

insert into abonament (id_abonament, nume, pret, data_inceperii, data_expirarii)
values (abonamente.nextval, 'May Standard', 40, to_date('04/05/2022', 'DD/MM/YYYY'), to_date('04/06/2022', 'DD/MM/YYYY'));

commit;

insert into abonament (id_abonament, nume, pret, data_inceperii, data_expirarii)
values (abonamente.nextval, 'May Premium', 80, to_date('07/05/2022', 'DD/MM/YYYY'), to_date('07/07/2022', 'DD/MM/YYYY'));

insert into abonament (id_abonament, nume, pret, data_inceperii, data_expirarii)
values (abonamente.nextval, 'Permanent', 200, null, null);

insert into abonament (id_abonament, nume, pret, data_inceperii, data_expirarii)
values (abonamente.nextval, 'June Standard', 45, to_date('02/06/2022', 'DD/MM/YYYY'), to_date('02/07/2022', 'DD/MM/YYYY'));

insert into abonament (id_abonament, nume, pret, data_inceperii, data_expirarii)
values (abonamente.nextval, 'June Premium', 90, to_date('03/06/2022', 'DD/MM/YYYY'), to_date('03/08/2022', 'DD/MM/YYYY'));

select * from abonament;

commit;

create sequence utilizatori
start with 100
nocycle 
nocache;

insert into utilizator (id_utilizator, id_abonament, nume, prenume, data_nasterii, data_inscriere)
values (utilizatori.nextval, 100, 'Tava', 'Andrei', to_date('19/11/2002', 'DD/MM/YYYY'), to_date('10/04/2022', 'DD/MM/YYYY'));

insert into utilizator (id_utilizator, id_abonament, nume, prenume, data_nasterii, data_inscriere)
values (utilizatori.nextval, 101, 'Diaconu', 'Stefan', to_date('22/11/2002', 'DD/MM/YYYY'), to_date('04/03/2022', 'DD/MM/YYYY'));

insert into utilizator (id_utilizator, id_abonament, nume, prenume, data_nasterii, data_inscriere)
values (utilizatori.nextval, 102, 'Ancuta', 'Andrei', to_date('06/03/2002', 'DD/MM/YYYY'), to_date('15/05/2022', 'DD/MM/YYYY'));

insert into utilizator (id_utilizator, id_abonament, nume, prenume, data_nasterii, data_inscriere)
values (utilizatori.nextval, 103, 'Simion', 'Petrica', to_date('19/08/2002', 'DD/MM/YYYY'), to_date('02/06/2022', 'DD/MM/YYYY'));

insert into utilizator (id_utilizator, id_abonament, nume, prenume, data_nasterii, data_inscriere)
values (utilizatori.nextval, 104, 'Biciusca', 'Matei', to_date('06/10/2002', 'DD/MM/YYYY'), to_date('15/05/2022', 'DD/MM/YYYY'));

select * from utilizator;

commit;

create sequence playlists
start with 100
nocycle
nocache;

insert into playlist (id_playlist, id_utilizator, nume, data_crearii)
values (playlists.nextval, 100, 'Mood Music', to_date('18/05/2022', 'DD/MM/YYYY'));

insert into playlist (id_playlist, id_utilizator, nume, data_crearii)
values (playlists.nextval, 100, 'Meowlist', to_date('27/05/2022', 'DD/MM/YYYY'));

insert into playlist (id_playlist, id_utilizator, nume, data_crearii)
values (playlists.nextval, 101, 'January 2021', to_date('12/03/2022', 'DD/MM/YYYY'));

insert into playlist (id_playlist, id_utilizator, nume, data_crearii)
values (playlists.nextval, 102, 'Mishu', to_date('12/06/2022', 'DD/MM/YYYY'));

insert into playlist (id_playlist, id_utilizator, nume, data_crearii)
values (playlists.nextval, 104, '24/7 Grind', to_date('20/05/2022', 'DD/MM/YYYY'));

insert into melodie (id_melodie, id_album, id_studio, titlu, data_lansarii)
values (melodii.nextval, 101, null, 'Nickelodeon Girls', to_date('13/03/2017', 'DD/MM/YYYY'));

select * from melodie;
select * from playlist;

insert into inclusa_in (id_melodie, id_playlist)
values (108, 100);

insert into inclusa_in (id_melodie, id_playlist)
values (105, 100);

insert into inclusa_in (id_melodie, id_playlist)
values (100, 101);

insert into inclusa_in (id_melodie, id_playlist)
values (101, 100);

insert into inclusa_in (id_melodie, id_playlist)
values (101, 101);

insert into inclusa_in (id_melodie, id_playlist)
values (104, 102);

insert into inclusa_in (id_melodie, id_playlist)
values (102, 103);

insert into inclusa_in (id_melodie, id_playlist)
values (106, 103);

insert into inclusa_in (id_melodie, id_playlist)
values (107, 103);

insert into inclusa_in (id_melodie, id_playlist)
values (100, 104);

select * from inclusa_in; 

commit;

create sequence versuri
start with 100
nocycle
nocache;

insert into compozitor_versuri (id_compozitor_versuri, nume, prenume, data_nasterii)
values (versuri.nextval, 'Lennon', 'John', to_date('09/10/1940', 'DD/MM/YYYY'));

insert into compozitor_versuri (id_compozitor_versuri, nume, prenume, data_nasterii)
values (versuri.nextval, 'McCartney', 'Paul', to_date('18/06/1942', 'DD/MM/YYYY'));

insert into compozitor_versuri (id_compozitor_versuri, nume, prenume, data_nasterii)
values (versuri.nextval, 'Mercury', 'Freddie', to_date('05/09/1946', 'DD/MM/YYYY'));

insert into compozitor_versuri (id_compozitor_versuri, nume, prenume, data_nasterii)
values (versuri.nextval, 'Bowie', 'David', to_date('08/01/1947', 'DD/MM/YYYY'));

insert into compozitor_versuri (id_compozitor_versuri, nume, prenume, data_nasterii)
values (versuri.nextval, 'Jackson', 'Michael', to_date('29/08/1958', 'DD/MM/YYYY'));

select * from compozitor_versuri;

commit;

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (101, 100);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (101, 101);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (100, 101);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (102, 102);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (102, 105);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (104, 105);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (104, 104);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (103, 107);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (100, 100);

insert into compune_versuri (id_compozitor_versuri, id_melodie)
values (102, 107);


select * from compune_versuri;

commit;

create sequence instrumental
start with 100
nocycle
nocache;

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'McCartney', 'Paul', to_date('18/06/1942', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'May', 'Brian', to_date('19/07/1947', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'Taylor', 'Roger', to_date('26/06/1949', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'Deacon', 'John', to_date('19/08/1951', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'Jackson', 'Michael', to_date('29/08/1958', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'Bowie', 'David', to_date('08/01/1947', 'DD/MM/YYYY'));

insert into compozitor_instrumental (id_compozitor_instrumental, nume, prenume, data_nasterii)
values (instrumental.nextval, 'Lennon', 'John', to_date('09/10/1940', 'DD/MM/YYYY'));

select * from compozitor_instrumental;

commit;

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (100, 100);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (100, 101);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (101, 107);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (102, 107);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (103, 107);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (104, 105);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (104, 104);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (105, 107);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (106, 101);

insert into compune_instrumental (id_compozitor_instrumental, id_melodie)
values (106, 100);

select * from compune_instrumental;

commit;


