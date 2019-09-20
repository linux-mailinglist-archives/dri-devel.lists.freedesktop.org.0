Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF226B8AC0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63E06E9DA;
	Fri, 20 Sep 2019 06:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F8B6E9DA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:08:24 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 875E220644;
 Fri, 20 Sep 2019 06:08:23 +0000 (UTC)
Date: Fri, 20 Sep 2019 08:08:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add Jernej =?utf-8?Q?=C5=A0krabe?=
 =?utf-8?Q?c?= as a reviewer for DE2
Message-ID: <20190920060820.w5yykoxleiao3yoz@gilmour>
References: <20190919173020.11655-1-mripard@kernel.org>
 <20190919173020.11655-2-mripard@kernel.org>
 <CAKMK7uERdXAKj69isbFi6=tak2U2v1EAmCHO_pCtd_5OQ72d_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uERdXAKj69isbFi6=tak2U2v1EAmCHO_pCtd_5OQ72d_w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568959704;
 bh=Teht/18F9fSmWkTQKFrtK4XT8eVHnBCrH3czIqCEp5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/ZC2b2DgPr4byQ2YQPZhU2pyWOiF6dZx9uvkefMVRqAqporhyteIM0c8FiG4ylto
 kNtAn6m2vgQJFB473olQp4szJDlWVtazFw6mmkDZlieqrrJhupq6HXGHlDPhfnReB3
 3b6jMkRBqm7uewmxRo94am7/R/ZHMgdHFMzlhpCs=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1020719863=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1020719863==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bwgaubazcukoldzr"
Content-Disposition: inline


--bwgaubazcukoldzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Thu, Sep 19, 2019 at 09:39:19PM +0200, Daniel Vetter wrote:
> On Thu, Sep 19, 2019 at 7:30 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > The newer Allwinner SoCs have a different layers controller than the older
> > ones. Jernej wrote that support and has been reviewing patches for a while
> > now, so let's make him a formal reviewer.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> Haz commit rights already, or do we need to fix that?

He doesn't, as far as I'm remember.

Jernej, do you want to have drm-misc committers rights as well?

Maxime

--bwgaubazcukoldzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYRs1AAKCRDj7w1vZxhR
xfYVAQCyMykWE36gePeBnei/0ogH5MAt48+XPSnm8pR/LtRiSQEA46Ddtt5rc71D
oYEHtYOjx2srC1iNTJYQspgRCrzuJQE=
=rYBA
-----END PGP SIGNATURE-----

--bwgaubazcukoldzr--

--===============1020719863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1020719863==--
