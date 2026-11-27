# MathQuest — mise en route

1. **Supabase** : crée un projet gratuit, ouvre *SQL Editor*, colle `supabase.sql`, Run.
2. *Project Settings > API* : copie l'URL et la clé **anon public** dans `index.html` (objet `SB`, en haut du script).
3. **GitHub** : crée un dépôt, dépose ces fichiers, *Settings > Pages* > branche `main`, dossier `/ (root)`. Le jeu est en ligne à l'adresse affichée.
   (Sans clés Supabase, le jeu marche en mode local pour tester.)

## Ajouter un chapitre
Dépose un fichier dans `content/` et ajoute son nom dans `content/index.json`.

```json
{"id":"xx","titre":"Titre","niveau":"1ère Spé","cartes":[
 {"id":"1","d":1,"q":"Question ($LaTeX$)","a":"Bonne réponse","p":["Piège 1","Piège 2","Piège 3"]}]}
```
`d` = difficulté 1 à 5 · `p` = mauvaises réponses plausibles (erreurs classiques). Dans le JSON, écris `\\` pour chaque `\` de LaTeX.

## Limites de cette v1
- Le PIN (haché) et le score sont lisibles et modifiables par un joueur technique : OK entre élèves, pas pour un concours.
- Supabase gratuit met le projet en pause après ~7 jours sans activité (reprise en un clic dans le tableau de bord).
