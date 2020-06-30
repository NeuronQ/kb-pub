# Problem:
```
django.db.utils.IntegrityError: duplicate key value violates unique constraint “django_content_type_pkey”

OR

django.db.utils.IntegrityError: duplicate key value violates unique constraint “auth_permission_pkey”
```

## TL;DR: Probably just run this
```sh
python manage.py sqlsequencereset auth | python manage.py dbshell
```
FROM:
    https://stackoverflow.com/questions/46785841/django-db-utils-integrityerror-duplicate-key-value-violates-unique-constraint

## Can also be fixed from DB side "manually"
```sql
SELECT setval('django_content_type_id_seq', (SELECT MAX(id) FROM django_content_type));
```
FROM:
    https://stackoverflow.com/questions/19135161/django-db-utils-integrityerror-duplicate-key-value-violates-unique-constraint
