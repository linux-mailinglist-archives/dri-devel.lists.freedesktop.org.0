Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC245C8BC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EFD6E9BF;
	Wed, 24 Nov 2021 15:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 550 seconds by postgrey-1.36 at gabe;
 Wed, 24 Nov 2021 15:32:18 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC766EA14
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:32:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211124152307euoutp02368216f1b8ec67e9f911cd6ca78dd322~6hMLmvdAU1202412024euoutp02H
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:23:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211124152307euoutp02368216f1b8ec67e9f911cd6ca78dd322~6hMLmvdAU1202412024euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637767387;
 bh=2ynWpYwQ987eCbBiqQjZnbNjOsKl3jbANWvNadswtGo=;
 h=Date:Subject:To:From:In-Reply-To:References:From;
 b=mr1SAdAyR3hxxSQForY4AqlvBxnf95I0q13xeUQdkZeMF1OKENLnO35eTXE7uVnZ0
 X2YWM47XOzyG3k5pK1O1voHDOfRcsYYazmPxHSJhyT7nC91xn/dGyKXFVWoKjUO2oY
 d7xYnxL/IpDirKQpYMUZyTvaioH7okd9e/jknF9M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211124152306eucas1p180a26aa8b63b897fd27a63c67fc424ee~6hMLRUAdp3072530725eucas1p16;
 Wed, 24 Nov 2021 15:23:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4A.E7.10260.AD85E916; Wed, 24
 Nov 2021 15:23:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211124152306eucas1p115447d63dd410079cbbfd303d7ef1229~6hMKmi_8Z0295502955eucas1p1V;
 Wed, 24 Nov 2021 15:23:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211124152306eusmtrp2d4f19c5a1f3e99eec24f8a26c8eb1b3d~6hMKl4HPR0066700667eusmtrp2S;
 Wed, 24 Nov 2021 15:23:06 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-11-619e58dab2b0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 60.8E.09404.9D85E916; Wed, 24
 Nov 2021 15:23:05 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211124152305eusmtip13a24ac24911721fb1fa37ff7f694a2ff~6hMKHIqUB3211932119eusmtip1a;
 Wed, 24 Nov 2021 15:23:05 +0000 (GMT)
Message-ID: <b378e3ab-3d1f-7509-b218-71377ef012b3@samsung.com>
Date: Wed, 24 Nov 2021 16:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] MAINTAINERS: Update email of Andrzej Hajda
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211018211353.586986-1-andrzej.hajda@intel.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djPc7q3IuYlGkzs1ra4v/gzi8WVr+/Z
 LG4eWsFocXnXHDaLng1bWS3WHrnL7sDmsXjPSyaP+93HmTz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoErY91274IvYhUr/6xhbmDcI9zFyMEhIWAiMWseTxcjF4eQwApGid3rprNBOF8YJb6d
 3s4C4XxmlPjaeJW1i5ETrONr60pWiMRyRoktK85AtXxklJh/tYsFpIpXwE7iwYH57CA2i4Cq
 xPY3n5gh4oISJ2c+AasRFUiSmHBiNxPIHcIC9hL9n21BwswC4hK3nsxnApkpIvCVUWJl73yw
 ejYBQ4neo32MIDYn0PwX03vZIRrkJZq3zmYGaZAQOMIh8esnxGIJAReJC88fMELYwhKvjm+B
 istI/N8JsUFCoJlRomf3bXYIZwKjxP3jC6A6rCXunPvFBnIes4CmxPpd+hBhR4m/y6awQUKP
 T+LGW0GII/gkJm2bzgwR5pXoaBOCqFaR+L1qOhOELSXR/eQ/C4TtITH71HrmCYyKs5CCZRaS
 /2cheW0Wwg0LGFlWMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBKab0/+Of93BuOLVR71D
 jEwcjIcYJTiYlUR4ry2ZnSjEm5JYWZValB9fVJqTWnyIUZqDRUmcV+RPQ6KQQHpiSWp2ampB
 ahFMlomDU6qBqehd8NH7e5uNv0YKvj+7vba2fcaVoMW8Qmnm3CssGTkS765+/vAEW7tKrc2+
 ezNrPExP3ZqrtmfdauOElnPuCxZULn92lfvWRfeze89eOR3qp6rtPjX+k833c7nBO2f15ZjK
 iST5ePcrCt1NX7TIPCzOp4+V6ccalycvr0k0TDv/oO5lqvKKw7/OaxuuixY+qLP+SrrAbMci
 rbjZxy2jG8OOlpuI58/mWfFv2sKWJb9ObVZhr1j3/136sSNWnv33lTxeGp+JSv2a+3xOS21F
 rTWfUMmkaTIC1c6Bk0/3B4Xd0l077aV9ezXro1s7j13TN0r+slpWhyP48ykLu54DDgEXo75k
 flvM3D1ThGWPkxJLcUaioRZzUXEiAMGt7yymAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7o3I+YlGmydbWVxf/FnFosrX9+z
 Wdw8tILR4vKuOWwWPRu2slqsPXKX3YHNY/Gel0we97uPM3n0bVnF6PF5k1wAS5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrrt3gVfxCpW/lnD
 3MC4R7iLkZNDQsBE4mvrStYuRi4OIYGljBLLP29n62LkAEpIScxvUYKoEZb4c62LDaLmPaPE
 1ulnWEESvAJ2Eg8OzGcHsVkEVCW2v/nEDBEXlDg58wkLiC0qkCTx9EAn2ExhAXuJ/s+2IGFm
 AXGJW0/mM4HMFBH4ziix8NN/JogFExkl3uxsYgSpYhMwlOg92gdmcwItezG9lx1kELOAusT6
 eUIQg+QlmrfOZp7AKDgLyepZSHbMQuiYhaRjASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxN
 jMAY2nbs55YdjCtffdQ7xMjEwXiIUYKDWUmE99qS2YlCvCmJlVWpRfnxRaU5qcWHGE2B3p/I
 LCWanA+M4rySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqaWUyaR
 pff39TfLv5vPuldFZaZot9rN5nvhUjMmx7GvTDEPmJE1t+GpVIGoC4+M1K7/64y2ux0W2V0w
 g/3MGdMfTPxHOBmveU2zutYWecjFz3f2vbRrBT5Lp1w+K5V3XWNy+f2+vUv7eHlPR2nwb4jP
 9lv3cl3Ng4Disw3zDZgc15tnzWC3l1god0e2NMVp5td7u9Z3f3Y3Cv80Q2/z/aNhfLGq8s8P
 fHl3+mBBZYuCw0M/4QKeng2dnDteitduZvuvkvSId9fxuuT6QuMJf97O41DcbX3MUSuES0/q
 ocV6nZkhjRb8ghu/VSYUKbrdfqe55cXq0+Vvs5rKjn5157qUvyjr6ANGe22NjcJWvkosxRmJ
 hlrMRcWJAOTfYh4qAwAA
X-CMS-MailID: 20211124152306eucas1p115447d63dd410079cbbfd303d7ef1229
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018211442eucas1p1e5f7eb08c6b76c76dcfad2c2efc1da4e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018211442eucas1p1e5f7eb08c6b76c76dcfad2c2efc1da4e
References: <CGME20211018211442eucas1p1e5f7eb08c6b76c76dcfad2c2efc1da4e@eucas1p1.samsung.com>
 <20211018211353.586986-1-andrzej.hajda@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.10.2021 23:13, Andrzej Hajda wrote:
> Beside updating email, the patch updates maintainers
> of Samsung drivers.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  .mailmap    |  1 +
>  MAINTAINERS | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 4f6e37da60589..4283a86f70d26 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -40,6 +40,7 @@ Andrew Vasquez <andrew.vasquez@qlogic.com>
>  Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
>  Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
> +Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
>  Andy Adamson <andros@citi.umich.edu>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54cd05d3aab65..e3fadb4ebced3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2546,7 +2546,7 @@ N:	s3c64xx
>  N:	s5pv210
>  
>  ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Łukasz Stelmach <l.stelmach@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -2570,7 +2570,8 @@ S:	Maintained
>  F:	drivers/media/platform/s5p-jpeg/
>  
>  ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> @@ -6254,7 +6255,7 @@ F:	Documentation/devicetree/bindings/display/atmel/
>  F:	drivers/gpu/drm/atmel-hlcdc/
>  
>  DRM DRIVERS FOR BRIDGE CHIPS
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  M:	Neil Armstrong <narmstrong@baylibre.com>
>  M:	Robert Foss <robert.foss@linaro.org>
>  R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> @@ -16748,13 +16749,15 @@ F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
>  F:	drivers/nfc/s3fwrn5

>  SAMSUNG S5C73M3 CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5c73m3/*
>  SAMSUNG S5K5BAF CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/i2c/s5k5baf.c

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
