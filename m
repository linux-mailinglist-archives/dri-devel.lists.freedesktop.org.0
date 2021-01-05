Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C452EA67B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB55D6E09E;
	Tue,  5 Jan 2021 08:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F47A89F45
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id A4C361F450BC
Date: Mon, 4 Jan 2021 19:34:30 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v6 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Message-ID: <20210105003430.GA5061@kevin>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
 <20210105081111.v6.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
MIME-Version: 1.0
In-Reply-To: <20210105081111.v6.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
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
 boris.brezillon@collabora.com, hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: multipart/mixed; boundary="===============1583766766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1583766766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> GPUs with more than a single regulator (e.g. G-57 on MT8183) will

G72

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl/ztBAACgkQ/v5QWgr1
WA1dGw//bJtIv+4vzSRzSNAQitDrJAY7AdKGkgonfTYEme9fQbjUKIsPa/m2q5/2
tJZ1fFLF5gL7wgPV6fD4PtxyDUaZncaFUwIr6LDvCSu7a0AhoVk2OcO94Dr8IENo
T9TtuWNEerkypeQ/XZ1VilsNawl/CqeDpje5g7lOncXTPpZ9/emeBhj4VyFrWmZn
2X7J9FOOqUAZpKZbs4MvkEf2Vubxcme6fY3w6KTaaqNG8gHm3wdoHK0ZuowB1NXr
X1LvSeXgUvah7LZN+RWh0fhZKXjP5LkuJGAYDFRRpYO25+SJ6km67fD91zQVfVGj
WXYJyyLk+8u9ZiFvfY6dUFlKSbG3Srn4mk98lSyxkttaxv91Nom0V0ZSFeQe7tSC
xZusXiy4Djj2Oe1LYadi+ujkBY+aRtb/ysafhIp5ahc+2L+BNImDiChOqQ3RJe8+
t0iX92KnG8Pzmj/fZGQmCrgHMfRbl+soLYZqlbQ3rAri1RY0SihI0zm0M+UbFkTC
ijcEMTeF6Lcvc9CDD2o4uB+G7VZpoozTBN9BJQAep28wcsCRD9hhMo7t56ZZNDFr
6hpbEVrSjY9NCSno/DpcBSkyEdOFQZTIUr6lcSz3AbI810FbEsqqsTcHYYyzfJnQ
pIivSpzS712jcaYu62/odpsDmfciHNF1o/K7n2UXIPzGQFAXvxw=
=fUi4
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============1583766766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1583766766==--
