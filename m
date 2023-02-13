Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4C6950EF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 20:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC4E10E6EE;
	Mon, 13 Feb 2023 19:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B9710E6E7;
 Mon, 13 Feb 2023 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=neTN80ugdoOBvH47UG9wXtgo//bxQecO1FUya+Miv4M=; b=dAkVU79pU/hSypqmsCQJGXHMIb
 kbtVpVR9KH0TfoKkm293Cuo35OknKcT8iFa+Nnth2aRSVCMsRzh0l03yNrs/ZDyVO4M0nda2QpoYt
 ZPn3fOX7Kt99CH3oypyMfyM+PhUDUF3dkNZ5PbhZScE/zWF+4y/FCE2Bup2cfezYczPQcSAoVF3Xq
 gA/xoH7yAJUOqoTLQAPKsx7x69Qf2t5u4esg7EGVhYM/BA3DDxIZs5sP0QbiEALCexIFzL4TkmapA
 +IsBnihIZ/qBdJUM6Ce13UWT0DN9aJz0rtUWIxtst2EtQvM1Y5AiMNavTBeFYKvSst2dvZpDroMZw
 QZ80DSAQ==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pRelq-0011Qt-3k; Mon, 13 Feb 2023 20:45:50 +0100
Date: Mon, 13 Feb 2023 18:45:40 -0100
From: Melissa Wen <mwen@igalia.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230213194540.zo36uq27akdjvljv@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
 <20230213110131.43434089@eldfell> <Y+o0++waAb83mXbU@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f6kqgpdxr4n4ywn2"
Content-Disposition: inline
In-Reply-To: <Y+o0++waAb83mXbU@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, alex.hung@amd.com,
 Pekka Paalanen <ppaalanen@gmail.com>, seanpaul@chromium.org,
 bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com, tzimmermann@suse.de,
 Xinhui.Pan@amd.com, nicholas.kazlauskas@amd.com, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f6kqgpdxr4n4ywn2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/13, Ville Syrj=E4l=E4 wrote:
> On Mon, Feb 13, 2023 at 11:01:31AM +0200, Pekka Paalanen wrote:
> > On Fri, 10 Feb 2023 14:47:50 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >=20
> > > On 2/10/23 04:28, Pekka Paalanen wrote:
> > > > On Thu, 9 Feb 2023 13:27:02 -0100
> > > > Melissa Wen <mwen@igalia.com> wrote:
> > > >  =20
> > > >> On 01/31, Pekka Paalanen wrote: =20
> > > >>> On Mon, 9 Jan 2023 14:38:09 -0100
> > > >>> Melissa Wen <mwen@igalia.com> wrote:
> > > >>>    =20
> > > >>>> On 01/09, Melissa Wen wrote:   =20
> > > >>>>> Hi,
> > > >>>>>
> > > >>>>> After collecting comments in different places, here is a second=
 version
> > > >>>>> of the work on adding DRM CRTC 3D LUT support to the current DR=
M color
> > > >>>>> mgmt interface. In comparison to previous proposals [1][2][3], =
here we
> > > >>>>> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before=
 3D LUT,
> > > >>>>> that means the following DRM CRTC color correction pipeline:
> > > >>>>>
> > > >>>>> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Ga=
mma 1D LUT   =20
> >=20
> > ...
> >=20
> > > >>> +/*
> > > >>> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > > >>> + * @lut_size: number of valid points on every dimension of 3D LU=
T.
> > > >>> + * @lut_stride: number of points on every dimension of 3D LUT.
> > > >>> + * @bit_depth: number of bits of RGB. If color_mode defines entr=
ies with higher
> > > >>> + *             bit_depth the least significant bits will be trun=
cated.
> > > >>> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or =
DRM_FORMAT_XBGR16161616.
> > > >>> + * @flags: flags for hardware-sepcific features
> > > >>> + */
> > > >>> +struct drm_mode_lut3d_mode {
> > > >>> +	__u16 lut_size;
> > > >>> +	__u16 lut_stride[3];
> > > >>> +	__u16 bit_depth;
> > > >>> +	__u32 color_format;
> > > >>> +	__u32 flags;
> > > >>> +};
> >=20
> > ...
> >=20
> > > >>> What is "number of bits of RGB"? Input precision? Output precisio=
n?
> > > >>> Integer or floating point?   =20
> > > >>
> > > >> It's the bit depth of the 3D LUT values, the same for every channe=
ls. In
> > > >> the AMD case, it's supports 10-bit and 12-bit, for example. =20
> > > >=20
> > > > Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> > > > hardware ever?
> > > >  =20
> > >=20
> > > I haven't had a chance to go through all patches yet but if this is
> > > modeled after Alex Hung's work this should be covered by color_format.
> > > The idea is that color_format takes a FOURCC value and defines the
> > > format of the entries in the 3DLUT blob.
> > >=20
> > > The bit_depth describes the actual bit depth that the HW supports.
> > > E.g., color_format could be DRM_FORMAT_XRGB16161616 but HW might only
> > > support 12-bit precision. In that case the least significant bits get
> > > truncated.
> > >=20
> > > One could define the bit_depth per color, but I'm not sure that'll be
> > > necessary.
> >=20
> > Exactly. I just have no idea how sure we should be about that.
> >=20
> > > > What exactly is the truncation the comment refers to?
> > > >=20
> > > > It sounds like if input has higher precision than the LUT elements,
> > > > then "truncation" occurs. I can kind of see that, but I also think =
it
> > > > is a false characterisation. The LUT input precision affects the
> > > > precision of LUT indexing and the precision of interpolation between
> > > > the LUT elements. I would not expect those two precisions to be
> > > > truncated to the LUT element precision (but they could be truncated=
 to
> > > > something else hardware specific). Instead, I do expect the
> > > > interpolation result to be truncated to the LUT output precision, w=
hich
> > > > probably is the same as the LUT element precision, but not necessar=
ily.
> > > >=20
> > > > Maybe the comment about truncation should simply be removed? The re=
sult
> > > > is obvious if we know the LUT input, element, and output precision,=
 and
> > > > what exactly happens with the indexing and interpolation is probably
> > > > good enough to be left hardware-specific if it is difficult to desc=
ribe
> > > > in generic terms across different hardware.
> > > >  =20
> > >=20
> > > Maybe it makes sense to just drop the bit_depth field.
> >=20
> > Well, it's really interesting information for userspace, but maybe it
> > should have a more holistic design. Precision is a factor, when
> > userspace considers whether it can use KMS hardware for a conversion or
> > not. Unfortunately, none of the existing KMS color pipeline elements
> > have any information on precision IIRC, so there is more to be fixed.
> >=20
> > The interesting thing is the minimum guaranteed precision of each
> > element and the connections between them. It might be different for
> > pass-through vs. not. Another interesting thing is the usable value
> > range.
> >=20
> > This is probably a complex problem, so there should be no need to solve
> > it before a 3D LUT interface can land, given old elements already have
> > the issue.
>=20
> Yeah, I think all the precision stuff is all better handled by
> eg. the proposed GAMMA_MODE property or something similar.
> It's going to be needed for 1D LUTs as well. 1D LUTs would
> also need it to expose diffrent LUT sizes with different
> precision tradeoffs.
>=20
> As for the 3D LUT blob, I don't think the blob needs any=20
> strides/etc. either. I had none of that for my i915 version:
> https://github.com/vsyrjala/linux/commits/3dlut
> Just the LUT entries + blob size is sufficient. At least
> for cube shaped LUTs. Dunno if anyone would have a need
> for something else?

I only use lut_size and bit_depth for programming a CRTC 3D LUT in this
proposal, so far GAMMA_MODE also would fit. But don't know for
pre-blending 3D LUT.

>=20
> The two things the are absolutely needed:
> - Position of the LUT in the pipeline. We've already
>   seen at least two variants of this IIRC, so we'll
>   likely need to define a unique property for each tap
>   point.

IIRC, I'd say three, since in rcar-du the 3D LUT is before the gamma
LUT, but there isn't a shaper 1D LUT before 3D LUT.  I'd like to know
how the gamma LUT pre-3D LUT acts on intel pipeline. If it's, in the
end, somehow similar to a shaper LUT.

I mean, if we don't name the LUTs after CTM, we could fit something
similar in terms of dimensions, as:

-> CTM -> 1D LUT -> 3D LUT -> 1D LUT

> - The order the elements are stored in the blob. I didn't
>   check if all the already known hw (amdgpu, i915, rcar-du,
>   were there also others?) would agree on this or not.
>   If yes, maybe just follow the hw order for all those,
>   and if not, then I guess flip a few coins.
>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--f6kqgpdxr4n4ywn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPqk18ACgkQwqF3j0dL
ehypnRAAnXtOeJWGVpsz1WBV0/A+L7Q3gMgFHRcSRHTCHLSKp7dwlS1oSImpxytQ
86A+01yTLXO9bNCxcma4tcD692epVD7w3zNfYk+MoPhGFqoF7o/JkvR7bmAQ207F
XOg4kLxZhY2y7h+84wdLkBmszfoEPvJHLWJ1JZ2cyyipz9I13MunhLb69KGAy9aQ
62eqQDnDzxJ/TOTXzTBfeCys4Y42tipzOryXtftsOICquXgGDsdW8k+wbHUuNwBy
/dW7EedoeKkir30NKpXrzuBlH4CaEUP4ugfHDhONeEDD2U7SI1HZtJyZlyaYq/CY
uj70I8aSlQwwH4w7O2qmANk77zldLff5lOb71KWy+0x//0p2VPuUq2lBFCNWZiiL
26wuYiZ7ikxFMShPFS4+ORH5ScsaNI4KePak0eh+tZ4v/1/h9Y7XWG/HdmrTBmri
Hqm4JePwwMEt2zDrzMwHC1mqH9VRF2eUJ9pDusxUFyFlN3w2OzfPvTWr/dsNJbnk
FZnXvinH/GF9elJBt1xoJ4CmH5p//WRX9rZSaxu6jazWyH9DvUNRRDinFyGqLFN6
X8oZHqaiX40Z0kP2mw4qr942+m8/RNhVYKkW4MmT27gnHVCgI4+3vQBTLW1sbEJX
Vkri6hsIymNICAWpKM3jmmDGZ+f/+QXemw9SjE2O3rIJxRymekE=
=LnZy
-----END PGP SIGNATURE-----

--f6kqgpdxr4n4ywn2--
