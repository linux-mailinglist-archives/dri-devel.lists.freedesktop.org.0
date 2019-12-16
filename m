Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5591228D0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8050B6E977;
	Tue, 17 Dec 2019 10:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D56E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 15:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1061528EE93
Date: Mon, 16 Dec 2019 10:22:54 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: ezequiel@collabora.com
Subject: Re: [PATCH v2] drm/panfrost: Prefix interrupt handlers' names
Message-ID: <20191216152033.GA2862@kevin>
References: <20191214045952.9452-1-ezequiel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20191214045952.9452-1-ezequiel@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: multipart/mixed; boundary="===============0559695813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0559695813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl33oU0ACgkQ/v5QWgr1
WA1f5w/+J/jUcxx/ZqOEBdPIG6Ml87WZSYDQ0/OYKkw7oWhdM6b2VivR7VaU6JDd
kCXZL8rGTR45Vxt8gOSJA3op2DakIkj5AcajrLT+Zo9ANZ7OaO0prn1hwmJljB3g
gGDdGr9CT3SyJ5qcd1GVF4hkI+7nsVpTllYs6cPgsUTpit+9D5ZaJ+7Q+MgjGz5G
kBgMpLzA4/Mf7aCU/5ldZWnFoahJgKpuvdKn2VdLvDknbpprAQaHX9jjkvR4tBBh
5Nec7g9fv2s8rkdIx3Tkzbr9eAv7HKx1l8vA6DbHxtKbFydLAIw8tE5zG1LcARL/
g6NQcqAZJG8/qxvAE+xIC2aSMTbZhvgLDM30S+uUyYspNLFEp90XCbfMkoNeTa++
MHZI0Clgn7oJuAL48yt9PHMgVALD7t9njcc4v3qM4XY7W4M6H0LZk6MoJA1sJIyk
4bCV4tguVhYWw1NQbPeVdfeR8QitaQ5rLFaoz9I8ZKq1UjeFk+PVjl5FsMiLCajX
pi+cWaViSjIKb+QUxLFTCjW4PdhejtQm9ulwkTbyhkO44m3Jr1iNtqssq3WWzswD
XJa7XBejkd+SknX5HKhqVsHRP6YFYu9yCR7sybVPziI7hTvaYa7iKaYSnWWpAow3
PA5ZNP84V8jIcoGGn19OrYSqWI0izFKV6q23Vh2fU27G/dlmsp8=
=AiY1
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--

--===============0559695813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0559695813==--
