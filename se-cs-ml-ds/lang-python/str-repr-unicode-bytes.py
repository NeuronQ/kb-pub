class C:
    ## __str__/__unicode__ - the "user" representation (readable!)
    ## -----------------------------------------------
    ## Python 2
    def __str__(self):  # -> bytes
        return "whatever"
        # NOTE: this is NOT called with objects subclassing `unicode`
        
    def __unicode__(self):  # -> unicode
        return u"whatever"
        # NOTE: this is NOT called with objects subclassing `unicode`

    ## Python 3
    def __bytes__(self):  # -> bytes (this is __str__ from Py2)
        return b"whatever"  # same as "whatever" in Py2

    def __str__(self):  # -> str (this is __unicode__ from Py2)
        return "whatever"  # same as u"whatever"

    ## __repr__ - the "developer" representation (unambigous, information rich!)
    ## -----------------------------------------
    def __repr__(self):
        # NOTE: if there is __repr__ defined but not __str__, __repr__ is also used as __str__
        return "<some other useful representation ...>"
        return "MyPoint(x=11, y=42)"
