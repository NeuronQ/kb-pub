from django.core.management.utils import get_random_secret_key
get_random_secret_key()

# safedelelte
#################################################
# get deleted
User.objects.all_with_deleted().get(email='qa.msl.5@deepsine.com')
