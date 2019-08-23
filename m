Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315839ABE2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB436EC50;
	Fri, 23 Aug 2019 09:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F68E6EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:51:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46FGrZ5WXvz9sBp;
 Fri, 23 Aug 2019 19:51:42 +1000 (AEST)
Date: Fri, 23 Aug 2019 19:51:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commit in the drm tree
Message-ID: <20190823195140.3bc7821c@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566553903;
 bh=QLzdlGUP2qHEZlzxsdrO1oxIaTROUs3zT3IbbobvE7g=;
 h=Date:From:To:Cc:Subject:From;
 b=OIQ0AQe8iVVw+fLNrQ3/q3fEyUTbhCJOv+E7jYQc56hj8wHO9ciUq6b3puZ+SsVWg
 U3ypD9L3ICPtB+2DIDezTalchGkvMfdIwnNlj3yqOnjaNR7ZoV8e0hAKf5sQK8EMBs
 F9iaUP2FALOTinEVzVIUvpOairD4gj5T6+zMGKsZ1HEXFrSNeEjvmD8SQxT8ccAW+q
 b+ZoVCAbHWv0gwYVJmN8vYQcIgnRCFwQVHIq9CfgG9nX/hwbTQoNjaKcHY8rxekZdU
 LLMJWX6q3AECF4OYK5YD2/mQK43bTkuN0t5nrexc/7PXSbIf5GSNCju8gplHR/DU4i
 pEDwzdqnBm+2Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1983189793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1983189793==
Content-Type: multipart/signed; boundary="Sig_/eDkqsrvY0P4s280mUgHpOaC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eDkqsrvY0P4s280mUgHpOaC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  88b703527ba7 ("drm/nouveau/kms/gf119-: add ctm property support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/eDkqsrvY0P4s280mUgHpOaC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ftywACgkQAVBC80lX
0Gy+gwgAm56anyFuDl42rt7iwMXlmwMaWLDH7JyiYBHCx4Wl6oD/R98T0D1eT4dX
KgRF54RSZcmpneQDgwqGv/zSKC3xl4vF6+/gzguw5M5KQZiHriYoNp2PV9/o+kWm
5/5sz/REq3DHb4uk07BZ+iUbRFPoifRpim5d2KOmV2IwNMfiNln64weFUgNH3E3A
ODZWQ68HuOsV1JdkMUzutP+VrMKIJsHT/6Bb7Q74SlVzZ9D27QbKnkYA0bPzdNUX
EIyARO8EbMx72nCPP+Nze2UVa/LZG7DWNHWyPL0kw+w1mE3zBLmDT1g9qlgfIf2p
Csxt1kTjoHzphZkicet6jxRZzycyZw==
=EDY5
-----END PGP SIGNATURE-----

--Sig_/eDkqsrvY0P4s280mUgHpOaC--

--===============1983189793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1983189793==--
