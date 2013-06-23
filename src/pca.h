/*
*				pca.h
*
* Include file for pca.c.
*
*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*
*	This file part of:	PSFEx
*
*	Copyright:		(C) 2007-2010 Emmanuel Bertin -- IAP/CNRS/UPMC
*
*	License:		GNU General Public License
*
*	PSFEx is free software: you can redistribute it and/or modify
*	it under the terms of the GNU General Public License as published by
*	the Free Software Foundation, either version 3 of the License, or
* 	(at your option) any later version.
*	PSFEx is distributed in the hope that it will be useful,
*	but WITHOUT ANY WARRANTY; without even the implied warranty of
*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*	GNU General Public License for more details.
*	You should have received a copy of the GNU General Public License
*	along with PSFEx.  If not, see <http://www.gnu.org/licenses/>.
*
*	Last modified:		10/10/2010
*
*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

#ifndef _PCA_H_
#define	_PCA_H_

#ifndef _PSF_H_
#include "psf.h"
#endif

/*----------------------------- Internal constants --------------------------*/

#define		PCA_NSNAP	5	/* Number of points per PSFVar dim. */
#define		PCA_NITER	200	/* Max nb of iter. in pc_find() */
#define		PCA_CONVEPS	1e-6	/* pc_find() converg. criterion */

/*--------------------------- structure definitions -------------------------*/
/*---------------------------------- protos --------------------------------*/
extern double	*pca_oncomps(psfstruct **psfs, int next, int ncat, int npc),
		pca_findpc(double *covmat, float *vec, int nmat);

extern float	*pca_onsnaps(psfstruct **psfs, int ncat, int npc);

#endif
