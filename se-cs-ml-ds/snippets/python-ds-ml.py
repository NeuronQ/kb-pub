def display_all(df, max=1000):
    with pd.option_context("display.max_rows", max, "display.max_columns", max):
        display(df)


def convert_cats(df, include={}, skip={}):
    """Convert string values + what we know is category, to categorical vars"""
    for n, c in df.items():
        if n in skip:
            continue
        if pd.api.types.is_string_dtype(c) or n in include:
            df[n] = c.astype('category').cat.as_ordered()


def fix_missing(df):
    for n, c in df.items():
        if pd.api.types.is_numeric_dtype(c):
            if pd.isnull(c).sum():
                df[n] = c.fillna(c.median())
                df[n + '_na'] = pd.isnull(c)

# comment
def cats_map(df, skip={}):
    out = []
    for n, c in df.items():
        if n in skip:
            continue
        if df.dtypes[n].name == 'category':
            out.append(pd.DataFrame({n: c.cat.categories}))
    return pd.concat(out, axis=1)


def numericalize(df):
    """Numericalize categories and get rid of -1's for NaNs"""
    for n, c in df.items():
        if not pd.api.types.is_numeric_dtype(c):
            df[n] = df[n].cat.codes + 1  # +1: NaNs -1 -> 0
