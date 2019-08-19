Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D62492679
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D3F89250;
	Mon, 19 Aug 2019 14:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79BF89250;
 Mon, 19 Aug 2019 14:19:52 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B698E40012;
 Mon, 19 Aug 2019 14:19:48 +0000 (UTC)
Date: Mon, 19 Aug 2019 16:19:48 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PULL] drm-misc-next
Message-ID: <20190819141948.hexaspzwv5bx5qrk@flea>
References: <20190816113201.jwh7bqeddxllvgdv@flea>
 <156595602639.11610.9192945758435317854@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <156595602639.11610.9192945758435317854@skylake-alporthouse-com>
User-Agent: NeoMutt/20180716
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
Cc: Sean Paul <sean@poorly.run>, dim-tools@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============0152159541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0152159541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tzh7ajwlyfp33ole"
Content-Disposition: inline


--tzh7ajwlyfp33ole
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

On Fri, Aug 16, 2019 at 12:47:06PM +0100, Chris Wilson wrote:
> Quoting Maxime Ripard (2019-08-16 12:32:01)
> > Hi Daniel, Dave,
> >
> > Here's this week drm-misc-next PR.
> >
> > Maxime
> >
> > drm-misc-next-2019-08-16:
> > drm-misc-next for 5.4:
> >
> > UAPI Changes:
> >
> > Cross-subsystem Changes:
> >
> > Core Changes:
> >   - dma-buf: add reservation_object_fences helper, relax
> >              reservation_object_add_shared_fence, remove
> >              reservation_object seq number
>
> I just undid these. Probably better to respin without the headline
> feature being immediately reverted :)

Thanks for telling us :)

I've sent a new PR with the revert

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tzh7ajwlyfp33ole
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVqwBAAKCRDj7w1vZxhR
xR6qAQDoj6KGEcm7v72tXuZRpn1MS631sD0Z/GYLITkulUSGAwD9G5pUGW4Veub6
K2TwxbMbr2JHNlvDiziLzbyXYWh82QM=
=e3iz
-----END PGP SIGNATURE-----

--tzh7ajwlyfp33ole--

--===============0152159541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0152159541==--
