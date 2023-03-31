Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA16D1D04
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856810F1B0;
	Fri, 31 Mar 2023 09:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFC1610F1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:53:47 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:45304.2063674795
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 1102A10029A;
 Fri, 31 Mar 2023 17:53:44 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 0655c27cd79b46139a99f1ff48e000de for tzimmermann@suse.de; 
 Fri, 31 Mar 2023 17:53:46 CST
X-Transaction-ID: 0655c27cd79b46139a99f1ff48e000de
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <b18de34f-b1b0-65ab-78e6-df777a1e96d0@189.cn>
Date: Fri, 31 Mar 2023 17:53:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [02/15] fbdev/atmel_lcdfb: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
References: <20230331092314.2209-3-tzimmermann@suse.de>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230331092314.2209-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
<mailto:suijingfeng@loongson.cn>>

On 2023/3/31 17:23, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/atmel_lcdfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 8187a7c4f910..987c5f5f0241 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -317,7 +317,7 @@ static inline void atmel_lcdfb_free_video_memory(struct atmel_lcdfb_info *sinfo)
>   /**
>    *	atmel_lcdfb_alloc_video_memory - Allocate framebuffer memory
>    *	@sinfo: the frame buffer to allocate memory for
> - * 	
> + *
>    * 	This function is called only from the atmel_lcdfb_probe()
>    * 	so no locking by fb_info->mm_lock around smem_len setting is needed.
>    */
