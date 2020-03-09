Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F017E614
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 18:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300489FC3;
	Mon,  9 Mar 2020 17:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43189FC3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 17:51:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 08D1680611;
 Mon,  9 Mar 2020 18:51:09 +0100 (CET)
Date: Mon, 9 Mar 2020 18:51:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: add ITE vendor
Message-ID: <20200309175108.GA4841@ravnborg.org>
References: <20200309153654.11481-1-ple@baylibre.com>
 <20200309153654.11481-2-ple@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309153654.11481-2-ple@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ns9eNvu6AAAA:8
 a=IpJZQVW2AAAA:8 a=7gkXJVJtAAAA:8 a=qPfvrsSIRTZQNikgLP0A:9
 a=CjuIK1q_8ugA:10 a=LZLx1i01EnjtqRv10NxV:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, narmstrong@baylibre.com,
 airlied@linux.ie, heiko.stuebner@theobroma-systems.com, jonas@kwiboo.se,
 a.hajda@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Phong.

On Mon, Mar 09, 2020 at 04:36:52PM +0100, Phong LE wrote:
> Add ITE Tech Inc. prefix "ite" in vendor-prefixes
Maybe add to the changelog that their domain is http://www.ite.com.tw/?

> 
> Signed-off-by: Phong LE <ple@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 9e67944bec9c..16d4c776fdc7 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -469,6 +469,8 @@ patternProperties:
>      description: Intersil
>    "^issi,.*":
>      description: Integrated Silicon Solutions Inc.
> +  "^ite,.*":
> +    description: ITE Tech Inc.
>    "^itead,.*":
>      description: ITEAD Intelligent Systems Co.Ltd
>    "^iwave,.*":
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
