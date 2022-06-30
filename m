Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5481562687
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 01:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3710E245;
	Thu, 30 Jun 2022 23:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED8D10E245
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 23:18:12 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l24so662533ion.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9gNUQLHFQPHo0E6Bk43UyIkswDGTVgKImpHtKfx0xvg=;
 b=6cJdQTSonBEr2BZ06fHjq+lAza68IGPTYq4R3TpCp1LBFOkXVsOPFop+w1mnRZTeD4
 W2nFnTRYv9jTrqg4+O+A38k58YhOdZf+AW7Wb5fgxjQikHB13jkl2rgXc8nSpMhHkCV7
 pXSbZu4wo9VSIA9JEgTsC0i/xAiNMYtFQwHurdM3fHBTR8F/VUdplj/hD+d3FjQDRmjM
 qEPuNqkCZGO0mkSAVXxh9v4s79XkhmxCkKY/slvoFiWi9rL0rsrmsWmDTP1ErE2/3pm4
 dxh9n30Jg3Q0G4nN4i9ADjD4rGbNJ61WD6kokRiGQLDOYUl7hGmtHgKBXbrcwPyN+uxI
 l/Ew==
X-Gm-Message-State: AJIora9bb2/zWTe+5vEzYtF+mY8iAJsmLfRcB7ShpgtYFUmWiwT/aMoE
 EWhJggb8vgw+2YnBpX8jlw==
X-Google-Smtp-Source: AGRyM1su16XuZ3P1C/gSpnPqv5Wj9auvAHesaclQYdz2S96RxT7/OA1S+mZcS20iiJlEwB9ke8UXdg==
X-Received: by 2002:a05:6638:410e:b0:33c:d3b8:a4bd with SMTP id
 ay14-20020a056638410e00b0033cd3b8a4bdmr6441419jab.264.1656631091659; 
 Thu, 30 Jun 2022 16:18:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a92cb08000000b002d900368a19sm8478492ilo.22.2022.06.30.16.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 16:18:11 -0700 (PDT)
Received: (nullmailer pid 3516208 invoked by uid 1000);
 Thu, 30 Jun 2022 23:18:09 -0000
Date: Thu, 30 Jun 2022 17:18:09 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?77+977+977+9zrHvv70vVGl6ZW4gUGxhdGZvcm0gTGFiKFNSKS/vv73vvLo=?=
 =?utf-8?B?77+977+977+977+9?= <inki.dae@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to
 credits
Message-ID: <20220630231809.GA3514176-robh@kernel.org>
References: <CGME20220626163558epcas1p3f525431b9fb237bd420ad1453daaf1ac@epcas1p3.samsung.com>
 <20220626163320.6393-1-krzysztof.kozlowski@linaro.org>
 <0de401d88c38$23aeb8e0$6b0c2aa0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0de401d88c38$23aeb8e0$6b0c2aa0$@samsung.com>
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
Cc: 'Vinod Koul' <vkoul@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 'David Airlie' <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Kyungmin Park' <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 'Kishon Vijay Abraham I' <kishon@ti.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, 'Alim Akhtar' <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 01:16:14PM +0900, ���α�/Tizen Platform Lab(SR)/�Ｚ���� wrote:
> 
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> > Sent: Monday, June 27, 2022 1:33 AM
> > To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> > <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; David
> > Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring
> > <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar
> <alim.akhtar@samsung.com>;
> > Kishon Vijay Abraham I <kishon@ti.com>; Vinod Koul <vkoul@kernel.org>;
> > linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-phy@lists.infradead.org
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Subject: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to
> > credits
> > 
> > Emails to Joonyoung Shim bounce ("550 5.1.1 Recipient address rejected:
> > User unknown"), so move him to credits file.
> > 
> 
> Applied.

Both patches or just this one?
