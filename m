Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426A215331
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68656E36F;
	Mon,  6 Jul 2020 07:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECAF89186
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593948618; bh=nHfOIwXc+Zz/lwPPI+EBR9cQnyaeOaO4WMoyx4yZ8qc=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=TEKWJPO4rNp+Rawce4HThyB16qKwHLkiusLO/vjFr0IN0+E2OSCrL8cSz0eMGQPM3
 2F4oaHSVqfrsD4+DjXMl0+ALgaVcsiF5pbbqSeSWvCwDoBp8vbMOPyC+LKi1KiAf5f
 tTZve66RLFVZWTMYZ4G/rWsSRmdZabyyArlxkQYc=
Date: Sun, 5 Jul 2020 13:30:17 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust entry to renaming and conversion
Message-ID: <20200705113017.mostxjvatkqkhqf6@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
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
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lukas,

On Sun, Jul 05, 2020 at 08:59:17AM +0200, Lukas Bulwahn wrote:
> Commit a74e81a56405 ("drm/panel: rocktech-jh057n00900: Rename the driver =
to
> st7703") and commit 7317f4574492 ("dt-bindings: panel: Convert
> rocktech,jh057n00900 to yaml") renamed and converted the files mentioned =
in
> DRM DRIVER FOR ROCKTECH JH057N00900 PANELS, but did not adjust the entries
> in MAINTAINERS.

A similar patch was already posted:

https://lkml.kernel.org/lkml/20200701184640.1674969-1-megous@megous.com/

thank you and regards,
	o.

> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
> =

>   warning: no file matches  F: \
>   Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
>   warning: no file matches  F: \
>   drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> =

> Adjust entries after this file renaming and devicetree conversion.
> =

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20200703
> =

> Ondrej, please ack this patch.
> Sam, please pick this minor non-urgent patch into your -next tree.
> =

> This is the minimal change to address the warning. You might consider
> changing the name of the section from ROCKTECH to ST7703, change
> maintainers etc.
> =

>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9375edaef11f..8a7b92faff99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5493,8 +5493,8 @@ DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
>  M:	Guido G=FCnther <agx@sigxcpu.org>
>  R:	Purism Kernel Team <kernel@puri.sm>
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
txt
> -F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
yaml
> +F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
>  =

>  DRM DRIVER FOR SAVAGE VIDEO CARDS
>  S:	Orphan / Obsolete
> -- =

> 2.17.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
