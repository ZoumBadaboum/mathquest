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

## Codes promo (rubis)
Les codes sont dans `content/codes.json` sous forme de **hachés** (le code lui-même n'est pas lisible) : `{"<hash du code>": nombre_de_rubis}`. Pour en créer un, ouvre le jeu, ouvre la console du navigateur (F12) et tape `await sha('MONCODE')` (en MAJUSCULES) ; copie le résultat dans `codes.json`. Un code ne peut être utilisé qu'une fois par compte. Code existant : KERLAN (50 rubis).

## QCM Bac et Exos types bac (annales)
`content/qcm_bac.json` (QCM) et `content/exos_bac.json` (exercices + corrections) sont **générés** à partir des annales en markdown :

```bash
pip install mistune
python tools/convert_annales.py annales_partie1.md annales_partie2.md
```
Le script lit les balises `2nde`, `Chapitre : …`, `Région : …`, les ✅ des QCM et les blocs `> **Correction.**` des exercices. Relance-le quand tu changes les annales, puis pousse les deux JSON.
Réglages dans `index.html` : `N2CH` = chapitres rangés sous « Niveau 2nde » dans le QCM Bac ; `ALIAS` = chapitres fusionnés (ex. « Probabilités » → « Probabilités conditionnelles »).
