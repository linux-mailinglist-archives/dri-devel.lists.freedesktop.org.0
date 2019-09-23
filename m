Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3CFBC24B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13AE6EA01;
	Tue, 24 Sep 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417C16E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 18:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id CDB41521C1B;
 Mon, 23 Sep 2019 20:59:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 6fOIjpuRXjK3; Mon, 23 Sep 2019 20:59:18 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 6C483521C76;
 Mon, 23 Sep 2019 20:59:18 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net
 [86.58.59.25]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id BCAAE5216AE;
 Mon, 23 Sep 2019 20:59:16 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add Jernej =?UTF-8?B?xaBrcmFiZWM=?= as a
 reviewer for DE2
Date: Mon, 23 Sep 2019 20:59:05 +0200
Message-ID: <25330700.GM8WoWRORn@jernej-laptop>
In-Reply-To: <20190923153253.7bxik4olfuteifrf@gilmour>
References: <20190919173020.11655-1-mripard@kernel.org>
 <1884305.6y54b83Agi@jernej-laptop> <20190923153253.7bxik4olfuteifrf@gilmour>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1835795740=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1835795740==
Content-Type: multipart/signed; boundary="nextPart8786816.DsjuD0iXM1"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart8786816.DsjuD0iXM1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 23. september 2019 ob 17:32:53 CEST je Maxime Ripard=20
napisal(a):
> On Fri, Sep 20, 2019 at 10:12:30PM +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 20. september 2019 ob 08:08:20 CEST je Maxime Ripard=20
napisal(a):
> > > Hi
> > >=20
> > > On Thu, Sep 19, 2019 at 09:39:19PM +0200, Daniel Vetter wrote:
> > > > On Thu, Sep 19, 2019 at 7:30 PM Maxime Ripard <mripard@kernel.org>=
=20
wrote:
> > > > > The newer Allwinner SoCs have a different layers controller than =
the
> > > > > older
> > > > > ones. Jernej wrote that support and has been reviewing patches fo=
r a
> > > > > while
> > > > > now, so let's make him a formal reviewer.
> > > > >=20
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > >=20
> > > > Haz commit rights already, or do we need to fix that?
> > >=20
> > > He doesn't, as far as I'm remember.
> >=20
> > No, I don't.
> >=20
> > > Jernej, do you want to have drm-misc committers rights as well?
> >=20
> > I would be nice, yes. Thanks!
>=20
> You have everything needed (hopefully) there:
> https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> Once you have requested the account, please let us know so that we can
> ack it and move forward in the process.

Here it is: https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/1=
92

Thanks!

Best regards,
Jernej
--nextPart8786816.DsjuD0iXM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEsR7F6zFhQ4tDs/Lff1dxEBTFtbMFAl2JFfkACgkQf1dxEBTF
tbPyPQ//bmvkIo+4jpvGC3ChYT4/0XjsYrHoBEDxhLdfFSycNjLveupl0gGLRRHs
V8PQOIYYH6xpd3mpSpw/8WKvaCETP0u7pT9PmyVcOKjtipg1tzptiuSAlHs4B9Hm
N3dhS4zd/115ZMCVidnYUnr2Lz+/EIxNexrwtUO7qBw25+MtBmwcZ5DhqPgMPSFa
KSK28IN6GvXf++bwuIPM+l0r5aBQbGRpYCh3AFVY95K3uTnnNEz9UjpvulZX5ldV
2U7aJbWKIBGYlEOp7+u1Tvxn+B/oec5hyaUfr3rS6rFOs4WqsNHtlglZc+fkWMin
asZdOf39Y5kqxK5LTG3m1yB9U5736UCduD2bZwu6/zztzEZ6zl70r5JuGW/nU4z9
Yggxu8VU9l5PSkKGD/BFjPBK+fRBhFWT17shZAI0wjr8PCKcM83pQH4g68BungAy
3lojfTuMAX08bpo0BSdX+N/EjdG44R/DyBBQiMBwFZGeZiWf2K4uztoY+TvMJGVY
ODfyWUgRXwOBjrmyL0XfJoN0fMVaCYsr25z0qJSa6d+MelNrrMLfwB/NqFPH74wt
HzpSSqL6nX6GZE0YmGgOJVqoFVnBWHSZieFIkIAsFha4T9ORVbpNHm1vcd72xgVW
1GjLEYChHii5a0IoUFqMmU6YE73aCuXn34YXDZGyEqAS8w2Ygp4=
=3CeA
-----END PGP SIGNATURE-----

--nextPart8786816.DsjuD0iXM1--




--===============1835795740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1835795740==--



