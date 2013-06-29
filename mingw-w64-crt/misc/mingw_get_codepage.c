unsigned int ___lc_codepage_func(); // MSVCRT 2010+

unsigned int __mingw_get_codepage()
{
    return ___lc_codepage_func();
}
