Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39C811F2EF
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 18:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F706E0CC;
	Sat, 14 Dec 2019 17:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE7F6E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 17:48:31 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 688DE206B7;
 Sat, 14 Dec 2019 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576345709;
 bh=j0cVVduqPZlIJCt7KdsAChcBm98KlrgSj7LuGXfADtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRlUD67SsC3no5wZ2NmSP4n5VDMdh1W4oz9RpVBJ6Trchp7SF2sLUqgfZ75O+aP5g
 NSIqc9z359ro1N0EEVIQTRZUTyYGWl19SKWNpSeJ2RXsJV9anNpZSoLhD7gGvFmtHH
 qznE+LN5YjFEKs7o+211O29uI1CXRjcXTyrra02E=
Date: Sat, 14 Dec 2019 18:48:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 0/2] drm/sun4i: Remove unneeded semicolon
Message-ID: <20191214174827.2ua36bdyd4cruany@gilmour.lan>
References: <1576317091-24968-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1576317091-24968-1-git-send-email-zhengbin13@huawei.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 wens@csie.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1370132724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1370132724==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq4asypllxoogmjg"
Content-Disposition: inline


--wq4asypllxoogmjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 14, 2019 at 05:51:29PM +0800, zhengbin wrote:
> zhengbin (2):
>   drm/sun4i: Remove unneeded semicolon in sun8i_mixer.c
>   drm/sun4i: Remove unneeded semicolon in sun4i_layer.c

Applied both, thanks
Maxime

--wq4asypllxoogmjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfUgawAKCRDj7w1vZxhR
xX5gAP4xFduplod+4goMNhuN53JJWcWKrNm3JMooYCbn+X57lwD/RxUI2b++7rwH
wFMmW+jkpz3dH1UwM163irZWST9Y7wc=
=NZ1P
-----END PGP SIGNATURE-----

--wq4asypllxoogmjg--

--===============1370132724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1370132724==--
