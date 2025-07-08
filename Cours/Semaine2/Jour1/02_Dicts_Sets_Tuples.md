
# Dictionnaires, Ensembles et Tuples
**Semaine 1 : Module 1**

## Jour 2

- Dictionnaires, Ensembles et Tuples
- **LAB | Dictionnaires, Ensembles et Tuples**
- Compréhension de Liste
- **LAB | Compréhension de Liste**

---

## Matériel du Jour

### Dictionnaires, Ensembles et Tuples
**LEÇON**

---

## Objectifs de la Leçon

- Apprendre à utiliser les tuples
- Apprendre à utiliser les dictionnaires
- Apprendre à utiliser les ensembles

---

## Introduction

Dans la leçon précédente, nous avons appris les listes. Les listes sont l’une des structures de données les plus importantes en Python. Cependant, on ne peut pas tout faire uniquement avec des listes. Il existe de nombreux cas où d’autres structures de données sont mieux adaptées. Cette leçon présente trois autres structures de données essentielles en Python.

---

## Tuples

Les tuples sont des séquences comme les listes. La principale différence est que les tuples sont **immuables** : leurs valeurs ne peuvent pas être modifiées une fois définies.

On définit un tuple en utilisant des parenthèses :

```python
chocolates = ('noir', 'lait', 'semi-sucré')
```

**Explication :** On crée un tuple de trois éléments.

Pour accéder à un élément, même méthode qu’avec une chaîne de caractères :

```python
chocolates[0]
# 'noir'
```

**Explication :** On récupère le premier élément.

Si on tente de modifier un élément, on obtient une erreur :

```python
chocolates[3] = 'fourré caramel'
# TypeError: 'tuple' object does not support item assignment
```

**Explication :** Impossible de modifier un tuple.

On peut calculer la longueur :

```python
len(chocolates)
# 3
```

**Explication :** Le tuple contient trois éléments.

Si on dépasse la longueur, erreur :

```python
chocolates[10]
# IndexError
```

**Explication :** Dépassement d’indice.

On peut itérer comme pour une liste :

```python
for chocolate in chocolates:
    print(chocolate)

# noir
# lait
# semi-sucré
```

**Explication :** Boucle `for` classique sur un tuple.

---

## Dictionnaires

Parfois, on ne veut pas seulement stocker une suite de données, mais pouvoir y accéder facilement ou y associer un libellé. Exemple : dans un téléphone, les numéros sont étiquetés par nom de contact. Un **dictionnaire** (dict) est donc plus adapté. Un dict est une collection de paires **clé-valeur**, organisée en table de hachage.

On peut créer un dict manuellement :

```python
contacts = {'John': '312-555-1234', 'Paul': '312-555-3123',
            'George': '312-555-3333', 'Ringo': '312-555-2222'}
```

**Explication :** Chaque nom est une clé, chaque numéro une valeur.

Accéder aux clés :

```python
contacts.keys()
# dict_keys(['John', 'Paul', 'George', 'Ringo'])
```

Accéder aux valeurs :

```python
contacts.values()
# dict_values(['312-555-1234', '312-555-3123', '312-555-3333', '312-555-2222'])
```

Lister clés et valeurs :

```python
contacts.items()
# dict_items([('John', '312-555-1234'), ('Paul', '312-555-3123'), ...])
```

Ajouter une entrée :

```python
contacts['Pete'] = '312-555-1111'
```

Modifier une valeur :

```python
contacts['Paul'] = '312-555-4444'
```

Supprimer une entrée :

```python
del contacts['Pete']
```

Créer un dict vide :

```python
empty_dict = {}
```

**Explication :** Un dict vide prêt à remplir.

---

## Parcourir un Dictionnaire

- `keys()` pour les clés  
- `values()` pour les valeurs  
- `items()` pour les paires clé-valeur

```python
for i in contacts.keys():
    print(i)

# John, Paul, George, Ringo

for i in contacts.values():
    print(i)

# 312-555-1234, etc.

for k, v in contacts.items():
    print(k + ": " + v)

# John: 312-555-1234, etc.
```

**Explication :** Itération simple selon besoin.

---

## Compréhension de Dictionnaire

Comme pour les listes, on peut générer un dict avec une compréhension :

```python
international = {k: "+1-" + v for k, v in contacts.items()}
for k, v in international.items():
    print(k + ": " + v)
```

**Explication :** On préfixe chaque numéro avec l’indicatif.

---

## Ensembles (Sets)

Les ensembles sont des collections non ordonnées d’éléments **uniques**. Ils sont mutables : on peut ajouter ou supprimer des éléments.

Créer un set vide :

```python
letters = set()
```

Ajouter un élément :

```python
letters.add('a')
print(letters)
# {'a'}
```

Supprimer un élément :

```python
letters.remove('a')
print(letters)
# set()
```

**Attention :** `remove` lève une erreur si l’élément n’existe pas. `pop` supprime un élément au hasard sans erreur.

---

## Union, Intersection, Différence

Les sets permettent de comparer facilement des valeurs.

```python
girl_names = set(['Mary', 'Madison', 'Logan', 'Joanna'])
boy_names = set(['John', 'Alexander', 'Logan', 'Madison'])

unisex_names = girl_names.intersection(boy_names)
print(unisex_names)
# {'Logan', 'Madison'}

all_names = boy_names.union(girl_names)
print(all_names)
# {'John', 'Alexander', 'Logan', 'Mary', 'Madison', 'Joanna'}

boy_only_names = boy_names - girl_names
print(boy_only_names)
# {'John', 'Alexander'}
```

**Explication :** Intersection, union, et différence de sets.

---

## Résumé

Dans cette leçon, nous avons exploré **tuple**, **dict** et **set** :  
- Les tuples sont **immuables**.  
- Les dictionnaires associent un libellé à chaque valeur.  
- Les ensembles contiennent des valeurs **uniques** et permettent l’union, l’intersection et la différence.  

Ces structures sont essentielles pour bien organiser et traiter vos données en Python.

---
