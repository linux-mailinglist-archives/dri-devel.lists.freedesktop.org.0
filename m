Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C1585C54
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 23:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152110E6CC;
	Sat, 30 Jul 2022 21:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CEE10E86E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 21:31:02 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1D5FC1C0001; Sat, 30 Jul 2022 23:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1659216659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o9GONExi2bMzEQw12WI9p6+Qh5VXr1fFNHfflQl3nxw=;
 b=cSY49q+q6Yc2MxDLhSVDO5DseSSWxSphwN08c+PDJwwl3Bm1ceR8BfmtlkTZDhMRMkQgWT
 6hgHQOc1WS0juhjHH1FOan8RAuwST7qllswVe6Iu0ECAnUyZ9Tlo67dwNty/31HU96/0eX
 tuwjCFSCzKGcnj8PqNUObH7zDgNN+ZM=
Date: Sat, 30 Jul 2022 23:30:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v6 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Message-ID: <20220730213058.GI23307@duo.ucw.cz>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-5-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="6b3yLyRKT1M6kiA0"
Content-Disposition: inline
In-Reply-To: <20220722102407.2205-5-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 alice_chen@richtek.com, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, andy.shevchenko@gmail.com, chunfeng.yun@mediatek.com,
 linux@roeck-us.net, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 szunichen@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, sre@kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6b3yLyRKT1M6kiA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2022-07-22 18:23:58, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
>=20
> Add MediaTek MT6370 flashlight binding documentation.
>=20
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You'll need to get sign-offs right... And review from dt people before
this can be applied.

Best regards,
								Pavel
								--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--6b3yLyRKT1M6kiA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYuWjEgAKCRAw5/Bqldv6
8o6vAKC4ARVicLPm5uV4zxu75IiOs/DsvwCgn6SlrzK+9+kIJXHJNS6WoAmW4j8=
=aw5u
-----END PGP SIGNATURE-----

--6b3yLyRKT1M6kiA0--
