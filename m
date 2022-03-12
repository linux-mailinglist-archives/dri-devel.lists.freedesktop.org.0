Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F20204D708C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 20:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B8410E0CC;
	Sat, 12 Mar 2022 19:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Sat, 12 Mar 2022 19:29:59 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC0810E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647113397;
 bh=BiQBm2UCZmXDRmTqod0u4Z76MdsDly3+2N9yHM33E/4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=I8z90xCbiwzW4wAL3vOEF5jk5tYLpl0/AQhCffP/ncAk+o1S4v/ZsWYILxdicO4g5
 34E1r6Jimf1F9UFWZwAoVJy4EQEI7IqsUXFgIuzT4KhwjNENN/56k4PcvK4+U9wmtH
 CIve19NNdWix7ZzdVD5FxMoy93A7/YokFBOc2ucg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1nN1Tf3Ini-00FzMx; Sat, 12
 Mar 2022 20:24:01 +0100
Date: Sat, 12 Mar 2022 20:23:48 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Message-ID: <YizzRKSDvHon83ks@latitude>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4dGDc1ulGkdHTd51"
Content-Disposition: inline
In-Reply-To: <20220206080016.796556-2-andreas@kemnade.info>
X-Provags-ID: V03:K1:O/HCc+HDKnwFzBvV8D7YKaDp+2sxe1jqC9CVwWViznBPNN7xWNG
 5G2h8HSNsT9FWHB+AtmX6EfpTuqRFDPXTehKmY4uCiu0hV334h2VcLXBUyFiqk41ROadDV7
 g1IvldVtoNvTTXbFhPfWSaPZYRsCyvZXHZBI66eAAWDmw8395cI7zelEuULsQ5AYBiJWGO/
 WiTVWTluht/pjXQ4RgGTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:prbK3F4RZ70=:3r+2cXhOkjhTzP4X/s6te/
 DZgqQ7J9M/6Ztf2sVYydQFqqnJKdZlJTQO19EzPa1QLmg8cdC54gCMzOD/b7OHjdyu83GMpDo
 B2p5sqzSsWw2kjFHtnAKHBwgTgwGhv2DL3FJIOU4JT1O6Q3TFqulk8PNxDpocZLHNzPcjm5KO
 /rXWnJh9Nh7Lx+a7/CUYq0LbXMfFX1HADoj39So/lUMRv6xa3BHylUaZVrdOrXMVso9yfx5bF
 OJ7GSrMQbzUeGaTWpIFxCdOQp0HZOCB6zFG1pzaW5RxSWRCG55tlvQyXUjz23GkW9Y4UYvqfa
 SX2caHf73EFyMbFPekQVMJsYCNpiuq0fGA632jw8z37ASuDxm8gcUp3bSoYuJ27KWBgc3BuW/
 g1N+Qk4T/JzazYebIXGHcDsiJP2XWgitysZMmS+arQ35ZLnz2XPJZYTpYjwSKNwEkbQlWpZ1A
 4NErdaJkmGJyqDgS8Lrra83i2j4Y9SlU9rQlsKRD9xJOqgYk/oexaMg6xbQFNHUl03sVEplUv
 QnDLMmKiTLMhFZZemg+QqbvK0DiF2rEa42ZlapL8jGRocn5AVgp/z99ua0aJZjgtv+xXAAUvO
 DxntoVvJ1+75OXHm958b4jawmSaiIRoQuweT7wmKJEsMvLaeyF6CfPOkZ+lzIHlJIjZktZBjk
 oR4ovpLIy7asdj6V8pc/giYQOiVmpp8WxNiYpxPHhYc4y3IKFuORE4EDfBMkEMHSObpMwxmMP
 AftfD9/mjIzIhGL5REzSLu5YfodY7amn9QjLJAs75Yf8zbqrhAWv9+DhZ0EJiuNrq3XulnzWz
 c8e/o8WeLgBIHd8eK8mhinpBSjOuYrenBTNFtK3KJV9Y2ZWwxH4+gq3xCDyQiZ5HHbDszkLiN
 88EOGoB47MOBaqJQKx/4d/6FKVfH+hBZAD/atDTE9iABwKz7Xyqh+UUarfDVwDDs6HTp4rLYD
 K2552pC4MXsC8jz9l6AJxbbcX90QNhd64r1Ne2uGh0PHN3amKMn4xDu3wDqXDzKLjLPhxgwqI
 +KTo2e/jSGitIm0QVeJOXE8L28K9Ye78G3VgfWuwDKuoKmlIMy3+27qsP6Om+RWl35wvyaHWD
 AxDzfE4Bba10Ak=
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 josua.mayer@jm0.eu, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4dGDc1ulGkdHTd51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andreas,

Sorry for the delay, I finally got around to having a look at the
patchset.

Some comments from skimming the patches below, and in my other replies.


On Sun, Feb 06, 2022 at 09:00:11AM +0100, Andreas Kemnade wrote:
> Add a binding for the Electrophoretic Display Controller found at least
> in the i.MX6.
> The timing subnode is directly here to avoid having display parameters
> spread all over the plate.
>=20
> Supplies are organized the same way as in the fbdev driver in the
> NXP/Freescale kernel forks. The regulators used for that purpose,
> like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> start a bunch of regulators of higher or negative voltage with a
> well-defined timing. VCOM can be handled separately, but can also be
> incorporated into that single bit.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc=
-epdc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.y=
aml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> new file mode 100644
> index 000000000000..7e0795cc3f70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
[...]
> +  - vscan-holdoff
> +  - sdoed-width
> +  - sdoed-delay
> +  - sdoez-width
> +  - sdoez-delay
> +  - gdclk-hp-offs
> +  - gdsp-offs
> +  - gdoe-offs
> +  - gdclk-offs
> +  - num-ce

These parameters should perhaps have sane defaults in the driver, and be
optional in the DT.


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6sl-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    epdc: epdc@20f4000 {
[...]
> +
> +        timing {
> +                clock-frequency =3D <80000000>;
> +                hactive =3D <1448>;
> +                hback-porch =3D <16>;
> +                hfront-porch =3D <102>;
> +                hsync-len =3D <28>;
> +                vactive =3D <1072>;
> +                vback-porch =3D <4>;
> +                vfront-porch =3D <4>;
> +                vsync-len =3D <2>;
> +        };
> +    };

The way you did it here, the timing parameters are directly under the
EPDC node in the DT, but I wonder if it would be better to have a
separate node for the display panel, which can then provide the timing
parameters either in the DT or in the panel driver (selected by compatible
string of the panel).


Jonathan

--4dGDc1ulGkdHTd51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIs8yAACgkQCDBEmo7z
X9tJ5hAAxertxtsQerEUdypFRk6tF6GZ7tpwhND2/arfmp7+/DAZ8Uq52gl8tHNN
gBfg99ukZ4HftCbcoPMLaqNi5K1nB6+igACg6tIuXj9GoTyniynnZjrcDT/0Hzhu
zEQQxUDcDIZc1JuqVmaE5nMyE+Tgpz4bHxZNqfSnYcvcqxaE1UHczrPZxblz80X0
ZDFBPYmgFKXKHbmQYaaODTpgDVMQ74EEuTSuWcPLqUEL68kQsYkrOnULAr5A5AhZ
ppFSj2C5AfAGRN3Qe08P7FEEi7SyhGC+iARK/wnLHkSNamYXgz8SVpKsgMnoZeal
QUnOft+ZkAyPIKBo3aDVpRfodPJ48s0gj1NhCarYr8cEuNsyZXfysoeRCGOiRlzp
8+B5zLoyh1FDrJVBL5ptNDlYWyqew6MnXgVnmt6rcgMKKVrJvZ8hTbMBEkV3ZsY1
vs/Se9Jyhhasow734cG2+2zt0IPhrO4m7/Zoeci2zNPmvj4ZtPYc8aTdXQx7RUl8
CLfX59/st5hWgVV2O/CY8tQUrjdLCXp0jHYYWIxoKprFh7ekNYdw/D8BqwNI5c+S
RUO5yw8Tu6Y/wVAsrHtn+E8m6mTI6B9yAxM7ltwY2/9svVsLcPO0UCLUSnDtFvlg
X5MGbxTMdPI4Kbz2rixXEIp3en0OobFSJctn9SLZWqXhXTzyQjs=
=lMbE
-----END PGP SIGNATURE-----

--4dGDc1ulGkdHTd51--
