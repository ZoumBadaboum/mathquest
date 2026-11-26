-- À coller dans Supabase > SQL Editor > Run
create table joueurs(
  pseudo text primary key check (char_length(pseudo) between 1 and 20),
  pin text not null default '',
  xp int not null default 0,
  xp_semaine int not null default 0,
  semaine text not null default '',
  progression jsonb not null default '{}'
);
alter table joueurs enable row level security;
create policy "lecture" on joueurs for select using (true);
create policy "ajout"   on joueurs for insert with check (true);
create policy "maj"     on joueurs for update using (true) with check (true);
-- Pas de policy delete : tu supprimes un pseudo depuis le Table Editor.
