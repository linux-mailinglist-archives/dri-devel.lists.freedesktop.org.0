Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E91701771
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 15:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1210E0C9;
	Sat, 13 May 2023 13:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id A47A710E0C9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 13:33:38 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:35296.2125776308
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 7478E1002D0;
 Sat, 13 May 2023 21:33:34 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-2qvwx with ESMTP id
 00bb8058f4194826b1ffe8909a1cc8df for 15330273260@189.cn; 
 Sat, 13 May 2023 21:33:35 CST
X-Transaction-ID: 00bb8058f4194826b1ffe8909a1cc8df
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ed8e4fa5-cbda-f1b0-621e-c3bef41405eb@189.cn>
Date: Sat, 13 May 2023 21:33:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/drm_plane.h: fix grammar of the comment
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
References: <20230409131547.494128-1-15330273260@189.cn>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230409131547.494128-1-15330273260@189.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, thanks a lot


On 2023/4/9 21:15, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   include/drm/drm_plane.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..79d62856defb 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -56,7 +56,7 @@ struct drm_plane_state {
>   	/**
>   	 * @crtc:
>   	 *
> -	 * Currently bound CRTC, NULL if disabled. Do not this write directly,
> +	 * Currently bound CRTC, NULL if disabled. Do not write this directly,
>   	 * use drm_atomic_set_crtc_for_plane()
>   	 */
>   	struct drm_crtc *crtc;
