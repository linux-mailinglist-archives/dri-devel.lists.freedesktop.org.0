Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D197531E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 15:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD8210EA00;
	Wed, 11 Sep 2024 13:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X8WDeDsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEE710EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:01:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3C86A44DC3;
 Wed, 11 Sep 2024 13:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3103C4CEC5;
 Wed, 11 Sep 2024 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726059689;
 bh=Y2dTRAXOnfot8iHJJvSaM3F37Qy2pbY1sDPyxAqM9RY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=X8WDeDshi7SHKKZ95fOu+lJ38GoslX25gjfFEY5itnaP7sKz24prOK7aLufuIoFot
 n6zZrFxvIcE1HWkey3pikGTaGe56TCHOaDZf3PcfjVCO+RyPiS7msVmKcnyswa8ehq
 cg58I1IaOLVH50FCPOBC6siboh/dtSDzMwcCeb8qi1YhE8/5F23O6eug2deO0YaFDk
 bR2vYNSossRsT24n+LdE/nujAHQTT36SurP5+wgPEP2BRwbX75G3B6r0WT44E2kZLf
 kjThaOTyUCmJdKA4Sw4iuUQXn9QO+bU2xEVEO/PDN7O0h+dev8cAZf9ELYH1YVXYQP
 EfJ/4PH1OYPag==
Date: Wed, 11 Sep 2024 15:01:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maira Canal <mairacanal@riseup.net>, rodrigosiqueiramelo@gmail.com, 
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 sean@poorly.run, thomas.petazzoni@bootlin.com, linux-kernel@vger.kernel.org, 
 seanpaul@google.com
Subject: Re: [PATCH] MAINTAINERS: Add myself as VKMS Maintainer
Message-ID: <20240911-functional-finch-of-competition-ad54e9@houat>
References: <20240910-vkms-maintainer-v1-1-e7a6c7a4ae71@bootlin.com>
 <68da3932-10ab-4001-a978-f0f54034a64d@riseup.net>
 <ZuGJyfhkQe93jKlz@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zvk72urfd5k2etgy"
Content-Disposition: inline
In-Reply-To: <ZuGJyfhkQe93jKlz@louis-chauvet-laptop>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zvk72urfd5k2etgy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 02:15:05PM GMT, Louis Chauvet wrote:
> Le 10/09/24 - 15:57, Maira Canal a =E9crit :
> > On 9/10/24 12:10, Louis Chauvet wrote:
> > > I've been actively working on VKMS to provide new features and
> > > participated in reviews and testing. To help Ma=ECra with her work, a=
dd
> > > myself as co-maintainer of VKMS.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >=20
> > Acked-by: Ma=EDra Canal <mairacanal@riseup.net>
> >=20
> > Please, check the procedures to apply for commit rights in drm-misc and
> > apply it. This way you will be able to commit your patches.
>=20
> Thanks for your support!
>=20
> I just checked the rules to become a commiter, and it requires at least 1=
0=20
> non-trivial patches, so I can't apply right now.

As far as I'm concerned, being a maintainer of a driver in drm-misc
gives you automatically that right :)

Maxime

--zvk72urfd5k2etgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuGUnQAKCRAnX84Zoj2+
dqaKAYDkNQFuPF/ydzBRCY5L/EaV+kwp+EI2wR4ildCdpamijvnSnPFzyNu5sj/2
jrqXtacBgOqomm/El1eiSCam/4mfn5d3JfOTbRXYETFSYLFUbdYLKbGJn6HNsvgn
LKApumJbAw==
=KTgg
-----END PGP SIGNATURE-----

--zvk72urfd5k2etgy--
