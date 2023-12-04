Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21468802D7A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC01D10E09E;
	Mon,  4 Dec 2023 08:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97C410E17C;
 Mon,  4 Dec 2023 08:44:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEB3CCE0E56;
 Mon,  4 Dec 2023 08:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6551C433C7;
 Mon,  4 Dec 2023 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679454;
 bh=xpgPzulNevCUlsiFp2dMGa9+E23juK/4xiRXU8jbrZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gFePe9RdWDFr3EKCrhfUl0e058tQhYJziFpa8yaN3dgBfmjplJZ9qi0/Tc+rwjCLP
 rEMOyKPmOgH8KFEs2421n+fT4vOuF41M7oRIU8vr6XFrytPfdiLcZ3YKhgTePVfkvG
 m7vl5fPtC7j9bqtyHRTQjPJhegtSoLtfVpIucaZO9K6cwPvZD0VT6/b3P13SnH3pfs
 Hs6S4AHl1bumAZBkKWc4nelEpqMCgoqkdVxZGoMQBw90+d1KPfFGT1BpTzNUBwWEs2
 WgoRgUNI9F/fMMuzLJ7dzaS/PDFiPMwqCcpKxHOoRLjvpkD37lYNIoNGhB44JA1ku3
 nr8tAJJzWi+UA==
Date: Mon, 4 Dec 2023 09:44:11 +0100
From: mripard <mripard@kernel.org>
To: =?utf-8?B?5L2V5pWP57qi?= <heminhong@kylinos.cn>
Subject: Re: Friendly ping. I think this patch was =?utf-8?Q?forgotten=2E?=
 =?utf-8?B?Ly/lm57lpI06?= [PATCH] drm/qxl: remove unused declaration
Message-ID: <kk4xtz2zxe37ner7cl5qvlk6jhciu7hgvpltf7gddphepnxqwg@noe3lrmff3ax>
References: <1290mcwo8vf-129368jicj0@nsmail7.0.0--kylin--1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mrjqp5qcdvleulqp"
Content-Disposition: inline
In-Reply-To: <1290mcwo8vf-129368jicj0@nsmail7.0.0--kylin--1>
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
Cc: tzimmermann <tzimmermann@suse.de>,
 virtualization <virtualization@lists.linux.dev>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kraxel <kraxel@redhat.com>,
 spice-devel <spice-devel@lists.freedesktop.org>, airlied <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mrjqp5qcdvleulqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks for the reminder

--mrjqp5qcdvleulqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2RWwAKCRDj7w1vZxhR
xTKFAQClXxO9sDpuh6JQFW2Xg1PnWk1Pz9aynBWEXekfGLIqLgEAh0s5I+A5LU+X
+S+NsqIYz+28V3nfD/itBaG2c2ON8ws=
=wUoA
-----END PGP SIGNATURE-----

--mrjqp5qcdvleulqp--
