Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133B9BC4A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 08:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4706E092;
	Sat, 24 Aug 2019 06:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B256E092
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 06:54:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Fpsr5DDwz9sBF;
 Sat, 24 Aug 2019 16:54:40 +1000 (AEST)
Date: Sat, 24 Aug 2019 16:54:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
Message-ID: <20190824165436.554381be@canb.auug.org.au>
In-Reply-To: <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
References: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
 <20190824135300.23a5fcb4@canb.auug.org.au>
 <CAPM=9tzQ=3BNveNZ_misvZXAUZo+b6uxrQUbHePuaeYnizhHcw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566629682;
 bh=B0nkR7jt73tiwBbqhrmmJgZaJn/+3zHEzu7uMFO+fpI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N49sduS9tEsLXd9FX5mQlI092fd9kl/XTv0gFxzylyDZV+kFaoBW/4bIzp06/sIib
 OuHKB9jU1PIkEIZIwaGQeI7k6PDYmAbc3ogTImsmMFGwQGL0yb24C5fkUV1EBLXovg
 B2WjFoOWmGkNj18LFUzO22KEPIyl/rweEeZrlNEk/S2AeGjK/hqg5m6RgMF60e7vNf
 4LGYbRckTD5oEerhc5At37Q90Cv5RV5x4sCq4ukwP25avxAOYM72rCM3AboCw84ZpP
 ZF4cUq9EcfForVAuGx4XGFQDVFWM9VramPShUG2sSqqgEVl3so7lv/KaLbm0wGakIo
 TFLIxNyA0FUEA==
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
Cc: Dave Airlie <airlied@linux.ie>, linux-next <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>
Content-Type: multipart/mixed; boundary="===============1393935498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1393935498==
Content-Type: multipart/signed; boundary="Sig_/zr=8s6spYG95L+dKakOX=sL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zr=8s6spYG95L+dKakOX=sL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sat, 24 Aug 2019 15:06:07 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> I'll add the include anyways and send to Linus,

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/zr=8s6spYG95L+dKakOX=sL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1g3ywACgkQAVBC80lX
0GzzzQf9HKU8hqwhQiI78sSXtrotBHrLx+ltFLoCQ064IZ1mNdA9dvzm631A9Xsu
JpKoIGnYzkKCbmpGT3R3K2FOZ0zkTtaZQ5St/GPjwJzJ0MUP9RNWIY3odFxZhD2G
96/BI2tY5CqX9vL35bi8pm/a8aF/1VRGYj3Yu6c5SCqCIOq6+HsqxlG4z9S1sBmE
66qz+Cstfk9uzuLqjoXosJsp+cO3Bwxt4hoKgPWggxX4vsFsy+viNvfQeNDMZhrT
LplyeZ4rJHAvEc3OvEELpMDJEHXNcI9+pcGlP6qe7eauyaqKtrMMOqhOD6EN6mFR
gjKZhDtSKmtzAdc1Xk+ttXy6C6gO2g==
=yJEH
-----END PGP SIGNATURE-----

--Sig_/zr=8s6spYG95L+dKakOX=sL--

--===============1393935498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1393935498==--
