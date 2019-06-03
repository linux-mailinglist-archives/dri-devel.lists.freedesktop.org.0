Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9733258
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F348926C;
	Mon,  3 Jun 2019 14:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD9C8926A;
 Mon,  3 Jun 2019 14:41:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Hd65126Gz9s4Y;
 Tue,  4 Jun 2019 00:41:16 +1000 (AEST)
Date: Tue, 4 Jun 2019 00:41:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: unable to fetch the drm-intel-fixes tree
Message-ID: <20190604004115.47bd8b0b@canb.auug.org.au>
In-Reply-To: <20190603195018.2b7d5650@canb.auug.org.au>
References: <20190603082051.273a014c@canb.auug.org.au>
 <20190603110403.0412ed22@canb.auug.org.au>
 <20190603073103.GC21222@phenom.ffwll.local>
 <20190603195018.2b7d5650@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559572879;
 bh=BsUXuWa7XZdMan5Fr/rBomN8mgUXMm2wwUq2B3Ou28s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FUhD80QZIpWWBSfznH3zCDFWzaeAnWIH0wHVmpu/F3XL7BZWkG6pc6kHmSCd5P/+o
 +3iR54uLVbLlQx6F7Zm6RsWmqyYwRVtlvjAPUajyFuaKiktVT9eZheBdsWMuLh/EuH
 T6GH3qGYrKu15TKH0scM96UyXDA44ijbe0+jCsXK8rFPcLO2PvZjnepniqD9nXXh7s
 hizaG6+A/q13y4a8U5T/yUOhQ4mTcDMaehVAzdfmegzLzyr+jWae26uhzhsRdscOn9
 It0nU4836ERGVkch8iWh3rE9jmh4eZY3zSvukKQrS34YCAqGA5PJ4yl4c2EAqW1suG
 8fwBV3mcLZQyw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1654730512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1654730512==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PVNl=NbJTltydIWQshEQ=3x"; protocol="application/pgp-signature"

--Sig_/PVNl=NbJTltydIWQshEQ=3x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 3 Jun 2019 19:50:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 3 Jun 2019 09:31:03 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > drm.git too I guess? =20
>=20
> No, I fetch that from git://git.freedesktop.org/ which seems to answer.
>=20
> > But yeah fd.o anongit keeled over over the w/e :-( Admins not yet awake,
> > so can't tell you what's up. =20
>=20
> No worries, I will just keep using what I have previously fetched.

And they all look good now.

--=20
Cheers,
Stephen Rothwell

--Sig_/PVNl=NbJTltydIWQshEQ=3x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1MYsACgkQAVBC80lX
0GxQ2gf+MsA9Cz1p3W5VUruP+KpaK324qe/ntfUXjDtOCjOgpLIl8DFk79R869Dc
/4uy0ZCYI8PNCWMhZB4bjtcWQuj/biI9dzHuochdCT2g4We0x/+zpRPmaicxDCHa
NRHd56TZ+EUUUfr+7dinpCW42lHv0hRSEpyyi7IDg0eU7iT95CGFU61m/Hf1nuuN
Mhy6MW8poK3KP9fIFrofepMO/39weWwOH62/uMw1I9QiA6LNEsnZxi3fk6aLhr9g
Xco3trX6NOe541/10yyWVDSPmzIu3pGiB3e6YW9W84/R7B8RPeeQUnJOFfn/aNoS
xYMfxQ48+Pnb1XCK1bFMQ9Aoodurzw==
=Y1hp
-----END PGP SIGNATURE-----

--Sig_/PVNl=NbJTltydIWQshEQ=3x--

--===============1654730512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1654730512==--
