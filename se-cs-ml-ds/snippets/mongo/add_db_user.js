use admin;
db.createUser({
    user: "zopyo_prod",
    pwd: "5ecurepwd123@zopyo_prod",
    roles: [{ role: "dbOwner", db: "zopyo_prod" },
    ]
});