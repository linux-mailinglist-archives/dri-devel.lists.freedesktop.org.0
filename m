Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30D7A9291
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811AE10E4AB;
	Thu, 21 Sep 2023 08:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7A5310E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:26:06 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxl+ga_gtlsoAqAA--.45828S3;
 Thu, 21 Sep 2023 16:26:02 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxzt4O_gtlKSkNAA--.29046S3; 
 Thu, 21 Sep 2023 16:25:57 +0800 (CST)
Message-ID: <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
Date: Thu, 21 Sep 2023 16:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230919131235.759959-1-mripard@kernel.org>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230919131235.759959-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cxzt4O_gtlKSkNAA--.29046S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4DGr4kWFWftw17ZF4fZwc_yoW8KryxpF
 4xJryjvr4rAF4ayr9xC3WxAa45Aa1xZFyfKr9Fgwn5ZFn0yFyUJrnaywn8AFyDJr1xCr4x
 trn3Gry3uF4S9FcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/19 21:12, Maxime Ripard wrote:
> We've had a number of times when a patch slipped through and we couldn't
> pick them up either because our MAINTAINERS entry only covers the
> framework and thus we weren't Cc'd.
>
> Let's take another approach where we match everything, and remove all
> the drivers that are not maintained through drm-misc.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   MAINTAINERS | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..757d4f33e158 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
>   S:	Maintained
>   W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/
> +F:	Documentation/devicetree/bindings/gpu/
>   F:	Documentation/gpu/
> -F:	drivers/gpu/drm/*
> +F:	drivers/gpu/drm/
>   F:	drivers/gpu/vga/
> -F:	include/drm/drm*
> +F:	include/drm/drm
>   F:	include/linux/vga*
> -F:	include/uapi/drm/drm*
> +F:	include/uapi/drm/
> +X:	drivers/gpu/drm/amd/
> +X:	drivers/gpu/drm/armada/
> +X:	drivers/gpu/drm/etnaviv/
> +X:	drivers/gpu/drm/exynos/
> +X:	drivers/gpu/drm/gma500/
> +X:	drivers/gpu/drm/i915/
> +X:	drivers/gpu/drm/imx/
> +X:	drivers/gpu/drm/ingenic/
> +X:	drivers/gpu/drm/kmb/
> +X:	drivers/gpu/drm/mediatek/
> +X:	drivers/gpu/drm/msm/
> +X:	drivers/gpu/drm/nouveau/
> +X:	drivers/gpu/drm/radeon/
> +X:	drivers/gpu/drm/renesas/
> +X:	drivers/gpu/drm/tegra/
>   
>   DRM DRIVERS FOR ALLWINNER A10
>   M:	Maxime Ripard <mripard@kernel.org>


Nice patch!

Well, I'm just curious about why the drm/ingenic and drm/gma500 are not maintained through drm-misc?

As far as I know:
1) the drm/ingenic driver don't have a "T" annotation (location of the link).
2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-gma500", but the code for this link is not up to date.

I think at least the drm/ingenic and drm/gma500 drivers are *actually* maintained through drm-misc,
So perhaps, these two drivers should not be excluded. Am I correct?

