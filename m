Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E695423417D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2D86EA19;
	Fri, 31 Jul 2020 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8391A6EA19
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 24B66FB04;
 Fri, 31 Jul 2020 10:48:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBDVOmHfYedR; Fri, 31 Jul 2020 10:48:20 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id ADBF44537D; Fri, 31 Jul 2020 10:48:19 +0200 (CEST)
Date: Fri, 31 Jul 2020 10:48:19 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 4/5] MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
Message-ID: <20200731084819.GB12560@bogon.m.sigxcpu.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731081836.3048-5-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-5-laurentiu.palcu@oss.nxp.com>
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
Cc: linux-imx@nxp.com, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 31, 2020 at 11:18:32AM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> =

> The driver is part of DRM subsystem and is located in drivers/gpu/drm/imx=
/dcss.
> =

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c669c07fa35..1a22038f2869 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12281,6 +12281,14 @@ F:	drivers/iio/gyro/fxas21002c_core.c
>  F:	drivers/iio/gyro/fxas21002c_i2c.c
>  F:	drivers/iio/gyro/fxas21002c_spi.c
>  =

> +NXP i.MX 8MQ DCSS DRIVER
> +M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +R:	Lucas Stach <l.stach@pengutronix.de>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> +F:	drivers/gpu/drm/imx/dcss/
> +
>  NXP SGTL5000 DRIVER
>  M:	Fabio Estevam <festevam@gmail.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
