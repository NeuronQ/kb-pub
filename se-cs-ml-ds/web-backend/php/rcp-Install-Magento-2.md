**NOTE:** CLI Install docs at: http://devdocs.magento.com/guides/v2.0/install-gde/install/cli/install-cli-install.html if you really have the patience to read through that...

* Get .tar.gz archive and put it on server.
* Unzip: `tar -xzvf {...archive filename...} -C .`
* Install (username: public key from Magento account, password: private key from Magento account):
```bash
php -f bin/magento setup:install --admin-firstname=... --admin-lastname=... \
    --admin-email=... --admin-user=... --admin-password='...' \
    --backend-frontname=... \
    --db-host=... --dn-name=... --db-user=... --db-password=... 
```
(edit values later in `app/etc/env.php`)
* Deploy static assets (JS, CSS etc.): `php -f bin/magento setup:static-content:deploy`

* (optional) Sample data: `php -f bin/magento sampledata:deploy`
* (optional, fix) If sample data does not show (see category pages, homepage has no products on it by default anyway), do `php -f bin/magento setup:upgrade`