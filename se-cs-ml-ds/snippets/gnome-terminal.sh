## Script to open multiple tabs
# manage.py runserver
gnome-terminal --tab -- bash -c 'printf "\033]0;PGN:back\007";\
  . ./venv_dev/bin/activate; \
  cd pgn-pigeonapp-cms; \
  python manage.py runserver; \
  exec bash'
# npm run serve
gnome-terminal --tab -- bash -c 'printf "\033]0;PGN:front\007";\
  cd ./pgn-pigeonapp-cms/pgn-shopify-admin-frontend; \
  npm run serve; \
  exec bash'
