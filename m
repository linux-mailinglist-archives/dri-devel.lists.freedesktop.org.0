Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D12E916D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB989B97;
	Mon,  4 Jan 2021 08:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2D689B97;
 Mon,  4 Jan 2021 08:06:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DEEAB7BC;
 Mon,  4 Jan 2021 08:05:58 +0000 (UTC)
Subject: Re: [PULL] drm-misc-next-fixes
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <X+JFYlW1SEZa6ShA@linux-uq9g>
Message-ID: <9677ee19-a083-7993-10d8-8ac437372c26@suse.de>
Date: Mon, 4 Jan 2021 09:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X+JFYlW1SEZa6ShA@linux-uq9g>
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1482339250=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1482339250==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CikGlNbcrUV0JEEAfU6Ps291agInWmKFX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CikGlNbcrUV0JEEAfU6Ps291agInWmKFX
Content-Type: multipart/mixed; boundary="M05GCwQLsNs4HvlqDvODgLBRSWNdkn6zh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Message-ID: <9677ee19-a083-7993-10d8-8ac437372c26@suse.de>
Subject: Re: [PULL] drm-misc-next-fixes
References: <X+JFYlW1SEZa6ShA@linux-uq9g>
In-Reply-To: <X+JFYlW1SEZa6ShA@linux-uq9g>

--M05GCwQLsNs4HvlqDvODgLBRSWNdkn6zh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

it looks like this PR has not been merged yet.

Best regard
Thomas

Am 22.12.20 um 20:13 schrieb Thomas Zimmermann:
> Hi Dave and Daniel,
>=20
> here's this week's PR for drm-misc-next-fixes.
>=20
> Best regards
> Thomas
>=20
> drm-misc-next-fixes-2020-12-22:
> Short summary of fixes pull:
>=20
>   * dma-buf: Include <linux/vmalloc.h> for building on MIPS
>   * komeda: Fix order of operation in commit tail; Fix NULL-pointer and=

>             out-of-bounds access; Cleanups
>   * ttm: Fix an unused-function warning
> The following changes since commit ee46d16d2e40bebc2aa790fd7b6a056466ff=
895c:
>=20
>    drm: mxsfb: Silence -EPROBE_DEFER while waiting for bridge (2020-12-=
15 11:01:10 +0100)
>=20
> are available in the Git repository at:
>=20
>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-=
2020-12-22
>=20
> for you to fetch changes up to be3e477effba636ad25dcd244db264c6cd5c1f36=
:
>=20
>    drm/komeda: Fix bit check to import to value of proper type (2020-12=
-18 16:36:00 +0000)
>=20
> ----------------------------------------------------------------
> Short summary of fixes pull:
>=20
>   * dma-buf: Include <linux/vmalloc.h> for building on MIPS
>   * komeda: Fix order of operation in commit tail; Fix NULL-pointer and=

>             out-of-bounds access; Cleanups
>   * ttm: Fix an unused-function warning
>=20
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>        drm/ttm: fix unused function warning
>=20
> Carsten Haitzler (3):
>        drm/komeda: Remove useless variable assignment
>        drm/komeda: Handle NULL pointer access code path in error case
>        drm/komeda: Fix bit check to import to value of proper type
>=20
> Christian K=C3=B6nig (1):
>        drm/qxl: don't allocate a dma_address array
>=20
> James Qian Wang (1):
>        drm/komeda: Correct the sequence of hw_done() and flip_done()
>=20
> John Stultz (1):
>        dma-buf: cma_heap: Include linux/vmalloc.h to fix build failures=
 on MIPS
>=20
>   drivers/dma-buf/heaps/cma_heap.c                   |  1 +
>   drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |  1 -
>   drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  4 +--
>   .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |  3 ++-
>   .../drm/arm/display/komeda/komeda_pipeline_state.c |  4 +--
>   drivers/gpu/drm/qxl/qxl_ttm.c                      |  2 +-
>   drivers/gpu/drm/ttm/ttm_pool.c                     | 29 +++++++++++--=
---------
>   7 files changed, 22 insertions(+), 22 deletions(-)
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--M05GCwQLsNs4HvlqDvODgLBRSWNdkn6zh--

--CikGlNbcrUV0JEEAfU6Ps291agInWmKFX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/yzF8FAwAAAAAACgkQlh/E3EQov+Dk
bQ/+PAuyb0HGlrHk9QovoG5Ww81uE8HmrCZsUMGy3vMCbKyrYtbQ6f90iYMgGO811dx/XC9FRMaB
qxiuBZL4I3NCjDT07uJm1BRo9goiLwWfYrryqRmsTVZrwTQ4X50+Z89mrSUj1yUmokpTuCI/71KZ
B+CK+vgSxHdSP8CGxijzaruc0AZ5i8s+bjUi2+piE51RAZLQM1K6GMNzybJ/VCEGeK/6/OBz1hnV
Oz3rXSwW1QUF/3mHFQ05KRxQrWD6jYKxbUOPFojgKUdIIYUH13AQDwtuvHEDsxik9qtztlYbyDIz
Ax8LC6QSH/BnxDeX+M+L5kMXDfkTzWpLZ6D+wy9BwoNEG7/OgyMi2aDGoW0nz5TPx2X+jLf/It3R
QGjLxKrhgP20Mc42uO8Pc7EthQT1pszb9b7tOQXmyukDfiqDNkCOwVmfVeSUSPCJl9GHzgs3NWJ7
uILo7dRVClrvYvmZSYQjjDjQA0n45oBC4ndHPkHvDzbE6BOvkeYAKShki3ob0NHcxDH0+ClxRPda
2EvjzxCV6js1bKK9U1acYM+u+7wgwWMbVWkZSGVboKUZY7yZxFpzsWom8zFLvgqABgamdeLrJgKo
hzahC4XzoSXqFv5KS6i4bd1gWVaZYJbJtDxwt8fc+GHP4gKvasvRzM8sFmF+OpL6fRJQrtLpZ2ew
LDk=
=xvb0
-----END PGP SIGNATURE-----

--CikGlNbcrUV0JEEAfU6Ps291agInWmKFX--

--===============1482339250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1482339250==--
