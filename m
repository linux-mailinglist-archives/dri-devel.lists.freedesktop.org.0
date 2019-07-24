Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E07481C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5B46E66C;
	Thu, 25 Jul 2019 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7216D6E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 17:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id DBB9D283CC1
Date: Wed, 24 Jul 2019 10:47:13 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Export all GPU feature registers
Message-ID: <20190724174713.GA2836@kevin>
References: <20190724105626.53552-1-steven.price@arm.com>
 <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
 <20190724164004.GA8255@kevin>
 <CAL_Jsq+cLg5R=SJ0zjfVqYB_So-gHT3qb16wcOCbrHuufSZgLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+cLg5R=SJ0zjfVqYB_So-gHT3qb16wcOCbrHuufSZgLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
 Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: multipart/mixed; boundary="===============0502189506=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0502189506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I think this ship already sailed when we added the first one with
> GPU_ID. Also, at least etnaviv works the same way.

Fair enough then!

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl04mZsACgkQ/v5QWgr1
WA1KhQ//QyUZMhFEVJsHJiDBp+zDqDq6xeA2ytimiiwjyqWLpimmGP4nLPvOabGz
irjA3hjB97h4L4d4cvDCjgmLuh3joXWaUXWT0SLs5HrG0S+1wZojoGKk0TTPBzK4
R0m4d28yNhahZp+7yJyy/x44UDy0cUNe9jLo1cEgc4O9UrwjHEJW6lAZrMsPmKrb
7dWKre3jaNZBnX4nKxnhVHURT/FhoKyzjQAcFeG1M06uj+i5FzTPKYHmCn3CzKpl
sf0PWXAAjtaTxGTaS1NzfQjTEbMyNtJVAetMzWn20VNFtnwW1TxDc3ZN6V29jkoP
bHf5fprR5A6PTyvAhKL9MXgygrSVhvb0A9BbLfcuPe9FGBmSAetMLw5GbVUQ3gMZ
3K4cSYvCfG8toAQlFRlLLPooZ7VG3rLUh6wPXgmRgiCR3zUH0Pz68NdZlu+L0u9b
M3cwVs+MCh543et0MFKU+B/2HL9mRuowOefUZvsEc/dQudzMsAE+NK7PJl/N6gkG
Ah/sfkw0+kKi+EzMibSUPeWlYEbcMCxEwCawE9PsCj8Zw7pMn5msMhu76HPxk09m
Mr3llwYbG4X26eXfFFlwodyfyL/z0MRghQQuJWwfmzo2445E6j+LDjLoqtys4n9K
jmfTbpNFPwHrfU/QRd717sv+A2k79syZ/lcuu9f+5LQ4EDztLV8=
=5PdD
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

--===============0502189506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0502189506==--
