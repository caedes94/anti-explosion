### Description Courte du Script Anti-Explosion pour FiveM

Ce script pour FiveM surveille les explosions déclenchées par les joueurs et expulse ceux qui en déclenchent trop, afin de prévenir les abus d'explosifs et de tricherie. Voici les principales fonctionnalités :

1. **Détection d'Explosions (Côté Client)** :
   - Le script client détecte les explosions autour du joueur et informe le serveur.

2. **Suivi des Explosions (Côté Serveur)** :
   - Le script serveur garde une trace du nombre d'explosions déclenchées par chaque joueur.

3. **Expulsion des Joueurs** :
   - Si un joueur atteint la limite de 4 explosions, il est automatiquement expulsé du serveur avec un message d'avertissement.

4. **Notification par Webhook** :
   - Lorsqu'un joueur est expulsé, une notification est envoyée à un canal Discord via un webhook pour informer les administrateurs.

Ce script aide à maintenir l'équilibre du jeu en décourageant les comportements perturbateurs dus à l'usage abusif d'explosifs et à expulser les tricheurs qui utilisent des explosions pour nuire aux autres joueurs.
