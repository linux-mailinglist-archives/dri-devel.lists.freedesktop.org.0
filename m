Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5A302BB6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE09F6E0CD;
	Mon, 25 Jan 2021 19:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50286E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:35:50 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 63so13933210oty.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OauOcSb/fHxVVdQrMG7tG8Z48E9h3ry+EbDmqm+9VYA=;
 b=eOWfEJFlZkbCKA17vaN7SvAd2/MC43exmM1HbTYMYWKuPM9TqLeO4LJWTmklOBbMpr
 VSmI4E+tS5JmNgJSf+M0iYMkovHc5vHPVZDbsbyFNylj0D8in4n26r1gr6FkoBgwXhP7
 DoNVlyKbRMFxE0HUupx0c1sziWtiFD559564+eD9/zlwNfcLFiBQjdZg6jEsagvCyctA
 777AO1lN07Gg7bxRe0JnJhxEA85zCjQ7gy7S5fa4jW7yFYXZCsEdLW33GasJSqRP39hI
 etiD2zL7XSokmh4w0WH5GrG2lFa1KProlpbAgxKdo/tVF+THXv//NLJtxp3jer4KSLsk
 4wiA==
X-Gm-Message-State: AOAM530uyST0U0/zM10iFksIx6V/35rzeJYBuWJOFi63dMBkwlGDcgZW
 X0UrzVGetJXyZRay1FjtqA==
X-Google-Smtp-Source: ABdhPJyr/h9AMGbSIK7K4NzU9OGvK66wej0PW5UdDzKiIGjcVOBKc5aBylhcbh7sXJuoU/CjEhIHrg==
X-Received: by 2002:a05:6830:2414:: with SMTP id
 j20mr1513500ots.326.1611603349932; 
 Mon, 25 Jan 2021 11:35:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r5sm2430411otd.24.2021.01.25.11.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:35:48 -0800 (PST)
Received: (nullmailer pid 829406 invoked by uid 1000);
 Mon, 25 Jan 2021 19:35:47 -0000
Date: Mon, 25 Jan 2021 13:35:47 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 21/24] dt-bindings: display: mediatek: update mediatek,
 dpi.yaml reference
Message-ID: <20210125193547.GA829138@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021 11:59:22 +0100, Mauro Carvalho Chehab wrote:
> Changeset 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
> renamed: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> to: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
> 
> Update its cross-reference accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
