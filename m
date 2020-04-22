Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F111B4D81
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 21:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CECB89E2B;
	Wed, 22 Apr 2020 19:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F6689E2B;
 Wed, 22 Apr 2020 19:40:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m14so2972349oic.0;
 Wed, 22 Apr 2020 12:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z8YCrPzH7bEfhD/XkAeainySJPOSuJ7nJpltH8wRYvo=;
 b=fGXoKh6T57S2HxtdpWtxldXTr8hO2ObOEaHE+j+3c/OqyamFwx7zL32Ai3r3qUyxfn
 TUWjeAVfZwu/W8HwJgJ0bbviaQoKcbXj43S1N0D85SWbciG81F2n0A9WG/pLEt3UAHUY
 m+Z9hR7kDBfrSGLeuWz7MIXaeVXKwxyaIqrnX940FpmlVY3Z3S0n1a8Fua7qfkCJwA1Y
 P5BKk9QxbGOWMt4CZpfxOaRs3ftE2bN9f3AiOj+gkcaA/WI5mP15JRijkNgkIvdHQEDD
 Si9zgsZ9gmrBUHWwBHSw0K6D/fsU9BMn92gw8zrqHa+eMDRkhzq7irWdy0apUznvy2BN
 +UnA==
X-Gm-Message-State: AGi0PuYgYDKWPrLC0zPwThv52pq5Dc5xjmMjsptcnXXrflSclgq7dO8r
 kwt+p8EsLOysOgoQ6uRGig==
X-Google-Smtp-Source: APiQypL5TS8AlWHNE3HLmqbpzzM0B1ncKTbOmg75+Dduyj7CjMKgq9i2LgrvXa8y3GvDgtAYhrVM5A==
X-Received: by 2002:aca:c3c1:: with SMTP id t184mr404747oif.171.1587584405664; 
 Wed, 22 Apr 2020 12:40:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x17sm45506oif.28.2020.04.22.12.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 12:40:05 -0700 (PDT)
Received: (nullmailer pid 4724 invoked by uid 1000);
 Wed, 22 Apr 2020 19:40:04 -0000
Date: Wed, 22 Apr 2020 14:40:04 -0500
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v11 2/2] dt-bindings: documenting compatible string
 vendor "visionox"
Message-ID: <20200422194004.GA2197@bogus>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-3-harigovi@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Apr 2020 10:25:08 +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> Changes in v11:
> 	- Added visionox compatible string in vendor-prefixes.yaml
> 	- Added as a part of checkpatch script error for panel driver.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:visionox,.*: {'description': 'Visionox'} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:visionox,.*: 'not' is a required property

Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/vendor-prefixes.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/vendor-prefixes.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/vendor-prefixes.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error in schema: patternProperties: visionox,.*
warning: no schema found in file: Documentation/devicetree/bindings/vendor-prefixes.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error in schema: patternProperties: visionox,.*
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1273941

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
