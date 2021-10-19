Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2543361E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D786EBF6;
	Tue, 19 Oct 2021 12:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 562 seconds by postgrey-1.36 at gabe;
 Tue, 19 Oct 2021 10:48:51 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16A96E145
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 10:48:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211019103927euoutp01dd5ff962a0fd2e4355a201098c18a3db~vaGPiyF4p1728517285euoutp01O;
 Tue, 19 Oct 2021 10:39:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211019103927euoutp01dd5ff962a0fd2e4355a201098c18a3db~vaGPiyF4p1728517285euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1634639968;
 bh=k1kzWdo5mMyAOnBWjwq1xK8wjhau4Rd288/hL7OWpiI=;
 h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
 b=MVVIDbYDYBbchxbIGmT4ZREwmjZ9UBbY2a/dFcOd3OPkqs9zgTXLREoW3zhfRf+0I
 FrrffyDaIYHDa0U/hFDO5Eck6s/SmF3sKRB2K8MCcigAzLZ341GymicUHcD64UucKS
 aUNK3TrxYMSRL3e9B9gz19NZPl2Uw6K1tXkmG5Bk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211019103927eucas1p20e22699505a1f49ab7660a3cf8f7b9d7~vaGPMZNLv2874028740eucas1p2y;
 Tue, 19 Oct 2021 10:39:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 73.20.42068.F50AE616; Tue, 19
 Oct 2021 11:39:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211019103927eucas1p23697a67a1be906965012c06be3542f56~vaGOt87x_1514615146eucas1p2L;
 Tue, 19 Oct 2021 10:39:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211019103927eusmtrp2a70acbbe78e8d1d2bacc86a3a2616716~vaGOtLl-x1875118751eusmtrp2I;
 Tue, 19 Oct 2021 10:39:27 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-26-616ea05fe460
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.8C.20981.E50AE616; Tue, 19
 Oct 2021 11:39:26 +0100 (BST)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211019103926eusmtip2769bf9bc1bc904de5f6b1f18f5af3cde~vaGOcH3Vg0421004210eusmtip2e;
 Tue, 19 Oct 2021 10:39:26 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,  Sylwester Nawrocki
 <s.nawrocki@samsung.com>,  dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update email of Andrzej Hajda
In-Reply-To: <20211018211353.586986-1-andrzej.hajda@intel.com> (Andrzej
 Hajda's message of "Mon, 18 Oct 2021 21:13:53 +0000")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 19 Oct 2021 12:39:10 +0200
Message-ID: <dleftjh7ddpacx.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
 protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7rxC/ISDeb9UbS4v/gzi8WVr+/Z
 LC7vmsNm0bNhK6vF2iN32S0Ov2lndWDzWLznJZPH/e7jTB59W1YxenzeJBfAEsVlk5Kak1mW
 WqRvl8CV8XzFLaaClbIVyx78Zmxg3CDZxcjJISFgIvHy8HeWLkYuDiGBFYwSc0/uZIdwvjBK
 rLw9mxGkSkjgM6PE23MZMB1vJm1igihazigx8+wTVgjnOaPEt9+TgGZxcLAJ6EmsXRsB0iAi
 oC1x8fAlZpAaZoH9jBLnNq9iA6kRFrCX6P9sC1LDKVAv8XD3T2YQW1TAUuLPs4/sIDaLgKrE
 zM+rmUBsXgFzianHDjJC2IISJ2c+YQGxmQVyJWaef8MIMl9C4AmHxIKpq5ghLnWRWLH1JxOE
 LSzx6vgWdghbRuL/zvlMIDdIAC2ePMkMoreHUWLbnB8sEDXWEnfO/WKDsB0lDt/oY4Wo55O4
 8VYQYi+fxKRt05khwrwSHW1CENUqEuv690BNkZLofbWCEcL2kPh8q58NElQTGSVmzD7HMoFR
 YRaSd2YheWcW0FhmAU2J9bv0IcLaEssWvmaGsG0l1q17z7KAkXUVo3hqaXFuemqxUV5quV5x
 Ym5xaV66XnJ+7iZGYBo6/e/4lx2My1991DvEyMTBeIhRBaj50YbVFxilWPLy81KVRHiPtecl
 CvGmJFZWpRblxxeV5qQWH2KU5mBREudN2rImXkggPbEkNTs1tSC1CCbLxMEp1cAUVn7+mqN8
 4PM3Djvmrfpq96dl06X0n/brenMkUyY21EfUnktOZbftveOwMFCcL/9V9tp651Wxu1b6LZq5
 /u7Xg1JvGB4kHJYN1BJWfh58huVlgWTXM/1/S2Tcd4upB+1t3D/93uI1s+4l/NX1PdztJvJu
 S21EhVTfIUNl19D23Z9leF/93GlnvNtKYvfsww2LX6cps6nITmld8LdzhbXpqXVlpisniPX0
 OB97yyItcyeX72qu99Fr1eUzbievTexg4uHa0vKpRuR6D0vYsfX2M+9vtXzoeDhRw7Hkw+34
 6edf7WTeZ3WwzsovOEOm8M0Hzecfn108/Hyp1MuafVJnLhotKtwZ/uXs8soPTPsuK7EUZyQa
 ajEXFScCAPLOKZq+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7pxC/ISDRY1W1ncX/yZxeLK1/ds
 Fpd3zWGz6NmwldVi7ZG77BaH37SzOrB5LN7zksnjfvdxJo++LasYPT5vkgtgidKzKcovLUlV
 yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLeL7iFlPBStmKZQ9+
 MzYwbpDsYuTkkBAwkXgzaRMTiC0ksJRRYtJX+y5GDqC4lMTKuekQJcISf651sXUxcgGVPGWU
 WL6wlRmkhk1AT2Lt2giQGhEBbYmLhy8xg9QwCxxglHh0eyYrSI2wgL1E/2dbkBpOgXqJh7t/
 MkOsspV4vngDC4gtKmAp8efZR3YQm0VAVWLm59Vg5/AKmEtMPXaQEcIWlDg58wlYPbNAtsTX
 1c+ZJzAKzEKSmoUkNQtoM7OApsT6XfoQYW2JZQtfM0PYthLr1r1nWcDIuopRJLW0ODc9t9hI
 rzgxt7g0L10vOT93EyMwgrYd+7llB+PKVx/1DjEycTAeYlQB6ny0YfUFRimWvPy8VCUR3mPt
 eYlCvCmJlVWpRfnxRaU5qcWHGE2BXpjILCWanA+M7bySeEMzA1NDEzNLA1NLM2MlcV6TI2vi
 hQTSE0tSs1NTC1KLYPqYODilGpjKmk5ZBCy6xTNVwffNjAdGgpZGL8Qb1KMl7h7yCfbjrVwq
 UGnUsUhj9ZW7ItenbPJT19/Dbmskb58kMLFmuZt34XaGpu1mr+0W1HBaN3doVRx2ez3txX7F
 DsGn83ybJk7wSmjm952x4tKV7RqeetHsU7TDzU3yu7iWVwtPObpK++8qz1Ln6LIlzI/vmlyR
 7SubtqDKMC47Q/j335v7bRjSrnXyrH+1/uvUHyZMF2Jd/t7TuXJFty7jZ5/j3xtrbghJm5SL
 ah+qLc7WspHnyosoFvm4skTs/9+LtfqVH0TfMi1p+/6V/Wfcj+I/PUkZT2tm75syrbQ4Jefy
 hCc8T36ui4uewpk+L/dV/psdkkosxRmJhlrMRcWJALdNvPQ1AwAA
X-CMS-MailID: 20211019103927eucas1p23697a67a1be906965012c06be3542f56
X-Msg-Generator: CA
X-RootMTR: 20211019103927eucas1p23697a67a1be906965012c06be3542f56
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211019103927eucas1p23697a67a1be906965012c06be3542f56
References: <20211018211353.586986-1-andrzej.hajda@intel.com>
 <CGME20211019103927eucas1p23697a67a1be906965012c06be3542f56@eucas1p2.samsung.com>
X-Mailman-Approved-At: Tue, 19 Oct 2021 12:39:51 +0000
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

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-10-18 pon 21:13>, when Andrzej Hajda wrote:
> Beside updating email, the patch updates maintainers
> of Samsung drivers.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  .mailmap    |  1 +
>  MAINTAINERS | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index 4f6e37da60589..4283a86f70d26 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -40,6 +40,7 @@ Andrew Vasquez <andrew.vasquez@qlogic.com>
>  Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
> +Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
>  Andy Adamson <andros@citi.umich.edu>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54cd05d3aab65..e3fadb4ebced3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2546,7 +2546,7 @@ N:	s3c64xx
>  N:	s5pv210
>=20=20
>  ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	=C5=81ukasz Stelmach <l.stelmach@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -2570,7 +2570,8 @@ S:	Maintained
>  F:	drivers/media/platform/s5p-jpeg/

Acked-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

>=20=20
>  ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -6254,7 +6255,7 @@ F:	Documentation/devicetree/bindings/display/atmel/
>  F:	drivers/gpu/drm/atmel-hlcdc/
>=20=20
>  DRM DRIVERS FOR BRIDGE CHIPS
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  M:	Neil Armstrong <narmstrong@baylibre.com>
>  M:	Robert Foss <robert.foss@linaro.org>
>  R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> @@ -16748,13 +16749,15 @@ F:	Documentation/devicetree/bindings/net/nfc/sa=
msung,s3fwrn5.yaml
>  F:	drivers/nfc/s3fwrn5
>=20=20
>  SAMSUNG S5C73M3 CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5c73m3/*
>=20=20
>  SAMSUNG S5K5BAF CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5k5baf.c

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmFuoE4ACgkQsK4enJil
gBA9aggAnv121xyKAdO0Ue9VjAe6EhTYwBohYZrb116hLKwOs9K3NVQebppwD16j
DjG2mML5PrsxfbjxmWd0gKLEBYTmE4Yow17i0TcjLZaXbaIbZBbNPeN5Nhv2PNwu
WZX1bvamrvOtJwnIWWeU4wysvfgvMASzeRp8opBEj58Vi4woDehY7/X3+MmurI5K
uY+UhR7uXiMykFnfQByxAjk0Y92c22HP3i+TrnhYZ9Vy/sbedk+PaPd3gQFN9k67
3dnKTF47OwvrHAYKBNX8+6bJgMD/EcxIfYCf4lBGmezUsdLb2/64Y5FuEYfLqdob
XI7ThbOwdXF3YqCGMwme29kl00PfgA==
=vbOD
-----END PGP SIGNATURE-----
--=-=-=--
