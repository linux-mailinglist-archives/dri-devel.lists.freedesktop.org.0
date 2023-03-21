Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2586C3694
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 17:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72CC10E7D3;
	Tue, 21 Mar 2023 16:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 766E310E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 16:07:33 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8Ax69k81hlk6H8PAA--.22873S3;
 Wed, 22 Mar 2023 00:07:24 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxfb481hlkLMIIAA--.26006S3; 
 Wed, 22 Mar 2023 00:07:24 +0800 (CST)
Message-ID: <4c55aab4-b65e-9c04-7b6d-75a2e89ce530@loongson.cn>
Date: Wed, 22 Mar 2023 00:07:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,8/8] drm/fbdev-generic: Rename symbols
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-9-tzimmermann@suse.de>
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230320150751.20399-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cxfb481hlkLMIIAA--.26006S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtr1xWFW8Xr1xAFWDKw1rZwb_yoWfJw1DpF
 W5GFW5Krs8ta1UWw4DAa4qk34xtrsFyry8Arn5Ga15tF1Utr929F9Yvr1kuF4fJry8GF15
 Jw1YkFWkuF1vkFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWUJVW8JwAS0I0E
 0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
 Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
 6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
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

I have tested this patch on my loongson mips64el machine,
not seeing any weird happens.
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/3/20 23:07, Thomas Zimmermann wrote:
> Rename symbols to match the style of other fbdev-emulation source
> code. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fbdev_generic.c | 66 ++++++++++++++---------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index e7eeba0c44b4..8e5148bf40bb 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -13,7 +13,7 @@
>   #include <drm/drm_fbdev_generic.h>
>   
>   /* @user: 1=userspace, 0=fbcon */
> -static int drm_fbdev_fb_open(struct fb_info *info, int user)
> +static int drm_fbdev_generic_fb_open(struct fb_info *info, int user)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
>   
> @@ -24,7 +24,7 @@ static int drm_fbdev_fb_open(struct fb_info *info, int user)
>   	return 0;
>   }
>   
> -static int drm_fbdev_fb_release(struct fb_info *info, int user)
> +static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
>   
> @@ -34,7 +34,7 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>   	return 0;
>   }
>   
> -static void drm_fbdev_fb_destroy(struct fb_info *info)
> +static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
>   	void *shadow = info->screen_buffer;
> @@ -52,10 +52,10 @@ static void drm_fbdev_fb_destroy(struct fb_info *info)
>   	kfree(fb_helper);
>   }
>   
> -static const struct fb_ops drm_fbdev_fb_ops = {
> +static const struct fb_ops drm_fbdev_generic_fb_ops = {
>   	.owner		= THIS_MODULE,
> -	.fb_open	= drm_fbdev_fb_open,
> -	.fb_release	= drm_fbdev_fb_release,
> +	.fb_open	= drm_fbdev_generic_fb_open,
> +	.fb_release	= drm_fbdev_generic_fb_release,
>   	.fb_read	= drm_fb_helper_sys_read,
>   	.fb_write	= drm_fb_helper_sys_write,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -63,14 +63,14 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>   	.fb_copyarea	= drm_fb_helper_sys_copyarea,
>   	.fb_imageblit	= drm_fb_helper_sys_imageblit,
>   	.fb_mmap	= fb_deferred_io_mmap,
> -	.fb_destroy	= drm_fbdev_fb_destroy,
> +	.fb_destroy	= drm_fbdev_generic_fb_destroy,
>   };
>   
>   /*
>    * This function uses the client API to create a framebuffer backed by a dumb buffer.
>    */
> -static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
> -			      struct drm_fb_helper_surface_size *sizes)
> +static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
> +					     struct drm_fb_helper_surface_size *sizes)
>   {
>   	struct drm_client_dev *client = &fb_helper->client;
>   	struct drm_device *dev = fb_helper->dev;
> @@ -109,7 +109,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   
>   	drm_fb_helper_fill_info(info, fb_helper, sizes);
>   
> -	info->fbops = &drm_fbdev_fb_ops;
> +	info->fbops = &drm_fbdev_generic_fb_ops;
>   	info->flags = FBINFO_DEFAULT;
>   
>   	/* screen */
> @@ -140,9 +140,9 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   	return ret;
>   }
>   
> -static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
> -				       struct drm_clip_rect *clip,
> -				       struct iosys_map *dst)
> +static void drm_fbdev_generic_damage_blit_real(struct drm_fb_helper *fb_helper,
> +					       struct drm_clip_rect *clip,
> +					       struct iosys_map *dst)
>   {
>   	struct drm_framebuffer *fb = fb_helper->fb;
>   	size_t offset = clip->y1 * fb->pitches[0];
> @@ -179,8 +179,8 @@ static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
>   	}
>   }
>   
> -static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
> -				 struct drm_clip_rect *clip)
> +static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
> +					 struct drm_clip_rect *clip)
>   {
>   	struct drm_client_buffer *buffer = fb_helper->buffer;
>   	struct iosys_map map, dst;
> @@ -204,7 +204,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
>   		goto out;
>   
>   	dst = map;
> -	drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
> +	drm_fbdev_generic_damage_blit_real(fb_helper, clip, &dst);
>   
>   	drm_client_buffer_vunmap(buffer);
>   
> @@ -214,7 +214,8 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
>   	return ret;
>   }
>   
> -static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
> +static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
> +					     struct drm_clip_rect *clip)
>   {
>   	struct drm_device *dev = helper->dev;
>   	int ret;
> @@ -223,7 +224,7 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
>   	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>   		return 0;
>   
> -	ret = drm_fbdev_damage_blit(helper, clip);
> +	ret = drm_fbdev_generic_damage_blit(helper, clip);
>   	if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
>   		return ret;
>   
> @@ -236,12 +237,12 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
>   	return 0;
>   }
>   
> -static const struct drm_fb_helper_funcs drm_fb_helper_generic_funcs = {
> -	.fb_probe = drm_fbdev_fb_probe,
> -	.fb_dirty = drm_fbdev_fb_dirty,
> +static const struct drm_fb_helper_funcs drm_fbdev_generic_helper_funcs = {
> +	.fb_probe = drm_fbdev_generic_helper_fb_probe,
> +	.fb_dirty = drm_fbdev_generic_helper_fb_dirty,
>   };
>   
> -static void drm_fbdev_client_unregister(struct drm_client_dev *client)
> +static void drm_fbdev_generic_client_unregister(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   
> @@ -254,14 +255,14 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>   	}
>   }
>   
> -static int drm_fbdev_client_restore(struct drm_client_dev *client)
> +static int drm_fbdev_generic_client_restore(struct drm_client_dev *client)
>   {
>   	drm_fb_helper_lastclose(client->dev);
>   
>   	return 0;
>   }
>   
> -static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
> +static int drm_fbdev_generic_client_hotplug(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   	struct drm_device *dev = client->dev;
> @@ -290,11 +291,11 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>   	return ret;
>   }
>   
> -static const struct drm_client_funcs drm_fbdev_client_funcs = {
> +static const struct drm_client_funcs drm_fbdev_generic_client_funcs = {
>   	.owner		= THIS_MODULE,
> -	.unregister	= drm_fbdev_client_unregister,
> -	.restore	= drm_fbdev_client_restore,
> -	.hotplug	= drm_fbdev_client_hotplug,
> +	.unregister	= drm_fbdev_generic_client_unregister,
> +	.restore	= drm_fbdev_generic_client_restore,
> +	.hotplug	= drm_fbdev_generic_client_hotplug,
>   };
>   
>   /**
> @@ -320,8 +321,7 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>    *
>    * The fbdev is destroyed by drm_dev_unregister().
>    */
> -void drm_fbdev_generic_setup(struct drm_device *dev,
> -			     unsigned int preferred_bpp)
> +void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>   {
>   	struct drm_fb_helper *fb_helper;
>   	int ret;
> @@ -332,15 +332,15 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>   	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>   	if (!fb_helper)
>   		return;
> -	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fb_helper_generic_funcs);
> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_generic_helper_funcs);
>   
> -	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_generic_client_funcs);
>   	if (ret) {
>   		drm_err(dev, "Failed to register client: %d\n", ret);
>   		goto err_drm_client_init;
>   	}
>   
> -	ret = drm_fbdev_client_hotplug(&fb_helper->client);
> +	ret = drm_fbdev_generic_client_hotplug(&fb_helper->client);
>   	if (ret)
>   		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>   

