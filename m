Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA4B1B9C1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 20:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFD910E290;
	Tue,  5 Aug 2025 18:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05410E290
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 18:01:21 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id D72251F0004D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 18:01:13 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id EF633B011F3; Tue,  5 Aug 2025 18:01:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from collins (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 7B3B7B011EA;
 Tue,  5 Aug 2025 18:01:10 +0000 (UTC)
Date: Tue, 5 Aug 2025 20:01:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add Olimex
 LCD-OLinuXino-5CTS
Message-ID: <aJJG5PU3hIJJrQ6i@collins>
References: <20250702082230.1291953-1-paulk@sys-base.io>
 <175432157672.3671011.14707033702603455664.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gB+aj2eJYR9cQpGK"
Content-Disposition: inline
In-Reply-To: <175432157672.3671011.14707033702603455664.b4-ty@linaro.org>
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


--gB+aj2eJYR9cQpGK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Mon 04 Aug 25, 17:32, Neil Armstrong a =C3=A9crit :
> On Wed, 02 Jul 2025 10:22:29 +0200, Paul Kocialkowski wrote:
> > Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.
>=20
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (dr=
m-misc-next)

Thanks for the review and merge!

All the best,

Paul

>=20
> [1/2] dt-bindings: display: simple: Add Olimex LCD-OLinuXino-5CTS
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1da71a08080=
bb5cf5601f237e94c3dd5cede446b
> [2/2] drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS support
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26232780077=
b3e6147fabb6111afd0bd9a60f973
>=20
> --=20
> Neil
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--gB+aj2eJYR9cQpGK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiSRuQACgkQhP3B6o/u
lQyoOhAAmJnQfFcOAssGCV/hD7wAv9KgYX8Ys/d6LwaZdnwgJ+l2oHdv36fH5rq7
JJuYydPP/7DrAWnuSWlI3oPW5I1tEPXeOcY6kTVFVD/4rXRSLRXqPcHw91+BEU6s
20pLAzNvRnjG5zzRugE5rd8CYmtAmINmczEAvzlaCVNWmrg8+wwexsdUKb8oe4mI
T/kVN2JT0aTrosb5wvDSYhanA+Q2GPTUh1HKCm7tJFgVRBwCb6TF1Q/HWL5smGEV
capM3il6vZqKMeSUgc9qOUNnWoZl4zyMyX0AMPboWbxGxTmbormvgwyRpXwuYwVq
Vj/yB3bm3gNQY2fZhBmATGvW20nflldLeFRW44RdSQ5EIsVzJ2U6oq/bhKmYEL9a
MvwBWMjQGY8HdyN4STrq7wkyy4Q2zofeJornKCxU50FYoIy16ge8sHU0SGMfMwxU
EAgNid2nNgY0vYMocwdhugtX4I+ngGHAHA92WC+pKUiVW0v1Pc1lt8xxYjEMGXPG
C++brVvCCS8X3HSPpUmSetYkV4HlOAgzHFip5Xqx1O63lTiCrWxjFWe4JPpRGcad
8QFCW63VkGnbbyrgM0FG0pb4uzPV6CMDR2H1oX5E4E3OyqitWLLmAwLsy6nN5v+T
TEuBRs2vm6wtTOQ+etniDUpo8f9L8hP0er9Jqy7yM+r8knVGYS8=
=ufcX
-----END PGP SIGNATURE-----

--gB+aj2eJYR9cQpGK--
