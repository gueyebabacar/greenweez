#!/usr/bin/env bash

set -e
set -x

# Update api / Market / BO / POS

git fetch

git checkout -f ${1:-origin/develop}

if [ -d scripts ]
 then
  chmod +x scripts/*.sh
fi

git submodule init

git submodule update --force

for i in api
    do
          cd $i
          composer install

          if [ "$i" = "api" ]
          then
             /usr/bin/php bin/console doctrine:migrations:migrate --no-interaction
             /usr/bin/php bin/console fos:elastica:populate
          fi

          #if [ "$i" = "marketplace" ]
          #then
          #   npm run build-all
          #fi

#          if [ "$i" = "bo" ]
#          then
#             yarn install
#             yarn build
#          fi

          /usr/bin/php bin/console cache:clear --env=prod --no-warmup
          /usr/bin/php bin/console cache:clear --env=dev --no-warmup
          chown -R apache. var

          cd ..
done

# Update POS
#cd wyndPos
#git fetch
#git checkout -f ${1:-origin/master}
#sudo composer install
#sudo bin/console cache:clear --env=prod --no-warmup
#sudo bin/console cache:clear --env=dev --no-warmup
#sudo chown -R apache. var
#
#cd ..

#cp -r /var/www/jumble/api/app/config/bo/sifodyas/ /var/www/jumble/bo/web/compiled/app/config/
