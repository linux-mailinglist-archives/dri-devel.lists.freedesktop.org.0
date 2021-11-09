Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBA44A819
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 09:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC266E4BA;
	Tue,  9 Nov 2021 08:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 532 seconds by postgrey-1.36 at gabe;
 Tue, 09 Nov 2021 08:03:21 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649C6E4BA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 08:03:21 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id EF81C1C0B9C; Tue,  9 Nov 2021 08:54:24 +0100 (CET)
Date: Tue, 9 Nov 2021 08:54:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Subject: AUTOSEL series truncated was -- Re: [PATCH AUTOSEL 5.15 001/146]
 dma-buf: WARN on dmabuf release with pending attachments
Message-ID: <20211109075423.GA16766@amd>
References: <20211108174453.1187052-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20211108174453.1187052-1-sashal@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <charante@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This series is truncated .. I only got first patches. Similary, 5.10
series is truncated, [PATCH AUTOSEL 5.10 035/101] media: s5p-mfc: Add
checking to s5p_mfc_probe... is last one I got.

I got all the patches before that, so I believe it is not problem on
my side, but I'd not mind someone confirming they are seeing the same
problem...

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmGKKS8ACgkQMOfwapXb+vLl1gCfd+r5euddR11xuPpPtrlVxdPt
/RIAn2wKamYNq6ES+jXc31enja7CHe16
=uSLT
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
