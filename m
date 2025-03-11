Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F50A5D94A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13410E273;
	Wed, 12 Mar 2025 09:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Tue, 11 Mar 2025 10:21:56 UTC
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F99D10E559
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:21:56 +0000 (UTC)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 3108D5FE1E;
 Tue, 11 Mar 2025 11:16:30 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/sti: remove duplicate object names
Date: Tue, 11 Mar 2025 11:16:29 +0100
Message-ID: <23862499.6Emhk5qWAg@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <ypp4mmw5iezttetboilvvuglklt5sx5eyjccd426en4thfnudt@av2s6chke3hf>
References: <1920148.tdWV9SEqCh@devpool47.emlix.com>
 <ypp4mmw5iezttetboilvvuglklt5sx5eyjccd426en4thfnudt@av2s6chke3hf>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2646682.Lt9SDvczpP";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Wed, 12 Mar 2025 09:22:44 +0000
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

--nextPart2646682.Lt9SDvczpP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/sti: remove duplicate object names
Date: Tue, 11 Mar 2025 11:16:29 +0100
Message-ID: <23862499.6Emhk5qWAg@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

On Donnerstag, 16. Januar 2025 09:33:18 Mitteleurop=C3=A4ische Normalzeit D=
mitry=20
Baryshkov wrote:
> On Wed, Jan 15, 2025 at 09:58:59AM +0100, Rolf Eike Beer wrote:
> > When merging 2 drivers common object files were not deduplicated.
> >=20
> > Fixes: dcec16efd677 ("drm/sti: Build monolithic driver")
> > Cc: stable@kernel.org
> > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > ---
> >=20
> >  drivers/gpu/drm/sti/Makefile | 2 --
> >  1 file changed, 2 deletions(-)
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Ping?

=2D-=20
Rolf Eike Beer

We are nominated for the embedded award Visit us at the embedded=20
world 2025 March 11th to 13th, 2025 | Nuremberg Find us in hall 4 at=20
booth 336

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart2646682.Lt9SDvczpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZ9ANfQAKCRCr5FH7Xu2t
/H51A/9t/e93hF39tJJuBeUiQhFR/VkCzsrs9i37H1F4wR+JkB4x7wHM+56PQBHE
xKLLRZRP6ERLw1m1L9oEeCXYVH0OMjxR7W4b9V4aVjLUq70sluyuwz4XlN8/oFt5
WFQXTdN5QUud+wgU2cTnbc6mc8HLHLiLyyvdWP7L7jepih6p6Q==
=yUcU
-----END PGP SIGNATURE-----

--nextPart2646682.Lt9SDvczpP--



