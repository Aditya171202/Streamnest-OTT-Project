from django.db import models
from django.contrib.auth import get_user_model
from django.utils.timezone import now

User = get_user_model()

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    subscription_end = models.DateTimeField(default=now)

    def is_active_subscription(self):
        return self.subscription_end > now()

    def __str__(self):
        return self.user.username