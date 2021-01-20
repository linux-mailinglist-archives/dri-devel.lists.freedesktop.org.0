Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E12FE57F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ACA6E8EA;
	Thu, 21 Jan 2021 08:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688DD6E456;
 Wed, 20 Jan 2021 20:47:33 +0000 (UTC)
Received: from kevin (unknown [IPv6:2600:1011:b148:a411:ca09:c6a2:9f17:bbdd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A42EC1F44890;
 Wed, 20 Jan 2021 20:47:27 +0000 (GMT)
Date: Wed, 20 Jan 2021 15:47:22 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v3)
Message-ID: <20210120204722.GA6883@kevin>
References: <20210120200959.163533-1-luben.tuikov@amd.com>
 <20210120200959.163533-2-luben.tuikov@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210120200959.163533-2-luben.tuikov@amd.com>
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0756670466=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0756670466==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Panfrost hunks

	Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAmAIltUACgkQ/v5QWgr1
WA1Gyg//aTG0SHbVtkDsd68epa5WomHMoVAt/5Y6U/6pBtMSFN5m5hCpXOsVlZ/l
wkyWfx0kKH+vSasLZycGq7wYb7MH3pY1cvyiauzUin/s/iU1frzX1jlPuJ/mEOct
1sQe6qpKEujIUVYp2b/P9oAAi9VrjUAM2WYc66fWzTwtnMi6YK15ajqXjmbaRnvu
DdYGdRk3i9cO+OpL5fEteKThWy+rRRfGNZ3fHX4MRrJr0G9viSQExI4JgPEE2Woz
67tJN3/VO4rTfnaawxb8hP3YAjaN3wDacu0bO6fjmTf+Le+gYZqwH5J8QwDovsCl
5U2XODp3zlLvZGLsCdtwCRCByk/vQ4oZo1ysQOupcPsztZWoIhvx58f51dLdz9++
EMA6B7o+g27AxBJQ2DAGy2vLerR31+P/aZTgp/oFcxM0MpekyBr/GjEBZJKz4nLK
Afj9AnP+FsvU41jnqQdcyBHzg7LOAnYlY1RnndMjwJHKC5kXRdklmOr33SPjmFf7
0iVh3bytKpDvg+j3Pmmkdbc/6Onr0tQ0DNOrluYXlCrdofABtNhhvW95x9yrI3Cp
A9P7UHOZYbNgVCIVwlr/uGaR/GMCCRnhN7kp+0YOzWCmsvWNjQ6R0c2h9R10GoQW
0yhNRpkckm+edX5OhlJSknmbUKP1b/eJwonJEqHpUDxFEpIBWa8=
=GzA6
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

--===============0756670466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0756670466==--
