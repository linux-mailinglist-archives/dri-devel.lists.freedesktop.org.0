Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47C1C79B5
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 20:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B276E8C3;
	Wed,  6 May 2020 18:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3976E8C3;
 Wed,  6 May 2020 18:56:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7B2FE804F6;
 Wed,  6 May 2020 20:56:06 +0200 (CEST)
Date: Wed, 6 May 2020 20:56:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v12 2/2] dt-bindings: documenting compatible string
 vendor "visionox"
Message-ID: <20200506185559.GA8227@ravnborg.org>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200429054515.4976-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429054515.4976-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8 a=e5mUnYsNAAAA:8
 a=yl7qcXnr7a4LJ7TjansA:9 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 11:15:15AM +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Thanks, applied.

	Sam

> ---
> Changes in v11:
> 	- Added compatible string in vendor-prefix yaml file
> 
> Changes in v12:
> 	- Fixed the string to clear dt_binding_check errors.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 66a7382add95..1c86ebbeae20 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1047,6 +1047,8 @@ patternProperties:
>      description: Tronsmart
>    "^truly,.*":
>      description: Truly Semiconductors Limited
> +  "^visionox,.*":
> +    description: Visionox
>    "^tsd,.*":
>      description: Theobroma Systems Design und Consulting GmbH
>    "^tyan,.*":
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
