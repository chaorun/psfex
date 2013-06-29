%define psfexLib_DOCSTRING
"
Python interface to psfex classes
"
%enddef

%feature("autodoc", "1");
%module(package="astromatic.psfex", docstring=psfexLib_DOCSTRING) psfexLib

%include "lsst/p_lsstSwig.i"

%lsst_exceptions()

%{
#define PY_ARRAY_UNIQUE_SYMBOL ASTROMATIC_SEXPY_NUMPY_ARRAY_API
#include "numpy/arrayobject.h"
#include "ndarray/swig.h"

#include "lsst/daf/base.h"
#include "lsst/afw/image/Wcs.h"
#include "lsst/afw/image/TanWcs.h"

#include "Field.hh"
#include "prefs.hh"
#include "psf.hh"
#include "vignet.h"
static double PSFEX_SAVE_BIG = BIG;	// we'll #undef BIG and define a variable called BIG
static double PSFEX_SAVE_INTERPFAC = INTERPFAC;
%}

%init %{
    import_array();
%}

%include "ndarray.i"

%shared_ptr(astromatic::psfex::Field);
%shared_ptr(astromatic::psfex::Set);

%import "lsst/daf/base/baseLib.i"
%import "lsst/afw/image/Wcs.i"

%template(vectorF) std::vector<float>;
%template(vectorI) std::vector<int>;
%template(vectorStr) std::vector<std::string>;

%declareNumPyConverters(ndarray::Array<float,2,2>);

%exception astromatic::psfex::Context::getPc {
   try { $action } catch (const std::out_of_range& e) { SWIG_exception(SWIG_IndexError, e.what()); }
}
%exception astromatic::psfex::Set::getSample {
   try { $action } catch (const std::out_of_range& e) { SWIG_exception(SWIG_IndexError, e.what()); }
}
%exception astromatic::psfex::Psf::build {
   try { $action } catch (const std::out_of_range & e) { SWIG_exception(SWIG_IndexError, e.what()); }
}

%include "Field.hh"
%include "prefs.hh"
%include "psf.hh"

%template(vectorField) std::vector<boost::shared_ptr<astromatic::psfex::Field> >;
%template(vectorPsf) std::vector<astromatic::psfex::Psf>;
%template(vectorSet) std::vector<boost::shared_ptr<astromatic::psfex::Set> >;

%inline %{
   #undef BIG
   #undef INTERPFAC
   double BIG = PSFEX_SAVE_BIG;
   double INTERPFAC = PSFEX_SAVE_INTERPFAC;
%}
