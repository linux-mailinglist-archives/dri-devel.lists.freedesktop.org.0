Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612CB591AC8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 15:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E73D18A865;
	Sat, 13 Aug 2022 13:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Sat, 13 Aug 2022 13:52:28 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7CBAC6A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 13:52:28 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CCBDE1C0010; Sat, 13 Aug 2022 15:44:17 +0200 (CEST)
Date: Sat, 13 Aug 2022 15:44:11 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 05/46] drm/panfrost: Handle
 HW_ISSUE_TTRX_2968_TTRX_3162
Message-ID: <20220813134411.GD24517@duo.ucw.cz>
References: <20220811160421.1539956-1-sashal@kernel.org>
 <20220811160421.1539956-5-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <20220811160421.1539956-5-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>=20
> [ Upstream commit 382435709516c1a7dc3843872792abf95e786c83 ]
>=20
> Add handling for the HW_ISSUE_TTRX_2968_TTRX_3162 quirk. Logic ported
> from kbase. kbase lists this workaround as used on Mali-G57.

AFAICT this quirk is not used anywhere in 5.10, and its users are not
queued. We don't need this in 5.10.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYveqqwAKCRAw5/Bqldv6
8urJAKCrXQlYnGzP07bFxiXqaP7i9ZQL9ACgppi35hinxJlTlyfFeAY9Grmxdqs=
=0Cas
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
