Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E29211C5E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338A66E0FF;
	Thu,  2 Jul 2020 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652896E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A4EB4FB03;
 Thu,  2 Jul 2020 09:05:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkiwlLoqLj9N; Thu,  2 Jul 2020 09:05:14 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id C52E144F51; Thu,  2 Jul 2020 09:05:10 +0200 (CEST)
Date: Thu, 2 Jul 2020 09:05:10 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] MAINTAINERS: Update entry for st7703 driver after the
 rename
Message-ID: <20200702070510.GA3275@bogon.m.sigxcpu.org>
References: <20200701184640.1674969-1-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701184640.1674969-1-megous@megous.com>
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej,
On Wed, Jul 01, 2020 at 08:46:40PM +0200, Ondrej Jirman wrote:
> The driver was renamed, change the path in the MAINTAINERS file.
> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  MAINTAINERS | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f186a661a9b..f5183eae08df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5487,12 +5487,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
>  =

> -DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
> +DRM DRIVER FOR SITRONIX ST7703 PANELS
>  M:	Guido G=FCnther <agx@sigxcpu.org>
>  R:	Purism Kernel Team <kernel@puri.sm>
> +R:	Ondrej Jirman <megous@megous.com>
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
txt
> -F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
yaml
> +F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

Thanks,
 -- Guido

>  =

>  DRM DRIVER FOR SAVAGE VIDEO CARDS
>  S:	Orphan / Obsolete
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
