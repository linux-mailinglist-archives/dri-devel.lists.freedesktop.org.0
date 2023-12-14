Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EA81301D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 13:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D1610E2E0;
	Thu, 14 Dec 2023 12:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14A10E2E0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA55E621FE;
 Thu, 14 Dec 2023 12:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0759DC433CA;
 Thu, 14 Dec 2023 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702556959;
 bh=ZrgiopH5ZvwjxmVIyJYm/63eTL6WoWUQTuAoEP2dkAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYWUTK+m5vvrarorTLsDgr31MVemoxcyrk/O6p2BcN1rFb0rTqR31KicpgKkIqdVN
 6yOaBRUGHBCJyhAqJa9Fw+yAWIWp8N89Na0UixNs5DaaSCE7/iXIMj5iwzZ9gixzX4
 2wB3wRWDxtZ5xcYbRbsXb/C9IEQJCGLUS/hx/gdrH75gxrTFtbdOUjjwmcAna61zbf
 EDBEJBomOWfY+AzdxlE21tc8YRoK0xtnyhnW098AoX3IucKZMgO3EQmo1/cw9/C5Fb
 H98pkYtWZwu8H3tE7E7JhbFS63y9CaqNIpGLVrfW3nReIUp1DoJ1AYjkTaovEFZXfS
 voe7xkxDO+XVQ==
Date: Thu, 14 Dec 2023 13:29:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Donald Robson from powervr driver
 maintainers
Message-ID: <b76jxgqgfuipd7fhwlyrecay4j6fi6ptcoiypf52tpg2iwz7tn@6it54w5c75rk>
References: <20231214103353.122257-1-donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7hc5enx5fvafxeg5"
Content-Disposition: inline
In-Reply-To: <20231214103353.122257-1-donald.robson@imgtec.com>
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
Cc: matt.coster@imgtec.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7hc5enx5fvafxeg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 14, 2023 at 10:33:53AM +0000, Donald Robson wrote:
> I will be leaving Imagination Technologies on 2023-12-15 and will no
> longer be working on this driver.
>=20
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

Applied, thanks

Good luck on your next adventure :)

Maxime

--7hc5enx5fvafxeg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXr1HAAKCRDj7w1vZxhR
xcPUAP9/IAB0sooZA/RTZEE9Id/2UyjW7dkuNR6Z5UFyUmmL1gEA1hj19mBq3nuC
oxSWmnS8rVyhkS5tXtWZiZrHKBy/vgs=
=ELuv
-----END PGP SIGNATURE-----

--7hc5enx5fvafxeg5--
