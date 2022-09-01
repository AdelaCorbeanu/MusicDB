---sa se afiseze numele melodiilor interpretate de artistii care au inregistrat in studio-urile in care a 
--inregistrat si michael jackson (exclusiv)
with studios_mj as 
            (select id_studio
            from artist, interpreteaza, melodie
            where melodie.id_melodie = interpreteaza.id_melodie
                  and artist.id_artist = interpreteaza.id_artist
                  and lower(artist.nume) = 'michael jackson'),
      artists_mj as
            (select artist.id_artist
            from artist, interpreteaza, melodie, studios_mj
            where artist.id_artist = interpreteaza.id_artist
                  and melodie.id_melodie = interpreteaza.id_melodie
                  and melodie.id_studio = studios_mj.id_studio
                  and lower(artist.nume) != 'michael jackson')
select melodie.titlu
from melodie, interpreteaza, artists_mj
where melodie.id_melodie = interpreteaza.id_melodie
      and interpreteaza.id_artist = artists_mj.id_artist;
      
      
--Pentru fiecare melodie, sa se afiseze numele ei si albumul in care este inclusa sau textul "Single" daca aceasta nu are album, 
--precum si numele ultimului playlist in care a fost inclusa sau textul "Not included" daca nu a fost inclusa in niciunul,
--ordonate alfabetic dupa numele melodiei
with ultima_data as
     (select max(playlist.data_crearii) Data, melodie.id_melodie
      from playlist, melodie, inclusa_in
      where melodie.id_melodie = inclusa_in.id_melodie
      and playlist.id_playlist = inclusa_in.id_playlist
      group by melodie.id_melodie)
select melodie.titlu, decode(melodie.id_album, null, 'Single', (select album.nume
                                                                from album
                                                                where id_album = melodie.id_album)) Album,
       nvl((select playlist.nume
            from playlist, ultima_data
            where playlist.data_crearii = ultima_data.Data
            and melodie.id_melodie = ultima_data.id_melodie), 'meow') "ULTIMUL PLAYLIST"
from melodie
order by 1;



--pentru fiecare playlist al carui nume incepe cu aceeasi litera ca numele celui mai tanar artist care a inregistrat la 
--studio-ul cu cel mai lung nume, sa se calculeze si sa se afiseze diferenta de luni dintre cea mai noua si cea mai veche melodie din 
--el si sa se adune rezultatul obtinut la data_crearii playlist-ului si sa se afiseze, alaturi de nume
with Max as (select max(data_lansarii) rez, playlist.id_playlist id_p
             from melodie, inclusa_in, playlist
             where melodie.id_melodie = inclusa_in.id_melodie
             and playlist.id_playlist = inclusa_in.id_playlist
             group by playlist.id_playlist),
     Min as (select min(data_lansarii) rez, playlist.id_playlist id_p
             from melodie, inclusa_in, playlist
             where melodie.id_melodie = inclusa_in.id_melodie
             and playlist.id_playlist = inclusa_in.id_playlist
             group by playlist.id_playlist)
select add_months(data_crearii, months_between(Max.rez, Min.rez)) data_crearii, nume, round(months_between(Max.rez, Min.rez)) diferenta
from playlist, Max, Min
where lower(substr(nume, 1, 1)) =  (select lower(substr(artist.nume, 1, 1))
                                    from artist
                                    where data_nasterii = (select max(artist.data_nasterii)
                                                           from artist
                                                           where artist.id_artist in (select artist.id_artist
                                                                                      from artist, interpreteaza, melodie, studio
                                                                                      where artist.id_artist = interpreteaza.id_artist
                                                                                      and melodie.id_melodie = interpreteaza.id_melodie
                                                                                      and melodie.id_studio = studio.id_studio
                                                                                      and length(studio.nume) = (select max(length(studio.nume))
                                                                                                                 from studio))))
       and playlist.id_playlist = Max.id_p
       and playlist.id_playlist = Min.id_p;
       
       

--Pentru melodiile la care se cunosc compozitorii versurilor si care incep cu litera 'L' sa se afiseze textul 'L found', pentru 
--cele cu litera 'T' textul 'T found', iar pentru celelalte textul 'Nothing found' si sa se denumeasca coloana 'Search' si 
--afisati pentru fiecare melodie si cel mai tanar compozitor de versuri al acesteia
select melodie.titlu, 
       case lower(substr(melodie.titlu, 1, 1))
       when 'l' then 'L found'
       when 't' then 'T found'
       else 'Nothing found'
       end 
       as Search,
       compozitor_versuri.prenume||' '||compozitor_versuri.nume Compozitor
from melodie, compozitor_versuri, compune_versuri
where melodie.id_melodie = compune_versuri.id_melodie
      and compozitor_versuri.id_compozitor_versuri = compune_versuri.id_compozitor_versuri
      and compozitor_versuri.data_nasterii = (select max(data_nasterii)
                                              from compozitor_versuri, compune_versuri
                                              where compozitor_versuri.id_compozitor_versuri = compune_versuri.id_compozitor_versuri
                                                    and compune_versuri.id_melodie = melodie.id_melodie);
                                                    
select melodie.titlu, max(compozitor_versuri.data_nasterii)
from melodie, compune_versuri, compozitor_versuri
where melodie.id_melodie = compune_versuri.id_melodie
and compozitor_versuri.id_compozitor_versuri = compune_versuri.id_compozitor_versuri
group by melodie.titlu;



--sa se afiseze melodiile de pe cel mai vechi album al The Beatles, lansat dupa albumul "My Way"
select melodie.titlu, album.nume Album
from melodie, album, artist, apartine
where melodie.id_album = album.id_album
      and album.id_album = apartine.id_album
      and artist.id_artist = apartine.id_artist
      and lower(artist.nume) = 'the beatles' 
      and album.id_album = (select album.id_album
                            from album, apartine, artist
                            where album.id_album = apartine.id_album 
                                  and artist.id_artist = apartine.id_artist
                                  and lower(artist.nume) = 'the beatles'
                                  and data_lansarii = (select min(data_lansarii)
                                                       from album, apartine, artist
                                                       where album.id_album = apartine.id_album 
                                                       and artist.id_artist = apartine.id_artist
                                                       and lower(artist.nume) = 'the beatles'
                                                       and data_lansarii > (select data_lansarii
                                                                            from album
                                                                            where lower(nume) = 'my way')));



--Sa se adauge toate melodiile lui Freddie Mercury la cel mai vechi album Queen
update melodie
set id_album = (select id_album
                from album
                where data_lansarii = (select min(data_lansarii)
                                       from album
                                       where id_album in (select album.id_album
                                                          from album, artist, apartine
                                                          where album.id_album = apartine.id_album
                                                          and artist.id_artist = apartine.id_artist
                                                          and lower(artist.nume) = 'queen')))
where melodie.id_melodie in (select melodie.id_melodie
                             from melodie, artist, interpreteaza
                             where melodie.id_melodie = interpreteaza.id_melodie
                             and artist.id_artist = interpreteaza.id_artist
                             and lower(artist.nume) = 'freddie mercury');


--Sa se stearga toate albumele in care inca nu au fost inserate melodii
delete from album 
where id_album in (select A.id_album
                   from album A
                   where (select count(id_melodie)
                          from melodie
                          where id_album = A.id_album) = 0);

--Sa se stearga studio-urile in care au fost inregistrate cele mai putine melodii
delete from studio
where id_studio not in (select id_studio
                        from studio join melodie using (id_studio)
                        group by id_studio);



--sa se afiseze numele melodiilor, numele albumului din care fac parte si compozitorul instrumentalului, precum si studio-urile 
--unde au fost inregistrate; se vor afisa si melodiile care nu au album sau pentru care nu se cunoaste studio-ul sau pentru care
--nu se cunoaste compozitorul
select titlu, album.nume Album, studio.nume Studio, B.prenume||' '||B.nume Compozitor
from melodie, album, studio, compune_instrumental A, compozitor_instrumental B
where melodie.id_album = album.id_album(+)
      and melodie.id_studio = studio.id_studio(+)
      and melodie.id_melodie = A.id_melodie(+)
      and A.id_compozitor_instrumental = B.id_compozitor_instrumental(+);


--sa se afiseze melodiile care nu au fost incluse in niciun playlist
select id_melodie
from melodie
minus 
select melodie.id_melodie
from melodie, inclusa_in, playlist
where melodie.id_melodie = inclusa_in.id_melodie
      and playlist.id_playlist = inclusa_in.id_playlist;
      
      
--sa se afiseze toate melodiile pentru care nu se cunosc compozitorii versurilor
select id_melodie
from melodie
minus
select melodie.id_melodie
from melodie, compune_versuri, compozitor_versuri
where melodie.id_melodie = compune_versuri.id_melodie
      and compozitor_versuri.id_compozitor_versuri = compune_versuri.id_compozitor_versuri;
      
      
--sa se afiseze melodiile care au fost incluse in toate playlist-urile care incep cu litera J
select id_melodie
from inclusa_in I
where id_playlist in (select id_playlist
                      from playlist
                      where lower(nume) like 'j%')
group by id_melodie
having count(id_playlist) = (select count(*)
                            from playlist
                            where lower(nume) like 'j%');


select id_melodie
from inclusa_in I
where not exists
                (select 1 
                from playlist P
                where lower(nume) like 'j%'
                and not exists
                                (select 'x'
                                from inclusa_in
                                where id_playlist = P.id_playlist
                                and id_melodie = I.id_melodie));


