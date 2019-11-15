Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7FFE890
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 00:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAA06EB50;
	Fri, 15 Nov 2019 23:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7716EB50
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 23:21:18 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47FDqt6wtYz9sPF;
 Sat, 16 Nov 2019 10:21:14 +1100 (AEDT)
Date: Sat, 16 Nov 2019 10:21:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commit in the drm tree
Message-ID: <20191116102113.649ba462@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573860076;
 bh=ZkAxY0i7tYEwLhuyfD/vlJjX37mGy/T4xfjDRbRWyfA=;
 h=Date:From:To:Cc:Subject:From;
 b=ROxUo7AbfzwcQR9q4sZDDoo2jp8E8FNqfo38NDzuwWuJ918MoYe9zH87RUbf045yE
 WPj5HqydDbb31nlg1tAFCg2LCGVNVJ+Cq3o33E6PENyc8tEzxIm/OPD4sikv6tdASW
 Gfv6XgF2xJ6nIbnw8SQqEmIDo/JgUNDcChtbiIUxsatojUcJNn+J87B/xNHnoeAFKL
 dscl75Glt9Bs5866LERGvmpMKvSNMh07+bc759eJSMuXMRIU3swZNV+vPVtJLVz2JX
 1aYVCLveok+FjhnlWGlN9wWksrThZJNtU/1r6N9qlp4syKYi5FqynPV7TxJPuonNTA
 mC8276u1ybWpw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1355008762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1355008762==
Content-Type: multipart/signed; boundary="Sig_/Qg0m8ljvQ5sgTdqX+66aLqC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Qg0m8ljvQ5sgTdqX+66aLqC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b4011644b03c ("drm/vmwgfx: remove set but not used variable 'srf'")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Qg0m8ljvQ5sgTdqX+66aLqC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3PMukACgkQAVBC80lX
0GyxBAf+JTVRHzDkKWzpb51GjiIEajYJ0phjbsYp+qlmC5EnLupUNF3/4ssRCUNI
5wkNoC7z41tCuogkrn7k2b8oRPo9hIpCveKlEU5KoVxYYcRkOa451FNFYTHVdhhj
QzvlRb4Cn09hc8c77gJbOpOg8Qx7SuIMPOoc7igVNQ0ljoKb/amC7+Xu56hrCoIz
RaXubIRH+AufJD2zXOEhNJ0Mj5qjwz7YN1wVKPyZUb9icAIOjdzddzIOtiv8QGZt
HkVxBN4E3G0L4D4dVcAPu+Q9EQshSRWUATWg0Zftz29Hi63g0KU6UmARGrhyTeOF
NNTs1+UgdKQ3ACqFQAZadwJa0ZT63w==
=AWwR
-----END PGP SIGNATURE-----

--Sig_/Qg0m8ljvQ5sgTdqX+66aLqC--

--===============1355008762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1355008762==--
