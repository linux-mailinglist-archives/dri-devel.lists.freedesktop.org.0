Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FE30CC98
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 21:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A618D89B27;
	Tue,  2 Feb 2021 20:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D589AE6;
 Tue,  2 Feb 2021 20:02:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbMS3dt9z9sWR;
 Wed,  3 Feb 2021 07:02:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612296165;
 bh=K4yTIb2JP5VClEiIv/GsnIq/Q4ux0b0nxbjJvKijwgM=;
 h=Date:From:To:Cc:Subject:From;
 b=KbcSwYtClAJH3BPTuUNWdWH49wNqiJmcTbJuNcdpC+94lr1DQ9A5VxoI3z6iFwYWf
 weygt7PvFJ1FjYfChNEoQG7TzNI7u2JdzyjvQr/6S9hniPMdSgS5BvOYJy2bFX+CDW
 jVQ1lGNVF/cFsofTBIHDamV7FFHpZ1j7tzR5ZA6kv80/7WgT7OCRQz6+YfqBLe/8bx
 3MCYM2WOj9HgGlRltN88aq6Yklnluc++u7E72bf84XObDEwT29UnEXCVEvIzqfsDQW
 WcQGJSyvzqlJAGP2bh9T7DALkDm2Obo0seUhD3YR7KdCc89QgoK977yStEBKAuPlkO
 u92ElUy0hv6vQ==
Date: Wed, 3 Feb 2021 07:02:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel-fixes
 tree
Message-ID: <20210203070241.657dfd46@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2031272830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2031272830==
Content-Type: multipart/signed; boundary="Sig_/dArlrtFwRPtiBZ=NqSg7Roh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  44c5bd08518c ("*** HAX FOR CI *** Revert "rtc: mc146818: Detect and handl=
e broken RTCs"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZr+EACgkQAVBC80lX
0GyROwf/WvQJxPhgsUrnWh1cFx4/eizUDI7wkS/oMzGOnztgiJ0y6T8b7fgLU343
d4codFL8gKFM9zleir6oamILyZZw9fQTAy5OdKE3f4ka3PqgtESb+vIDhZrOxqLM
5Uj6NVUzjU93qaUTjqqfDnr3AHLcoZj6+9Bry+1A7b5OWbj8NzIcr3e+yU0eu83W
62jxdTvboJowMZFpE9ZAV+5vEQ8UdaC2qtvWWQE4qAddOhy+HOXp0ao7sjlIVrre
cxwxXW1AQsh3TOakeTplIN3PWSld2Xg9yhfE54iB/VH8CcN1o/V+iHVjfJLdGZ+T
gFebxDdRTW0JrQ9K7B8lV08eCoMrjw==
=Vgcj
-----END PGP SIGNATURE-----

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh--

--===============2031272830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2031272830==--
