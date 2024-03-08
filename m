Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8787613E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 10:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616C10F6A9;
	Fri,  8 Mar 2024 09:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tqpztwXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9164410F6A9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 09:49:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D86661DCB;
 Fri,  8 Mar 2024 09:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942F0C433F1;
 Fri,  8 Mar 2024 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709891359;
 bh=OXkZqNm8O22LmDlaTb9j2E1Uj4UumLy28Y4/roH8aNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqpztwXj/6bOt+9KAwUM2n1qKXN+jzWFq2J1mv83BrwZnrPBuAeW4XL+n+UmHvfFm
 /jfIBbI3tEEFKXfLMIG3xeDidnnHmOEuOT1a5qEKmZXIYIUYGfgZ76MijJ5beZqZcH
 lXqsRV3uEtp+sWOM2qN/LW6cWrVwLYgAF2Y+4zfxnzX/7wcwJU+8VhM5H2lZg31RBh
 GHQx58mxboK169WXlRziIHNw6iJlLwZZJKcotsBxS9Ysc0YgK+YPgV4LCvw7tFJ/ys
 +2arCVJOeV935PSSV3nintcDX4wSIULbD4wCAAItudKyHnOdHmozjTDGOkc6jQvuCR
 FVnNoDmMkJFNw==
Date: Fri, 8 Mar 2024 10:49:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Update drm-misc web page
Message-ID: <20240308-passionate-cerise-coua-48ca1c@houat>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240306153841.698693-1-mripard@kernel.org>
 <20240306153841.698693-2-mripard@kernel.org>
 <87jzmew36t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x33w6jqgm7dkzglu"
Content-Disposition: inline
In-Reply-To: <87jzmew36t.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x33w6jqgm7dkzglu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Thu, Mar 07, 2024 at 04:02:02PM +0200, Jani Nikula wrote:
> On Wed, 06 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > This URL gets redirected to the Intel landing page now. Let's switch the
> > webpage to freedesktop.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d4e33b3a3bc0..cdd3ddd6efb5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7019,11 +7019,11 @@ F:	include/uapi/drm/
> >  DRM DRIVERS AND MISC GPU PATCHES
> >  M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >  M:	Maxime Ripard <mripard@kernel.org>
> >  M:	Thomas Zimmermann <tzimmermann@suse.de>
> >  S:	Maintained
> > -W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> > +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> Maybe also add bug tracker link?
>=20
> B: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues

That's a good idea indeed, but I'm not sure if we would need to set it
up here or under every driver part of the drm-misc tree?

Maxime

--x33w6jqgm7dkzglu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZerfHAAKCRDj7w1vZxhR
xSROAQCd0mvCmBWEJrzJp3+UPTvPkhG85gEM2Cw6BjABXUIHwwD5AQqsDHtjaStG
Rc+1m4VqAcEDgsJiRtqbrhBHtPBtIQg=
=s5Rh
-----END PGP SIGNATURE-----

--x33w6jqgm7dkzglu--
