Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680526DB94
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBAA6E148;
	Thu, 17 Sep 2020 12:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865BC6E148
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:31:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE697B331;
 Thu, 17 Sep 2020 12:32:12 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
Date: Thu, 17 Sep 2020 14:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1966838995=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1966838995==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7AbQEHukOWaAXeqbycUsB0MmsbMc4RBJZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7AbQEHukOWaAXeqbycUsB0MmsbMc4RBJZ
Content-Type: multipart/mixed; boundary="d03169LIHHjCHW0Ywly28WdOBa5oHsJe7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
In-Reply-To: <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>

--d03169LIHHjCHW0Ywly28WdOBa5oHsJe7
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.09.20 um 13:17 schrieb Ilpo J=E4rvinen:
> Hi,
>=20
> Yes, I can build custom kernels and test but I won't have time for that=
=20
> before the end of September so I'll do it only then.

No problem, that's still fine.

Best regards
Thomas

>=20
> And thanks a lot :-).
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--d03169LIHHjCHW0Ywly28WdOBa5oHsJe7--

--7AbQEHukOWaAXeqbycUsB0MmsbMc4RBJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jVykUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPlmwf+NNTlzU26I15LMByJuaWhz9xS8hnh
FK7ENoopkOOTqIxwfXpLudnXarwjF3oN2ypAizcENegnVL/V2PbeHBaLa9rlGt7n
7dxY4xRtgtZs/qkM0oVEd3Z6vy6sCdxZbU5Cq7UCoCPjzuaalI/Fi6YOk5YxRSnH
i6nd0FD5kppG4BA5LjSXXTZfwjYbpq/AptryXrZpqnNu5Uq9JEYaVm+nbHF/Bbir
cbLUXjUDCrPHZpm6f+Zx9tApqxM/C/1+YmwbWCpZXYDm9igQYxQrkCS3jystP603
KVapbHWjz5SbtUiK5ngmsmRWcJK8lLBuuursr8I/qzphx806LDTAcI8dTw==
=+RCD
-----END PGP SIGNATURE-----

--7AbQEHukOWaAXeqbycUsB0MmsbMc4RBJZ--

--===============1966838995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1966838995==--
