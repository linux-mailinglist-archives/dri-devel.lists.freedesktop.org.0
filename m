Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6DA747AF4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 03:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5FD10E0B1;
	Wed,  5 Jul 2023 01:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6BC810E0B1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 01:25:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxCPJ0xqRklC0AAA--.1045S3;
 Wed, 05 Jul 2023 09:25:08 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxniNtxqRki8kbAA--.44387S3; 
 Wed, 05 Jul 2023 09:25:01 +0800 (CST)
Message-ID: <d1c0702f-e16d-1edd-19a4-1bdc2def14ab@loongson.cn>
Date: Wed, 5 Jul 2023 09:25:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [05/12] arch: Remove trailing whitespaces
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-6-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxniNtxqRki8kbAA--.44387S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryxAr17Ww18uw15tw15WrX_yoW5Wr1UpF
 WDCw1kGryDWFsYyF1xJ348uFWSgws7tFW3uryDK34UAr90vryjvrykt3Z3A34DGrnrCFW0
 g3yrWF4jg3WrAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
 XVW3AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
 JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUn
 bAw7UUUUU==
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Zi Yan <ziy@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 linux-mips@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   arch/ia64/Kconfig | 4 ++--
>   arch/sh/Kconfig   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 21fa63ce5ffc0..e79f15e32a451 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -260,7 +260,7 @@ config PERMIT_BSP_REMOVE
>   	default n
>   	help
>   	Say Y here if your platform SAL will support removal of BSP with HOTPLUG_CPU
> -	support.
> +	support.
>   
>   config FORCE_CPEI_RETARGET
>   	bool "Force assumption that CPEI can be re-targeted"
> @@ -335,7 +335,7 @@ config IA64_PALINFO
>   config IA64_MC_ERR_INJECT
>   	tristate "MC error injection support"
>   	help
> -	  Adds support for MC error injection. If enabled, the kernel
> +	  Adds support for MC error injection. If enabled, the kernel
>   	  will provide a sysfs interface for user applications to
>   	  call MC error injection PAL procedures to inject various errors.
>   	  This is a useful tool for MCA testing.
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9652d367fc377..04b9550cf0070 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -234,7 +234,7 @@ config CPU_SUBTYPE_SH7201
>   	select CPU_SH2A
>   	select CPU_HAS_FPU
>   	select SYS_SUPPORTS_SH_MTU2
> -
> +
>   config CPU_SUBTYPE_SH7203
>   	bool "Support SH7203 processor"
>   	select CPU_SH2A
> @@ -496,7 +496,7 @@ config CPU_SUBTYPE_SH7366
>   endchoice
>   
>   source "arch/sh/mm/Kconfig"
> -
> +
>   source "arch/sh/Kconfig.cpu"
>   
>   source "arch/sh/boards/Kconfig"
> @@ -647,7 +647,7 @@ config GUSA
>   	  This is the default implementation for both UP and non-ll/sc
>   	  CPUs, and is used by the libc, amongst others.
>   
> -	  For additional information, design information can be found
> +	  For additional information, design information can be found
>   	  in <http://lc.linux.or.jp/lc2002/papers/niibe0919p.pdf>.
>   
>   	  This should only be disabled for special cases where alternate

