Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7409F5154A0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C509510E1B7;
	Fri, 29 Apr 2022 19:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C839110E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMcEXWMI4V5zzw5zpNUuVNbiFnTtkgVO0RuvTIP3Q5k=; b=pZtpANcNcUC8Oz125SjMna34lb
 qou0ToQF5QdHgG0khAFLBy/Gt4KtI1tHxMhMUgYKILwQMbGibeljoaokeWxpuvGDpYVk1T+LHwyQ8
 CojRzZz2aZ6TeMpS45u5gjWcUQSD0WzwLItBzj8uYnjRWh+KKtVN8UaagdFWCsW4qJATWJFEymyvk
 3cmwcLNTDChaevyeY+KahAzuRamifYAl0iyRRTd8xgpl+uMwWq3TlZc2b2vQAetzH61wW0V+C9pxm
 pJy7KummtBKtqZLEUOlsbS/oHPEePh/l+562h4NnTQa6NLaXd4Ig730ZDWq2Wz+CUqsaVotaaZWdO
 8tsLBlMQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nkWN5-000ADj-9D; Fri, 29 Apr 2022 21:33:43 +0200
Date: Fri, 29 Apr 2022 18:33:30 -0100
From: Melissa Wen <mwen@igalia.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] MAINTAINERS: add Melissa to V3D maintainers
Message-ID: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="74k6tnj42pli3zd2"
Content-Disposition: inline
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
Cc: jmcasanova@igalia.com, itoral@igalia.com, jasuarez@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--74k6tnj42pli3zd2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've been contributing to v3d through improvements, reviews, testing,
debugging, etc. So, I'm adding myself as a co-maintainer of the V3D
driver.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2b0dc44506..0a854b7f2491 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6714,6 +6714,7 @@ F:	drivers/gpu/drm/omapdrm/
=20
 DRM DRIVERS FOR V3D
 M:	Emma Anholt <emma@anholt.net>
+M:	Melissa Wen <mwen@igalia.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
--=20
2.35.1


--74k6tnj42pli3zd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJsPYoACgkQwqF3j0dL
ehz2vw/+MwQQabwTxPoJK7ntBXHQSaCDOOT/qFUMPk/gqR6PVTG6rzE3zZGdM3m4
5/bBlwkNnm/I48CKqe9rd7BSHjZAJ76KATnuhIk3AmNmXdpa+iPxxM1K2bgl0xSm
YNEvhfdbC6KDuZ09BhBDv157aJtoAvtf5hY3tRjgXYjqMUIiSR9jaTk5LMBRlu0L
hg8Q5HF7cis2z1OANtWu+I9MIXiYCL7rTy7wLP1jyZXhilGPyG1IGOu36idPtWGd
fzalxLbqndNKaTJ8akzRZDfU6hMKwW+nPXyEa/MfCPI+NDegQSvLnGrxXlJqXMYv
23APRUoJJ5kKmAYQTP8NlK6iHFmnVmqGyBQn2qz4jdvtErwCVd1UVQwci+NNBRpd
oueA5IDpdh+ujj2B/kZ0xvtjCDaFwjLh+QKLN8tuFmIYrSGCDuH3FKkXfjO/JCSD
cSIuLgiklijq+ksKIE3yR2ZxBp8+OAa8Joq3JKEQ0lSee7Beisy0wxZMppTuPXwl
pBbzy18++4GE+8pSURTbLVnHIuw3oOO6zh3WqJovgtdg5Rw9hPr2LoyJngmfXFHf
nRX/WmjP8AMA4v19hLY62pM5FCR7uRd9XvvZZNiRLC4IIikzstd6QXaAOPELk9oo
pcaPej6F5GJ7+ONo+ENjRkgQdqTgItVq58eAR6bhgggWz3DV730=
=aAVN
-----END PGP SIGNATURE-----

--74k6tnj42pli3zd2--
