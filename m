Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777C2EA678
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2936E6E088;
	Tue,  5 Jan 2021 08:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026789249
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:35:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id EC5471F44AC8
Date: Mon, 4 Jan 2021 19:35:01 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v6 4/4] drm/panfrost: Add mt8183-mali compatible string
Message-ID: <20210105003501.GB5061@kevin>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
 <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1540991447=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1540991447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Add support for MT8183's G-57 Bifrost.

G72

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl/ztDQACgkQ/v5QWgr1
WA2AdxAArG57a2smC1BqpcY/2qFinFJAiNzzzEHZaiFh89MTBkKz49V0yC5rs/PY
dyXf1wapDtnDbsaFc4C6Lna6Gx6HFqzhvVEIT2iIQBoMNOnBkZzjiPIu/8O8xa8V
VGgT+1H/PCLBdOwYZvHEJoooYSNJXRULSeubjUhxbsJ7oZZr81J5jPlE/fMKuiRn
yUSvOQPVsC4eX5QlskHDGIaylRkmy7Nh+Nb0aTlY3zvMJUYtRgIp0aK3iukurDnD
mI+TQPQ1WiTRwHGb23TUdbOPVDdDyvtfowI1QnqT7d2ULkevCvbsmJdl52Vg0Wpa
e3UFe5GH41gMhXQR0h5Ey/sggKnEI63eq+nUwdkeiyV+sZVf1ZC6iKggOmUtw3vo
CbxPvANIznLg/sa700BwVdwr1VPr132IzgNoLfPRGH2AyE4Yv5NFlQXqeFoTsA1x
CjAXGl8gr42aeyg5q0KKXNzi1uYEb+mU2HGbvjcdSA/c4IN+/dpSJ6zcJYLQCewf
sha63em98yGgTilRup2yqxImd1MvK2rZyeY4BeDrxeCQ4kUsyUNXAT+uWjProoTW
uYH0l98CFSBvsFoD4Sn5LrMOc9mhuVBMLsSW6TwewOXL72KcoTDOlAyqZ4FWhISe
Oa+r7uL+z9RConR+eIr1rHH9fBFO46S+kFls0a42L/L6OsjHFSk=
=Q9kh
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--

--===============1540991447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1540991447==--
