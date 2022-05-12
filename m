Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26856524B0C
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7744310E1DC;
	Thu, 12 May 2022 11:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2710E1DC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R9PPlT/iYfYXZmvBGZ+av0QDqdAqcwxb3U1hVRY7OdE=; b=XXRffj9ZSRESWi29ElP4VcgIF2
 R9objOVOe/eGH71XH8S9aTkvhl23lh2ZJeVVMuX16NozCg5i8gDdYVICBKwbGYRo/yiJke81B0HM0
 D0wUVQdFK32u+FNHIIdstAaoX+54QcJ6F0XAcU99pTempAGmgq3rYr0ZdnC2oJO2/wSo4gKWCoBha
 Op1fbmyR+9CGXIK1Xz81D/e0lv0+JOaGyKZrRZn7q1fEIxyB3pp/fHkWOGYGcpHOGAR+xeYhUA5OG
 qycxEC7r0Wl6MTwbZRW5UtG/DRk6aATO8p43f02lqOh0ih1duUdHmI7hM66F2BAoIsS/Bb0L97xnA
 ams1u9gQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1np6gj-000AGS-3e; Thu, 12 May 2022 13:08:57 +0200
Date: Thu, 12 May 2022 10:08:45 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH] MAINTAINERS: add Melissa to V3D maintainers
Message-ID: <20220512110845.ljgoxhukld5tbb2s@mail.igalia.com>
References: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
 <165234271412.626324.12156131765989430269.b4-ty@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xq7ohyvzmarfmwud"
Content-Disposition: inline
In-Reply-To: <165234271412.626324.12156131765989430269.b4-ty@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, itoral@igalia.com,
 dri-devel@lists.freedesktop.org, jmcasanova@igalia.com, jasuarez@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xq7ohyvzmarfmwud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/12, Maxime Ripard wrote:
> On Fri, 29 Apr 2022 18:33:30 -0100, Melissa Wen wrote:
> > I've been contributing to v3d through improvements, reviews, testing,
> > debugging, etc. So, I'm adding myself as a co-maintainer of the V3D
> > driver.
> >=20
> >=20
>=20
> Applied to drm/drm-misc (drm-misc-next).

Thanks :)

>=20
> Thanks!
> Maxime

--xq7ohyvzmarfmwud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ86rYACgkQwqF3j0dL
ehzzSQ/+KpUHejM0JHiksXO67Z1bCvUwRmup9aECrxjqWShY9B8pwnITOCn576+L
MvIth9HZByIHG3uNKZdVtnTKf5xhSnsN/jm3rjZYyWemNozj5v4bi2WxVBPjEN0C
xMb0qnmf2o+CEcuOfXPcMg4qF89Wwh7JVO9QMoBTUzzyxVFNK4OO0QEXfF1wwFCV
HWom38UI9kRfQXHyBAc57vyKDHnmdCFP+FzLiX97AN7Yek8q4zfLuCApfmyLMJJ6
K9oKvxrbELSNGeAQzBU+m8MOPhpz/3cpN71JgSH39iFVS9uHGFqlvw0Ls74c0qci
ci3bWZ1IoslRjr3Yj81EilXgGqH7m8J8HcSUNJGPY93tyf3mCchOOrgrQJigrXAV
kmEaOsbNnMl/cWvHVG5YloHfUpTuYy63EOMpS2EQx6KD4o2EZaK6etSVwQyBGnWk
KWJTf9IoHUoU59hlvH740E4stqOHUdw9CERktSyz+qhDCLINioLv3QJN5YWsd2em
L2hHHul3m9KOkJRtaEcOfrk/N+neO/wZEqJonDDfYMn4LwMVsRnnU6M8s4rdrzEj
k+N8zNKveo+F/9Bv9k2z8O3UEX8alr20oGkdD8hxoNKJalRTv65zaejscuAR63ST
mudSa2FHc86ouKBHLzDHFoDrYgneVImNoMbz/SLdrx5T98yNWik=
=UxHh
-----END PGP SIGNATURE-----

--xq7ohyvzmarfmwud--
