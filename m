Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB35288F3A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 18:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEA86ED4A;
	Fri,  9 Oct 2020 16:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4786ED4A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 16:54:40 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id u8so14089259ejg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJC/63N4sKr+NVEjyOB3NpKEHLk2BP4nYeyPTl4VVyg=;
 b=xBH3VeOHBk2wcPwYmcPN+QcrsTq3mjGXByd/sK68z4Z12XxuiXrqj0NzXXNattDnes
 7zUD7NrRxLU+BqwBa9sj54sqyxdG5+/HiOjGKNMSNVOz9gmKu2zDlkJdv9tGtDracFJt
 Dj1HUFNrxIdAvB6l5Kgb7X3Ly/mGSlMpu2AUvmFJnehhjElTETgG7bY7nJ8GdzaArzf8
 pCoLDLfahaTxCl5oaTxwZIN8Mcq9aP2foyOSIBl1HQOJiL528h0aCQYYVDvMMLaBUukC
 Gg1MfO74SEAH3EJedFnmeR7/kOoOvh09JduSve24PVcrOjGIBk6lJsKfyHkKJGqRSn6P
 ZRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJC/63N4sKr+NVEjyOB3NpKEHLk2BP4nYeyPTl4VVyg=;
 b=T3Hi5GLzi4UvAi/do5gbxySsSjEjkW5WZ41uKMSEf6z4v1gmyn0ogNnozsXdt/L6yV
 fLyWdU5rrJbLidyej4olMAq+i3i2PsmSL/Ju2p/Uj0AFQUe0TcudtkrPt6YpoyRt+kc9
 igptqFbpQsgByxp4AOD0P0rBVYSt190mX5xeMIMz5vjDo4t6lUKemvKadOWZiFcAvlF8
 iywB0l7ePht75i6ks44qdknBAW8RQQ9QJLSydOqiyc3o2t1iO1EZGCqvxOUk9ozAlLnS
 ijujOs5eEyf2GIHcp9vB36s492qsD5UARlb6s2b39TDOud7aix3GT39JUHy9dV43QRcb
 g9iw==
X-Gm-Message-State: AOAM532U7gBrfyRd8QDqNkBfZNDMkNq9Y67H92hlhwR/xX21I3QNqvAI
 ndpKWAQ1HvPqMWlke70OqyowjL8AVF0eNJcsCp/2kA==
X-Google-Smtp-Source: ABdhPJzjr3C/SOrADeMJQ4jarIKWV0cJnZmcKK7VCnXv1L/kpc9xCeERYolBHEJ4pHdc5IjdZMkG0c20fYaY3mRIdS4=
X-Received: by 2002:a17:906:6d0c:: with SMTP id
 m12mr15168072ejr.498.1602262478928; 
 Fri, 09 Oct 2020 09:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201009074952.11345-1-maxime@cerno.tech>
In-Reply-To: <20201009074952.11345-1-maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 9 Oct 2020 09:54:28 -0700
Message-ID: <CADaigPVccAupWYJtDKm=LikQbsdqDkkEg6HyoYkpi_8=gcc=zQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a maintainer for vc4
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Eric Anholt <eric@anholt.net>

I'd be fine with retiring from being maintainer, too.  I'm definitely
not active.

On Fri, Oct 9, 2020 at 12:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Eric isn't working on vc4 anymore and I've been working on it, as well as
> merging patches for it, recently so let's make it official so I don't miss
> patches.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91d46806e511..a248e3a2b537 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5957,6 +5957,7 @@ F:        include/uapi/drm/v3d_drm.h
>
>  DRM DRIVERS FOR VC4
>  M:     Eric Anholt <eric@anholt.net>
> +M:     Maxime Ripard <mripard@kernel.org>
>  S:     Supported
>  T:     git git://github.com/anholt/linux
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
