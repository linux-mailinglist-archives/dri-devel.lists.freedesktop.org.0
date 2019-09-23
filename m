Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2EBB7F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54626E958;
	Mon, 23 Sep 2019 15:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567816E94C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:32:56 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1EAF207FD;
 Mon, 23 Sep 2019 15:32:55 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:32:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add Jernej =?utf-8?Q?=C5=A0krabe?=
 =?utf-8?Q?c?= as a reviewer for DE2
Message-ID: <20190923153253.7bxik4olfuteifrf@gilmour>
References: <20190919173020.11655-1-mripard@kernel.org>
 <CAKMK7uERdXAKj69isbFi6=tak2U2v1EAmCHO_pCtd_5OQ72d_w@mail.gmail.com>
 <20190920060820.w5yykoxleiao3yoz@gilmour>
 <1884305.6y54b83Agi@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <1884305.6y54b83Agi@jernej-laptop>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569252776;
 bh=4O1BVdzwJMpnlKdGYk7INccv9HRHEavFBnEl01x50mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R8v8Oeui1THKs9YoLneNyoHEX5PxHUhB5xZB1dAqyJDOs40Jar1ZN6TiNAKMdwaTc
 Q/YtSPuGqy4Kh0A1HPFOlpqI6NiiDrnkaLQsY2EeMOAzo/xMnq7Qv439Kkh6bMFULQ
 hbED0T2HEnz6G/HOhYc1K2rhPBeCPBK4w8Q4pzXQ=
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
Content-Type: multipart/mixed; boundary="===============1982733385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1982733385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="35dyx3xte72cngl6"
Content-Disposition: inline


--35dyx3xte72cngl6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 10:12:30PM +0200, Jernej =C5=A0krabec wrote:
> Dne petek, 20. september 2019 ob 08:08:20 CEST je Maxime Ripard napisal(a=
):
> > Hi
> >
> > On Thu, Sep 19, 2019 at 09:39:19PM +0200, Daniel Vetter wrote:
> > > On Thu, Sep 19, 2019 at 7:30 PM Maxime Ripard <mripard@kernel.org> wr=
ote:
> > > > The newer Allwinner SoCs have a different layers controller than the
> > > > older
> > > > ones. Jernej wrote that support and has been reviewing patches for a
> > > > while
> > > > now, so let's make him a formal reviewer.
> > > >
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > Haz commit rights already, or do we need to fix that?
> >
> > He doesn't, as far as I'm remember.
>
> No, I don't.
>
> >
> > Jernej, do you want to have drm-misc committers rights as well?
>
> I would be nice, yes. Thanks!

You have everything needed (hopefully) there:
https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

Once you have requested the account, please let us know so that we can
ack it and move forward in the process.

Maxime

--35dyx3xte72cngl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYjlpQAKCRDj7w1vZxhR
xXdpAQDg0QCAhuZuRh6H8OqtyeTk0SXTYEZDLDw+GUQqUI3JagEA3dEPpmXqemjh
zIYBg2LfYkW0EOn4oY2UzzRRlYUBmgo=
=3M0t
-----END PGP SIGNATURE-----

--35dyx3xte72cngl6--

--===============1982733385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1982733385==--
