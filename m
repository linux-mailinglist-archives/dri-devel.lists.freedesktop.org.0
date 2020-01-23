Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED514706E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 19:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA996E10A;
	Thu, 23 Jan 2020 18:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB86E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:06:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F25A020031;
 Thu, 23 Jan 2020 19:06:04 +0100 (CET)
Date: Thu, 23 Jan 2020 19:06:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: add vendor prefix for logic
 technologies limited
Message-ID: <20200123180603.GB17233@ravnborg.org>
References: <20200120080100.170294-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120080100.170294-1-marcel@ziswiler.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=m8ToADvmAAAA:8
 a=6h0QpovlAAAA:8 a=k76NmfXvAAAA:8 a=VwQbUJbxAAAA:8 a=5161Qnb4PEtQmF6y4tUA:9
 a=_A8lN0e7biOy-kDP:21 a=1vGcD8wBxvxDrBQY:21 a=CjuIK1q_8ugA:10
 a=kCrBFHLFDAq2jDEeoMj9:22 a=UMgBrLottiFGRxIVDUvr:22
 a=xklTzJp5TIrWR6y8xC-k:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, j.bauer@endrich.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philippe Schenker <philippe.schenker@toradex.com>, info@logictechno.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marcel.

On Mon, Jan 20, 2020 at 09:00:58AM +0100, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Add vendor prefix for Logic Technologies Limited [1] which is a Chinese
> display manufacturer e.g. distributed by German Endrich Bauelemente
> Vertriebs GmbH [2].
> 
> [1] https://logictechno.com/contact-us/
> [2] https://www.endrich.com/isi50_isi30_tft-displays/lt170410-1whc_isi30
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks for the quick revision.
All three patches applied to drm-misc-next.

I applied patch 2 by hand due to conflicts caused
by another patch I added just minutes ago.

	Sam

> 
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Added Philippe's reviewed-by.
> - Added Rob's acked-by.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f9b84f24a382..ac4804d0a991 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -549,6 +549,8 @@ patternProperties:
>      description: Linear Technology Corporation
>    "^logicpd,.*":
>      description: Logic PD, Inc.
> +  "^logictechno,.*":
> +    description: Logic Technologies Limited
>    "^longcheer,.*":
>      description: Longcheer Technology (Shanghai) Co., Ltd.
>    "^lsi,.*":
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
