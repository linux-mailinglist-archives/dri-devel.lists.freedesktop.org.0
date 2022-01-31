Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A64A4CF9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 18:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFC010E146;
	Mon, 31 Jan 2022 17:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4310E264
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 17:18:38 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nEaJx-0007vn-BQ; Mon, 31 Jan 2022 18:18:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH] dt-bindings: ltk050h3146w: replace Heiko Stuebner by
 myself as maintainer
Date: Mon, 31 Jan 2022 18:18:28 +0100
Message-ID: <4194940.gPueJrmO9C@diego>
In-Reply-To: <20220131165439.717713-1-quentin.schulz@theobroma-systems.com>
References: <20220131165439.717713-1-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <foss+kernel@0leil.net>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 31. Januar 2022, 17:54:39 CET schrieb quentin.schulz@theobroma-systems.com:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Heiko does not work at Theobroma Systems anymore and the boards using
> those panels are downstream, maintained internally by the company, so
> let's relieve Heiko of maintainership duties.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> index 63d2a00348e9..a40ab887ada7 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Leadtek LTK050H3146W 5.0in 720x1280 DSI panel
>  
>  maintainers:
> -  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> +  - Quentin Schulz <quentin.schulz@theobroma-systems.com>
>  
>  allOf:
>    - $ref: panel-common.yaml#
> 




