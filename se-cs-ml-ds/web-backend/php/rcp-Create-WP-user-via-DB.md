```sql
INSERT INTO `DATABASE`.`wp_users` (`ID`, `user_login`, `user_pass`, 
`user_nicename`, `user_email`, `user_url`, `user_registered`,
`user_activation_key`, `user_status`, `display_name`) VALUES ('9999', 
'username', MD5('password'), 'nickname', 'email@example.com', '', 
'2014-11-04 00:00:00', '', '0', 'username');
```

```sql
INSERT INTO `DATABASE`.`wp_usermeta` (`umeta_id`, `user_id`, `meta_key`,
`meta_value`) VALUES (NULL, '9999', 'wp_capabilities', 
'a:1:{s:13:"administrator";s:1:"1";}'), (NULL, '9999', 'wp_user_level', '10');
```