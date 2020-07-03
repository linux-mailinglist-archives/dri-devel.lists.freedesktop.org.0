Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8B21530D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D26E103;
	Mon,  6 Jul 2020 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9CC6E12E;
 Fri,  3 Jul 2020 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID;
 bh=3wtKwJ8jSwfxuwx4E2mHdRG1tuB411zQFYLo5GaTh/I=; 
 b=Db6qtSAHt79/RpBjDbl8aIymP0L4/A9eTkabNzQadHpj5CdkpTaz4JRZSiNNgydwWHt/iFrh7YzSIwEWWX8mDmDUL4LWjqe3O5UIc+M8RiX5wLvlHp8f3uYdANV3hjKByGuOzkI8CIiYMciD5JKDiOQprRvD05q5al82Xf7SpMTtbHhSZ4ymWEILsyizYi2UwL61n5gsG3mUpyPiPQOqWPuYHvx9sUWFFNjcG0kuE3sjRErLUTv4tZKYhRVGDdIdkvnXxWaq9svl6ZC8RwX+2VXpx5LqjViVsnH6/NRzQtbM3P95qNFNXuAlPbMhc9JBnVNO4omj69f1jA7lAyaPow==;
Received: from 53.red-88-15-141.dynamicip.rima-tde.net ([88.15.141.53]
 helo=maxwell) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jrMsy-0006k1-L4; Fri, 03 Jul 2020 16:41:52 +0200
Message-ID: <4e5319c905109f9fe4ca48dee0e89d83ec73f2da.camel@igalia.com>
Subject: [XDC 2020] Virtual conference + Call for Proposals extended 2 weeks
 more
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: "Szwichtenberg, Radoslaw" <radoslaw.szwichtenberg@intel.com>, 
 "events@lists.x.org"
 <events@lists.x.org>, "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org"
 <mesa-dev@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "etnaviv@lists.freedesktop.org"
 <etnaviv@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Fri, 03 Jul 2020 16:41:42 +0200
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: "board@foundation.x.org" <board@foundation.x.org>
Content-Type: multipart/mixed; boundary="===============2146693470=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2146693470==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UA8V1+yvXFwTWVEJGo8l"


--=-UA8V1+yvXFwTWVEJGo8l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

In the last meeting, X.Org Foundation board has decided that XDC 2020
will be a virtual conference, given the uncertain COVID-19 situation in
Europe by September, including the possibility of a second wave,
outbreaks and travel restrictions, either in Poland or in other
countries.

XDC 2020 organization team agrees on this decision and it volunteered
to organize our first virtual XDC!

We would like to announce as well that the new CFP deadline is Sunday
July 19th 2020. Don't forget to submit your talk, demo and workshop
proposals!

Thanks,

Sam

--=-UA8V1+yvXFwTWVEJGo8l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAl7/Q6YACgkQf/S6MvF9
w0PrUw/9Hx3/w07dFx2Eyn/tQnhsAYXs+ZSTHUZ0wuFlv+pWrLQ0g1swQF/GNpbO
ZeJt2nKTqc8bbwdn/yQzf+ktt0jsKAktwCyJBVlHhjsvIj/tJx5IvD8iRfNZRftz
OhE+UAqwPCUqc3QZ/R11IRyVr7XVu1RTarTGsC6Clk8tFzIuaRDEKJWTJ9B9jjy0
WHh8ufEVVQsU3qlSNS+C7BvKKIJlHfYQvaEBDHjMYT3z9pc0ZwExMtM4zeedtCLz
tUS9yynRrtXlrZuwvDAXZAnURMl9oj8SOPhyk1zwPoPF6FX6imurQkP9BbNeqX17
f81vAOm4fhX5VPnFPHQ1QiwCOj8xaCiwaMPZEwr6qZbbIKQEFgRpJYzgMF8nis+K
MOf9fPdsEbRm1B2wSNT3pcoPYkn15TztF0kq0seWhgESzXCnr+5k+1UyO66Cp22x
xx1thK5P3Y2/nYAKy827fWc1NrDXpUOxaAaWvRAvfWNVjG37sUSFcoHE0/Sc4QZN
cZCDfFIO1+UwYQZXHjotslrW3He4APqgRm+pZgdKLufuPuaCpdFRNYPqdpBcmSI0
aYm3QmeCmXxiTLZak6I8wardeR9bgDBdVmexBOONbOZjIXzRg/dijn8YjxvzeiOQ
vJslTubiFcKRbbrZnr5gBaBtp0rFGN/nSQlUT4A7loMlianuavA=
=pmv+
-----END PGP SIGNATURE-----

--=-UA8V1+yvXFwTWVEJGo8l--


--===============2146693470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2146693470==--

