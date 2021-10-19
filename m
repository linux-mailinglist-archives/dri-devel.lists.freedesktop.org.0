Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2AF432D4A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 07:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF06E102;
	Tue, 19 Oct 2021 05:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484EE6E102
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:35:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211019053546euoutp022b55302b3dfdb4eb3f79ea62c5009898~vV9FVzIAy1927219272euoutp02b
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:35:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211019053546euoutp022b55302b3dfdb4eb3f79ea62c5009898~vV9FVzIAy1927219272euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1634621746;
 bh=7xcO5JV0kObMR4VAd9oZrFlEXLTbEsGns7GhxLpsHiw=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=twYm7btS0lmZHoKUETn/9TINwKHX2K0XL4RyoHQD2SzqwzRDWy67uXhYbtYsx/tDp
 1vUgm7vrtIfDy2O9qmwZZ1BLzgIFzUtCp+7TE76y2SMkU9lNL1w6bwpkx1ZtCzXU6x
 mtRfnk6QJbKzIklo2anmVTLv8voEtGb/L6mDbYy4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211019053545eucas1p2b94bb1c0a99823450fd88bc34fbb189a~vV9E78NNU2182521825eucas1p20;
 Tue, 19 Oct 2021 05:35:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 68.E0.45756.1395E616; Tue, 19
 Oct 2021 06:35:45 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211019053544eucas1p1aeeea0b56adc91ae8a7a0d04780f3c51~vV9EBDYWp0846008460eucas1p1T;
 Tue, 19 Oct 2021 05:35:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211019053544eusmtrp1f7c43c944b3ced3651493cb9646c4d2b~vV9EAYNB-0545005450eusmtrp12;
 Tue, 19 Oct 2021 05:35:44 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-e6-616e59317947
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 57.AA.20981.0395E616; Tue, 19
 Oct 2021 06:35:44 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211019053544eusmtip110f8a0bc67c5120ce8e9cf1451f1f656~vV9DhDciJ2293722937eusmtip14;
 Tue, 19 Oct 2021 05:35:44 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: Update email of Andrzej Hajda
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b2fb88db-009e-4b38-dc3d-5ce9163257de@samsung.com>
Date: Tue, 19 Oct 2021 07:35:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018211353.586986-1-andrzej.hajda@intel.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87qGkXmJBnNPmFjcX/yZxeLK1/ds
 FjcPrWC0uLxrDptFz4atrBaH37SzOrB5LN7zksnjfvdxJo++LasYPT5vkgtgieKySUnNySxL
 LdK3S+DKODtpMmvBK/GKx2+PsTUwfhfuYuTkkBAwkTjyajpbFyMXh5DACkaJVRt3MUE4Xxgl
 pnXvZodwPjNKTD7zlh2mZdrXI1BVyxklNv3eBtX/kVGi9dp21i5GDg5hAXuJ/s+2IHERga+M
 Et/6HrOBdLMJGEp0ve0Cs3kF7CR+rvzCBGKzCKhKdOzfCLZBVCBZYtrfJmaIGkGJkzOfsIDY
 nED1L6b3gtUwC8hLNG+dzQxhi0vcejIf7CIJgSMcEu0bQI4AOdVFonXbeRYIW1ji1fEtUC/I
 SJye3MMC0dDMKPHw3Fp2CKeHUeJy0wxGiCpriTvnfrGBvMMsoCmxfpc+iCkh4Cjx4io3hMkn
 ceOtIMQNfBKTtk1nhgjzSnS0CUHMUJOYdXwd3NaDFy4xQ9geEj/b7rJPYFScheTLWUg+m4Xk
 s1kIJyxgZFnFKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmHBO/zv+aQfj3Fcf9Q4xMnEw
 HmKU4GBWEuFNcs1NFOJNSaysSi3Kjy8qzUktPsQozcGiJM67avaaeCGB9MSS1OzU1ILUIpgs
 EwenVAOTd3aMzZakE3vZuV3jp29Zlh54q2xz0sRlFUuVxOViZDQK/hiGe2WohFs+XMxt//Gu
 Ovvp8tPXMwPf/Vyf1PvqqNlvaf4L5Slrbl8r6ljX8e62/uVvj+MrHUpVuS9Mjg7dz7XVZ1dU
 16s0T1uVAHP5qH/KkYe0l5+ZaP3uwjoPT072FfIfap/u9Xm7pfxnR2ei654PS6xvxc1M23Dv
 83H3WW+vtj/l1QpbIaDQVRT+rS6m4Nna1yse9z/axdkXtekZb9jSii1Vwr8L2u++6e89tPtw
 qFVpbtCP9MqahIZT2QeFYw3rf2hsj94faP5z4h9Rnr5D/EIeDovfM674eONv1aaLWcsL2Jx1
 dv5t3XZHiaU4I9FQi7moOBEAUqC6PqcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsVy+t/xu7oGkXmJBsuPG1jcX/yZxeLK1/ds
 FjcPrWC0uLxrDptFz4atrBaH37SzOrB5LN7zksnjfvdxJo++LasYPT5vkgtgidKzKcovLUlV
 yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLODtpMmvBK/GKx2+P
 sTUwfhfuYuTkkBAwkZj29QhTFyMXh5DAUkaJUxtus0EkZCROTmtghbCFJf5c62KDKHrPKHGg
 uQ2og4NDWMBeov+zLUhcROA7o8SZ/WcYIYomMkrcvPWPEaSbTcBQouttF9hUXgE7iZ8rvzCB
 2CwCqhId+zeyg9iiAskSb19/Z4KoEZQ4OfMJC4jNCVT/YnovWA2zgJnEvM0PmSFseYnmrbOh
 bHGJW0/mM01gFJyFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzCW
 th37uWUH48pXH/UOMTJxMB5ilOBgVhLhTXLNTRTiTUmsrEotyo8vKs1JLT7EaAr0z0RmKdHk
 fGA055XEG5oZmBqamFkamFqaGSuJ85ocWRMvJJCeWJKanZpakFoE08fEwSnVwMRy9dYcDotj
 Tx+J3lSSiO+8pHMwOajkz7HrnJbP+kI3yrnYfa2tPmzSXp59XqpkXrDsa03VhM11nYetg7tv
 rtzqxSkl1vdb0kOu6K/Ole2rt9VN3L0uzOvpnM35GjN/iGuyqtw7dHZxicPlSa5mO1WevXJ7
 InyiZVFKq/d93U+v/Ow5DHX/M/728+JW3RHyR9Xglf+Zj9Jz6hVntRz4eDw/ze7XLo6c5u13
 F81ZU3zViEmvk22Vme6ZezsmXHWT2mS7u1bd6SbTxMfT5fuXqhjUz2kM8rbbmr5XNVTawMfZ
 9NWzLZfKX+5atv4my9uE9Fl7E51bJjpauFw7/zwry8oyNTYiK//EibJvH41SbiqxFGckGmox
 FxUnAgBVmH+lLgMAAA==
X-CMS-MailID: 20211019053544eucas1p1aeeea0b56adc91ae8a7a0d04780f3c51
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018211442eucas1p21c772bca79502733c000b853c79c10c8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018211442eucas1p21c772bca79502733c000b853c79c10c8
References: <CGME20211018211442eucas1p21c772bca79502733c000b853c79c10c8@eucas1p2.samsung.com>
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
>   .mailmap    |  1 +
>   MAINTAINERS | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index 4f6e37da60589..4283a86f70d26 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -40,6 +40,7 @@ Andrew Vasquez <andrew.vasquez@qlogic.com>
>   Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
>   Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
>   Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>
> +Andrzej Hajda <andrzej.hajda@intel.com> <a.hajda@samsung.com>
>   Andy Adamson <andros@citi.umich.edu>
>   Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
>   Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54cd05d3aab65..e3fadb4ebced3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2546,7 +2546,7 @@ N:	s3c64xx
>   N:	s5pv210
>   
>   ARM/SAMSUNG S5P SERIES 2D GRAPHICS ACCELERATION (G2D) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Łukasz Stelmach <l.stelmach@samsung.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
> @@ -2570,7 +2570,8 @@ S:	Maintained
>   F:	drivers/media/platform/s5p-jpeg/
>   
>   ARM/SAMSUNG S5P SERIES Multi Format Codec (MFC) SUPPORT
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Marek Szyprowski <m.szyprowski@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> @@ -6254,7 +6255,7 @@ F:	Documentation/devicetree/bindings/display/atmel/
>   F:	drivers/gpu/drm/atmel-hlcdc/
>   
>   DRM DRIVERS FOR BRIDGE CHIPS
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>   M:	Neil Armstrong <narmstrong@baylibre.com>
>   M:	Robert Foss <robert.foss@linaro.org>
>   R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> @@ -16748,13 +16749,15 @@ F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
>   F:	drivers/nfc/s3fwrn5
>   
>   SAMSUNG S5C73M3 CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>   L:	linux-media@vger.kernel.org
>   S:	Supported
>   F:	drivers/media/i2c/s5c73m3/*
>   
>   SAMSUNG S5K5BAF CAMERA DRIVER
> -M:	Andrzej Hajda <a.hajda@samsung.com>
> +M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
> +M:	Andrzej Hajda <andrzej.hajda@intel.com>
>   L:	linux-media@vger.kernel.org
>   S:	Supported
>   F:	drivers/media/i2c/s5k5baf.c

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

