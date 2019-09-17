Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25238B576D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 23:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAEA6ED7B;
	Tue, 17 Sep 2019 21:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6436EC1E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id E035E27FF58
Date: Tue, 17 Sep 2019 08:18:27 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] drm/panfrost: Simplify devfreq utilisation tracking
Message-ID: <20190917121827.GA2974@kevin>
References: <20190912112804.10104-1-steven.price@arm.com>
 <20190912112804.10104-3-steven.price@arm.com>
 <20190913174343.GB5387@kevin>
 <CAL_JsqJHqvwJrO2jocoMx38z8rMtVrK+PcMRHO13Y7EQaQK+DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJHqvwJrO2jocoMx38z8rMtVrK+PcMRHO13Y7EQaQK+DQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 17 Sep 2019 21:19:59 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: multipart/mixed; boundary="===============0625000719=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0625000719==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Alright; I'm not familiar with patchwork but sounds good.

On Mon, Sep 16, 2019 at 05:36:24PM -0500, Rob Herring wrote:
> On Fri, Sep 13, 2019 at 12:43 PM Alyssa Rosenzweig
> <alyssa.rosenzweig@collabora.com> wrote:
> >
> > Patch 1 is:
> >
> >         Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> >
> > Patch 2 is:
> >
> >         Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>=20
> In the future, please reply to each patch with your tag. The reason
> being is patchwork will automatically add them instead of me doing it
> manually. For a tag on a whole series, replying to patch #0 is fine.
> Patchwork doesn't handle that, but I view that as a patchwork
> limitation.
>=20
> Rob

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl2Azw0ACgkQ/v5QWgr1
WA2KMA/+KVj7jhNMdRi2MPjUXgPHmAfKnSSyNcaAZd+ZBQyR/xgJeOPVFfPUAspT
i9DVkssAxdbeZ+3TSMYPQxDCjUkwiOPVrmm1lRWTYTNsgS1X/X16vbp1IhSWKtw2
TQ+aJtS2aKKw+8XPJxg8vblCSVXm45UsDC4T7Zgq5CUeTmopxRvMxZ5kOgCJlsD3
s5lRYZwZa1KKVlus98ClsQ19GbvdFkLzQiPkXPXBRoiBDsWngB+9uVZeX1n+9F1B
H8N9OEJ7NLfuRa6mC6NHBw+bMeM1ugiFz6vpQIcqHVoyBpXLioXk2hrD3PuoFzh/
wIl0SLe5BfHBFRH1KgmIUmjqhRZs8eNO5opKHJmFxPvPf/0nvJMAcRJWVXgXu0q2
sAvjlUBRdFCvND9ULR8k0ocxIYmmfbVZWON9JHyCjR9gBbiujAVhgP7SEUotkFDJ
cz9AUSwzjkl0LIBaEUX7heC70YjST/T+wNoDuVcy2VnQYaOcXN/wkKiwxolKrA7H
peSTpqNVIfi08eOs0uuHyueoY0uuoXOPzOs9LO89LbAkBUW9p/GQMnGyhStRlnFD
gbo5qEu+bkIzVJ2Ybx/hXDqz40MATbqRq0ddBb+sCra6PUyNe1Ub5T/75Ypbq2Uu
5RgWj5R9e9OI6RQpwKGi+jOEd7OYNZwqi7wN8uiDLW5o+wAHL54=
=qsDL
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

--===============0625000719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0625000719==--
