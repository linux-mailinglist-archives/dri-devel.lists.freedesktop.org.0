Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317632D2B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 11:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F7A891FD;
	Mon,  3 Jun 2019 09:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03094891CB;
 Mon,  3 Jun 2019 09:50:38 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45HVff5rs6z9s4V;
 Mon,  3 Jun 2019 19:50:34 +1000 (AEST)
Date: Mon, 3 Jun 2019 19:50:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: unable to fetch the drm-intel-fixes tree
Message-ID: <20190603195018.2b7d5650@canb.auug.org.au>
In-Reply-To: <20190603073103.GC21222@phenom.ffwll.local>
References: <20190603082051.273a014c@canb.auug.org.au>
 <20190603110403.0412ed22@canb.auug.org.au>
 <20190603073103.GC21222@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559555436;
 bh=vhY0kokUcUkFOU3lj9cjTwC2KAuA/uoQnNufYlcVcnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QoJ+gWlWFzaP3ZpzUUOovUV/R94v2s1tumzbtenF2SSUOfZ37YSq5uUXifWZ3amFi
 VX4QuZOdYtcxN7VsX4YlzZxN0z6kkRJlGKhP+d1Ssb0L4FKCAdyNKdkeU6/nJoiFwg
 WS1//h56etyxwdcQFWSH6fv/VjDcbc407d0+PDUrosozJftVxSs257gDQn0LOo3TCk
 pIRnNtOBGTUxc4uKwWHFGSji3Ip+DCIW/y47Q0EBALPkFp6WTfbDRCnVVsMN7dYxp+
 JBBmyjDapbLsZ6uEUBmmFB06SNPHqArffofQUWyRirPyJmM9zwW6jAuN1rAkhlVZcz
 aiKA617962JQQ==
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
Content-Type: multipart/mixed; boundary="===============0921395593=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0921395593==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//JwQn17N9SqUiY8Nnw9PZsD"; protocol="application/pgp-signature"

--Sig_//JwQn17N9SqUiY8Nnw9PZsD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 3 Jun 2019 09:31:03 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> drm.git too I guess?

No, I fetch that from git://git.freedesktop.org/ which seems to answer.

> But yeah fd.o anongit keeled over over the w/e :-( Admins not yet awake,
> so can't tell you what's up.

No worries, I will just keep using what I have previously fetched.

--=20
Cheers,
Stephen Rothwell

--Sig_//JwQn17N9SqUiY8Nnw9PZsD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz07VoACgkQAVBC80lX
0GzFTgf+IsAiY4vcv67JmXh8J250uxzWfqRZnd+JaMvMMjoe+z170eoKbfTn4f95
jsYo+OaQfET7cvpoeeWO8CcF3IJDIE2Q+Z0/yARzvwvoIInN9ddwZ4U+zUwutBQm
Ij1j14Ct+mGmGWwyWI7u9PVnMZTsgV5hrNOMbB86NEYbWr/GcfgcmLkX/uQTcBfp
jLDZfkBCJ0maM8HeeHH83gEWoDG3/VY4gTcbMoFamcfsLUAoWEW3RVJdrvEN37En
XIx+EsGZ6H35DqingsPw/SJ+T7NAavXgFevVSNE7b/z3aP2bfJTHdeZyAKzwZAXP
1XSnbB8I6J5F4ISJ+Zn7NTHO5yiOQg==
=QKuk
-----END PGP SIGNATURE-----

--Sig_//JwQn17N9SqUiY8Nnw9PZsD--

--===============0921395593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0921395593==--
