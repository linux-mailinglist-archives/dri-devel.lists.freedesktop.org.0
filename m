Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA62DAEE0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EA189364;
	Tue, 15 Dec 2020 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BA889364
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:26:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i6so19503052otr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Di6e3zk8oS0etbJqpgGcmuo1HcvG/3ApCGRJweCbZeQ=;
 b=ihxUPwBm8jUQwqJU/7uym6PaN9HLefT2D8LikLZwa9GG1CmxKoubD9VinDE/MkAIvp
 Wc2yIU7greYCpUtPrueWraR2oSoiaoiL1WtONlmsYgpF9E9XNSL/gsSDHcRCPjN11S+o
 1ouNKhknBfFG/fvgj7U8ogZCJn+IIlU75o8Z3UgqWQLOkB0igUr8jiv3LpNWGS3zzE11
 DXW3nhG+63uuV/PoDA4tS+KOtq4EG0Ud3rHnJ/d5kVDz7VlvGcHV5WpjkUH4NL3/yM6a
 SugD7FAhZO1qHb8ZqtHZA8bMCQIUAypAZ9MOQCx9hB/J/0Ef4xpag0NGwQQt1asFSCUo
 ePGw==
X-Gm-Message-State: AOAM533eeZy7/rKtYgL4dPkc8nDnFzEP8oZAwUHdJrN2bqnU1vD86GFQ
 tvmfbsVjq5mzhm6JBNLvpw==
X-Google-Smtp-Source: ABdhPJw8GOO5HxCZiUJSYpWvX2zTLsjXdnSUVTmlo5MeXq8qJNOimO3I5K6K1qJBB+tvfodBRdF1Og==
X-Received: by 2002:a9d:4c8d:: with SMTP id m13mr21008336otf.229.1608042370869; 
 Tue, 15 Dec 2020 06:26:10 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z6sm4690069ooz.17.2020.12.15.06.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:26:09 -0800 (PST)
Received: (nullmailer pid 3775382 invoked by uid 1000);
 Tue, 15 Dec 2020 14:26:07 -0000
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20201215124227.1872-1-peter.ujfalusi@ti.com>
References: <20201215124227.1872-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358768: Remove maintainer
 information
Date: Tue, 15 Dec 2020 08:26:07 -0600
Message-Id: <1608042367.307112.3775381.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Dec 2020 14:42:27 +0200, Peter Ujfalusi wrote:
> My employment with TI is coming to an end and I will not have access to
> the board where this bridge is connected to.
> 
> It is better to remove a soon bouncing email address.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml   | 3 ---
>  1 file changed, 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml: 'maintainers' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml

See https://patchwork.ozlabs.org/patch/1416419

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
