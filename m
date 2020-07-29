Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA830231F87
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A10E6E1D2;
	Wed, 29 Jul 2020 13:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B05C6E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:47:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f1so21158800wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bRPvJSyw2JTOPzvKnyzkrFqkbINXvByLOu9kO4lZmm8=;
 b=hgmkChPzxNLhEWu3FJP0v7VJkIh9iPpSQ83lZ8gqHjZn7odE0pnBpEJTDu4ktC8g/R
 Epu00/gw0njyTFouxK3cjOjL1pIzJ/hL/sMhVLOnTCy9LsPv+fr3d1Gt313cdm+CFJxe
 exA3Cc6MLthm6VTiEkz03QWbUitdx1bX6kDio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bRPvJSyw2JTOPzvKnyzkrFqkbINXvByLOu9kO4lZmm8=;
 b=aHuEaBKIe6dw5Z2/1zPsOYf5SU0zNZl9kSbFLjJ3/pciy+rWVk+Swv6CSXrndXIWBC
 DTLTOgkHsgbHHlQBWJj5bsbYTsYjdal3ywqKVfCdJM3fEhuYod7t7bHZVSJml7Wai7Kb
 iJ+yONvqk0A2w/ODlqCDH7klTOG/vXE+FEPRXghePLNktdFlLX5bXbqmeFa4jtIe/K1z
 +C7JnNnIMvf/wPvPPixBJ9LP0JAmuWFCoQZQKHvpHpVvG2L5IHtlWcdGkYF54/0ux0mR
 bGVcB9ZTFIth76u6ZvI7jkf9v4NAVHRhgWQxHv8dz8lODL9JiLwQeGONbMvZDTSt6PTj
 Manw==
X-Gm-Message-State: AOAM532UUXCrIYFsXZBpIj4y7uDccPo6ao/r/FvpaE27u95yxncwQUvm
 o7x7viE4r0j3HypH3YMKNFnWqQ==
X-Google-Smtp-Source: ABdhPJzCtvAawbxIGJzxO2b39kT18kxwH7OvzxXx6mHcGVtZeFQTGOGDvBSuKUsn4Q0tMcg+NyJLRQ==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr28230928wrf.40.1596030468963; 
 Wed, 29 Jul 2020 06:47:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm5342109wrs.46.2020.07.29.06.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 06:47:48 -0700 (PDT)
Date: Wed, 29 Jul 2020 15:47:46 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 1/5] fbdev: Remove trailing whitespace
Message-ID: <20200729134746.GO6419@phenom.ffwll.local>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729134148.6855-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, natechancellor@gmail.com, sam@ravnborg.org,
 peda@axentia.se, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 03:41:44PM +0200, Thomas Zimmermann wrote:
> Removes trailing whitespaces in several places.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

checkpatch patch for fbdev, I'm blown :-)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbmem.c | 10 +++++-----
>  include/linux/fb.h               | 18 +++++++++---------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 30e73ec4ad5c..dd0ccf35f7b7 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -777,7 +777,7 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>  
>  	if (info->fbops->fb_read)
>  		return info->fbops->fb_read(info, buf, count, ppos);
> -	
> +
>  	total_size = info->screen_size;
>  
>  	if (total_size == 0)
> @@ -842,7 +842,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
>  
>  	if (info->fbops->fb_write)
>  		return info->fbops->fb_write(info, buf, count, ppos);
> -	
> +
>  	total_size = info->screen_size;
>  
>  	if (total_size == 0)
> @@ -1061,7 +1061,7 @@ EXPORT_SYMBOL(fb_set_var);
>  
>  int
>  fb_blank(struct fb_info *info, int blank)
> -{	
> +{
>  	struct fb_event event;
>  	int ret = -EINVAL;
>  
> @@ -1437,7 +1437,7 @@ __releases(&info->lock)
>  	return res;
>  }
>  
> -static int 
> +static int
>  fb_release(struct inode *inode, struct file *file)
>  __acquires(&info->lock)
>  __releases(&info->lock)
> @@ -1627,7 +1627,7 @@ static int do_register_framebuffer(struct fb_info *fb_info)
>  			fb_info->pixmap.access_align = 32;
>  			fb_info->pixmap.flags = FB_PIXMAP_DEFAULT;
>  		}
> -	}	
> +	}
>  	fb_info->pixmap.offset = 0;
>  
>  	if (!fb_info->pixmap.blit_x)
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 2b530e6d86e4..714187bc13ac 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -124,7 +124,7 @@ struct fb_cursor_user {
>   * Register/unregister for framebuffer events
>   */
>  
> -/*	The resolution of the passed in fb_info about to change */ 
> +/*	The resolution of the passed in fb_info about to change */
>  #define FB_EVENT_MODE_CHANGE		0x01
>  
>  #ifdef CONFIG_GUMSTIX_AM200EPD
> @@ -459,12 +459,12 @@ struct fb_info {
>  
>  #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
>  	/* assigned backlight device */
> -	/* set before framebuffer registration, 
> +	/* set before framebuffer registration,
>  	   remove after unregister */
>  	struct backlight_device *bl_dev;
>  
>  	/* Backlight level curve */
> -	struct mutex bl_curve_mutex;	
> +	struct mutex bl_curve_mutex;
>  	u8 bl_curve[FB_BACKLIGHT_LEVELS];
>  #endif
>  #ifdef CONFIG_FB_DEFERRED_IO
> @@ -483,8 +483,8 @@ struct fb_info {
>  		char __iomem *screen_base;	/* Virtual address */
>  		char *screen_buffer;
>  	};
> -	unsigned long screen_size;	/* Amount of ioremapped VRAM or 0 */ 
> -	void *pseudo_palette;		/* Fake palette of 16 colors */ 
> +	unsigned long screen_size;	/* Amount of ioremapped VRAM or 0 */
> +	void *pseudo_palette;		/* Fake palette of 16 colors */
>  #define FBINFO_STATE_RUNNING	0
>  #define FBINFO_STATE_SUSPENDED	1
>  	u32 state;			/* Hardware state i.e suspend */
> @@ -587,11 +587,11 @@ static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
>       *  `Generic' versions of the frame buffer device operations
>       */
>  
> -extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var); 
> -extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var); 
> +extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
> +extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
>  extern int fb_blank(struct fb_info *info, int blank);
> -extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect); 
> -extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area); 
> +extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
> +extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
>  extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
>  /*
>   * Drawing operations where framebuffer is in system RAM
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
