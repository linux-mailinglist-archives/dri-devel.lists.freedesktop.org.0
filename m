Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951D9FCB5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18084896ED;
	Wed, 28 Aug 2019 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80784896ED
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:17:32 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2C6211C0016;
 Wed, 28 Aug 2019 08:17:29 +0000 (UTC)
Date: Wed, 28 Aug 2019 10:17:28 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/3] drm/sun4i/sun4i_hdmi_enc: call cec_s_conn_info()
Message-ID: <20190828081728.3prhkjq3o2ndadvx@flea>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
 <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
In-Reply-To: <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dariusz Marcinkiewicz <darekm@google.com>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2041013626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2041013626==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="elwmax327enzry3p"
Content-Disposition: inline


--elwmax327enzry3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2019 at 01:24:26PM +0200, Hans Verkuil wrote:
> Set the connector info for the CEC adapter. This helps
> userspace to associate the CEC device with the HDMI connector.
>
> Tested on a Cubieboard.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--elwmax327enzry3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWY4mAAKCRDj7w1vZxhR
xZLrAP9X6mugRqxtiUk6Exhdt6v1sAs1+cgS4zHZThS+W8UaxwEA/0A1c3ljf4xL
7feT4RNrgewx61O4vRAJKmE2D9qtPAE=
=7Ikl
-----END PGP SIGNATURE-----

--elwmax327enzry3p--

--===============2041013626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2041013626==--
